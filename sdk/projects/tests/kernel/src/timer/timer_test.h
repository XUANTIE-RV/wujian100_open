/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     timer_test.h
 * @brief    the head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef TIMER_TEST_H
#define TIMER_TEST_H
#ifdef __cplusplus
extern "C" {
#endif


#define TASK_TEST_STACK_SIZE 1024

#define TIMER_VAL_CHK(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        {printf("timer test is [FAIL %d], func %s, line %d\n", \
                (int)++test_case_fail,__FUNCTION__, __LINE__);}}while(0)

k_status_t task_timer_create_del_test(void);
k_status_t task_timer_start_stop_test(void);

#ifdef __cplusplus
}
#endif

#endif /* TIMER_TEST_H */
