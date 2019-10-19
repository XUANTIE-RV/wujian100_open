/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     task_test.h
 * @brief     head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef TASK_TEST_H
#define TASK_TEST_H
#ifdef __cplusplus
extern "C" {
#endif


#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("task test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)


#ifdef __cplusplus
}
#endif

#endif /* TASK_TEST_H */

