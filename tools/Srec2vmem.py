#!/usr/bin/env python

#Copyright (c) 2019 Alibaba Group Holding Limited
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import sys
import getopt
import os.path
import re

help_msg = "Srec2vmem.py -i <ifile_path> -o <ofile_path> -s <skip_mode>\n"

class argv_info:
    def __init__(self, argv):
        try:
            opts, args = getopt.getopt(argv, "hi:o:s", ["ifile=", "ofile=", "smode="])
        except getopt.GetoptError:
            print(help_msg)
       
        #=== default member vars value ===            
        skip_mode = "n"
        
        #=== get member vars ===            
        for opt, arg in opts:
            if opt == '-h':
                print(help_msg)
                sys.exit()
            elif opt in ("-i", "--ifile"):
                ifile_path = arg
                if not os.path.isfile(ifile_path):
                    print("%s is not a file!\n" %ifile_path)
                    sys.exit()
                #print("ifile_path:%s\n" %ifile_path)
            elif opt in ("-o", "--ofile"):
                ofile_path = arg
            elif opt in ("-s", "--smode"):
                skip_mode = arg

        #=== init member vars ===            
        self.ifile_path = ifile_path
        self.ofile_path = ofile_path
        self.skip_mode  = skip_mode

    def __str__(self):
        return "ifile_path:%s\nofile_path:%s\nskip_mode:%s" %(self.ifile_path, self.ofile_path, self.skip_mode)

def hex2vmem(o_argv_info):
    ifile_path = o_argv_info.ifile_path
    ofile_path = o_argv_info.ofile_path
    skip_mode  = o_argv_info.skip_mode

    ifile_id = open(ifile_path, 'r')
    ofile_id = open(ofile_path, 'w')

    char_bit_num  = 4
    byte_char_num = 2
    record_type_chars = 2
    line_byte_chars   = 2
    check_sum_chars   = 2
    line_addr_num = 4
    dat_split_unit = 8
    get_base_addr  = False
    base_addr = 0

    cur_line_idx = 0
    prev_mem_addr = -1
    while True:
        cur_line = ifile_id.readline()
        if not cur_line:
            break

        match_obj = re.match(r'^(S\d)(\w{2})', cur_line)
        if not match_obj:
            print("[ERROR][%s][%d] not match file format:%s\n" %(ifile_path, cur_line_idx + 1, cur_line))
            sys.exit()

        record_type = match_obj.group(1)
        line_bytes  = int(("0x" + match_obj.group(2)), 16)

        if record_type == "S0":
            #print("[INFO] file header:%s\n" %cur_line)
            continue
        elif record_type == "S1":
            addr_bits = 16
            end_mark  = "S9"
        elif record_type == "S2":
            addr_bits = 24
            end_mark  = "S8"
        elif record_type == "S3":
            addr_bits = 32
            end_mark  = "S7"
        elif record_type == "S4":
            print("[ERROR] get reserved record_type:%s\n" %record_type)
            sys.exit()
        elif record_type == "S5":
            print("[ERROR] get reserved record_type, 16bit count:%s\n" %record_type)
            sys.exit()
        elif record_type == "S6":
            print("[ERROR] get reserved record_type, 24bit count:%s\n" %record_type)
            sys.exit()
        elif record_type == "S7" or record_type == "S8" or record_type == "S9":
            #print("[INFO] end of file:%s\n" %cur_line)
            if record_type != end_mark:
                print("[ERROR] end of file not match, record_type:%s, end_mark:%s\n" %(record_type, end_mark))
                sys.exit()
            #=== close files ===
            ifile_id.close()
            ofile_id.close()
            break

        addr_chars = int(addr_bits / char_bit_num)

        line_addr_idx = record_type_chars + line_byte_chars
        line_addr_end = line_addr_idx + addr_chars

        data_chars = (line_bytes * byte_char_num) - addr_chars - check_sum_chars
        line_data_idx = line_addr_end
        line_data_end = line_data_idx + data_chars

        #print("addr_chars:%d" %addr_chars)
        #print("line_addr_idx:%d" %line_addr_idx)
        #print("line_addr_end:%d" %line_addr_end)
        #print("line_data_len:%d" %line_data_len)
        #print("line_data_idx:%d" %line_data_idx)
        #print("line_data_end:%d" %line_data_end)
        
        line_addr = cur_line[line_addr_idx:line_addr_end]
        line_data = cur_line[line_data_idx:line_data_end]

        line_addr = int(("0x" + line_addr), 16)

        #print("line_addr:%s" %line_addr)
        #print("line_data:%s" %line_data)

        if not get_base_addr:
            base_addr = line_addr
            get_base_addr = True
            
        line_addr = line_addr - base_addr

        cur_mem_addr = int(line_addr / 4)
        
        if prev_mem_addr == -1:
            prev_mem_addr = cur_mem_addr

        #print ("skip_mode:%s, prev_mem_addr:%08x, cur_mem_addr:%08x" %(skip_mode, prev_mem_addr, cur_mem_addr))
        if skip_mode == "n":
            mem_addr_incr = cur_mem_addr - prev_mem_addr
            if mem_addr_incr > 1:
                add_mem_addr = prev_mem_addr
                add_mem_data = "00000000"
                for i in range(mem_addr_incr - 1):
                    ofile_id.write("@%08x %s\n" %(add_mem_addr, add_mem_data))
                    add_mem_addr = add_mem_addr + 1
        
        for i in range(line_addr_num):
            cur_mem_idx = i * dat_split_unit
            cur_mem_end = (i + 1) * dat_split_unit

            if cur_mem_end > data_chars:
                cur_mem_data = "00000000"
            else:
                cur_mem_data = line_data[cur_mem_idx:cur_mem_end].lower()
            
            ofile_id.write("@%08x %s\n" %(cur_mem_addr, cur_mem_data))
            cur_mem_addr = cur_mem_addr + 1

        prev_mem_addr = cur_mem_addr
        cur_line_idx += 1

def main(argv):
    o_argv_info = argv_info(argv)
    hex2vmem(o_argv_info)

if __name__ == "__main__":
    main(sys.argv[1:])

