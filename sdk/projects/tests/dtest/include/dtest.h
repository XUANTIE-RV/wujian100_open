/*
 * Copyright (C) 2017 The iot.kt Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef IOT_KT_UNIT_TEST_H_
#define IOT_KT_UNIT_TEST_H_

#include <stdbool.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    const char *name;
    void (*init)(void);
    void (*cleanup)(void);
    void (*setup)(void);
    void (*teardown)(void);
} dtest_suite_info_t;

typedef struct {
    const char *name;
    void (*proc)(void);
    bool bopen;
} dtest_case_info_t;

typedef struct dtest_suite_s dtest_suite_t;

void dtest_init(void);
void dtest_cleanup(void);

dtest_suite_t *dtest_add_suite(dtest_suite_info_t *info);

int dtest_add_cases(dtest_suite_t *test_suite, dtest_case_info_t info_array[]);

void dtest_run(void);
void dtest_run_cmd(char *cmd);
void dtest_register_cb(void *cb);
void dtest(void);

void dtest_print_result(void);
void dtest_add_success_case(void);
void dtest_add_failure_case(void);
void dtest_printf(const char *fmt, ...);

void dtest_perform_report_init(void);
void dtest_perform_report_append(const char *format, ...);
void dtest_perform_report_print(void);

#ifdef CONFIG_SYSLOG_COLORFUL
#define LOG_COLOR_RED            "\033[2;31;49m"
#define LOG_COLOR_RESET          "\033[0m"
#else
#define LOG_COLOR_RED
#define LOG_COLOR_RESET
#endif

#define ASSERT_IMPL(result, file, line, fmt, ...) \
    do { \
        if (result) { \
            dtest_add_success_case(); \
        } else { \
            dtest_add_failure_case(); \
            dtest_printf(LOG_COLOR_RED "%s:%d " fmt LOG_COLOR_RESET"\n", \
                         file, line, __VA_ARGS__); \
        } \
    } while (0)

#define ASSERT_TRUE(expr) \
    do { \
        bool result = (expr); \
        ASSERT_IMPL(result, __FILE__, __LINE__,\
                    "%s Expected true, actual %d", \
                    #expr, result); \
    } while (0)

#define ASSERT_FALSE(expr) \
    do { \
        bool result = !(expr); \
        ASSERT_IMPL(result, __FILE__, __LINE__,\
                    "%s Expected false, actual %d", \
                    #expr, result); \
    } while (0)

#define ASSERT_STR_EQ(actual, expect) \
    do { \
        bool result = !strcmp(actual, expect); \
        ASSERT_IMPL(result, __FILE__, __LINE__, \
                    #expect"=="#actual " Expected %s, actual %s", \
                    expect, actual); \
    } while (0)

#define ASSERT_STR_NOT_EQ(actual, expect) \
    do { \
        bool result = strcmp(actual, expect); \
        ASSERT_IMPL(result, __FILE__, __LINE__, \
                    #expect"!="#actual" %s equals with %s", \
                    expect, actual); \
    } while (0)

#define ASSERT_STR_N_EQ(actual, expect, n) \
    do { \
        bool result = !strncmp(actual, expect, n); \
        ASSERT_IMPL(result, __FILE__, __LINE__, \
                    #expect"=="#actual " Expected %s, actual %s", \
                    expect, actual); \
    } while (0)

#define ASSERT_PTR_EQ(actual, expect) \
    do { \
        bool result = (actual == expect); \
        ASSERT_IMPL(result, __FILE__, __LINE__, \
                    #expect"=="#actual" Expected %p, actual %p", \
                    expect, actual); \
    } while (0)

#define ASSERT_PTR_NOT_EQ(actual, expect) \
    do { \
        bool result = (actual != expect); \
        ASSERT_IMPL(result, __FILE__, __LINE__, \
                    #expect"!="#actual" %p equals with %p", \
                    expect, actual); \
    } while (0)

#ifdef __cplusplus
}
#endif

#endif /* IOT_KT_UNIT_TEST_H_ */
