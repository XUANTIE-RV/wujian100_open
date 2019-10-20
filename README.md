# wujian100_open
    wujian100_open is a MCU base SoC. We can simulate by EDA tools and emulate by FPGA. Also we can develop the IPs and software in this platform. We wish more and more developers building the open MCU ecosystem with T-Head. IC design and development should be faster simpler and more reliable
    
    Directory Structure
    |--Project                //open source project work directory  
      |--riscv_toolchain      //tool chain install directory download from t-head.cn
      |--wujian100_open       //wujian100_open project get from github
        |--case               //test case example for simulation
        |--doc                //wujian100_open user guide
        |--fpga               //FPGA script
        |--lib                //compile script for simulation
        |--regress            //regression result
        |--sdk                //software design kit
        |--soc                //Soc RTL source code
        |--tb                 //test bench
        |--tools              //simulation script and setup file
        |--workdir            //simulation directory
        |--LICENSE
        |--README.md
# Use Tools Version:
    VCS: vcs_vD-2010.06
    Verdi: novas_201004
    Synplify: Synplify_J-2015.03
    Vivado: Vivadoi_2015.3
    Compiler: C-SKY RISCV Tools V1.2.2 B20190731  
# Get Start
    1. prepare a project work directory just like 'Project'
    2. cd Project
    3. git clone https://github.com/T-head-Semi/wujian100_open.git or git clone git@github.com:T-head-Semi/wujian100_open.git
# Download C/C++ Compiler
    1. prepare a tool chain install directory named 'riscv_toolchain'  // use the c shell command like 'mkdir riscv_toolchain'
    2. download the tool chain from the url https://www.t-head.cn/product/mcu-platform?spm=a2ouz.12987052.0.0.167548abiiSAQs
    3. install the tool chain to the riscv_toolchain dirctory
# Get ready for simulation
    1. cd wujian100_open/tools
    2. vim setup.csh then add the vcs path and license
    3. source setup.csh
    4. cd wujian100_open/workdir
    5. chmod 777 run_case Src2vmem
    6. execute the command '../tools/run_case ../case/timer/timer_test.c'
# Get ready for FPGA bit generation
    1. make sure you have the synplify and license
    2. cd wujian100_open/fpga/synplify
    3. execute the synplify and load the wujian100_open_200t_3b.prj file
    4. input the command 'sdc2fdc' in synplify
    5. start the synplify
    6. after synplify generated the netlist we will use vivado for P&R and generated the bit file
    7. make sure you have the vivado and licese
    8. cd wujian100_open/fpga/vivado
    9. run tcl use file 'wujian100_open_200t_3b_prj.tcl'
    10. program the bit file to the fpga board
    11. enjoy the application development
# How to get the FPGA
    apply from the url https://www.t-head.cn/product/mcu-platform?spm=a2ouz.12987052.0.0.167548abiiSAQs
# How to get the debug tool
    download from the url https://www.t-head.cn/product/mcu-platform?spm=a2ouz.12987052.0.0.167548abiiSAQs 
# How to get the IDE for development
    download from the url https://www.t-head.cn/product/mcu-platform?spm=a2ouz.12987052.0.0.167548abiiSAQs   
# Reference  and Thanks
    The program model of GPIO refer to the DesignWare of Synopsys 
    The program model of Timer refer to the DesignWare of Synopsys 
    The program model of WDT refer to the DesignWare of Synopsys 
