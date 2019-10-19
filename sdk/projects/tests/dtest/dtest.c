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

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "dtest.h"

typedef struct dtest_case_s {
    struct dtest_case_s *next;
    const char *name;
    void (*proc)(void);
    bool bopen;
} dtest_case_t;

struct dtest_suite_s {
    struct dtest_suite_s *next;
    const char *name;
    void (*init)(void);
    void (*cleanup)(void);
    void (*setup)(void);
    void (*teardown)(void);
    dtest_case_t list;
};

typedef struct {
    dtest_suite_t list;
    uint32_t success_cases;
    uint32_t failure_cases;
} dtest_context_t;

static dtest_context_t context;

void (*dtest_cb)(void);

void dtest_register_cb(void *cb)
{
    dtest_cb = (void (*)(void))cb;
}

void dtest(void)
{
    dtest_init();

    (*dtest_cb)();

    dtest_run();

    dtest_print_result();

    dtest_cleanup();
}

void dtest_init(void)
{
    memset(&context, 0, sizeof(dtest_context_t));
}

void dtest_cleanup(void)
{
    dtest_suite_t *test_suite = context.list.next;

    while (test_suite != NULL) {
        dtest_case_t *test_case = test_suite->list.next;

        while (test_case != NULL) {
            dtest_case_t *next_case = test_case->next;
            free(test_case);
            test_case = next_case;
        }

        dtest_suite_t *next_suite = test_suite->next;
        free(test_suite);
        test_suite = next_suite;
    }
}

dtest_suite_t *dtest_add_suite(dtest_suite_info_t *info)
{
    dtest_suite_t *test_suite = calloc(sizeof(dtest_suite_t), 1);

    if (test_suite == NULL) {
        return NULL;
    }

    test_suite->name = info->name;
    test_suite->init = info->init;
    test_suite->cleanup = info->cleanup;
    test_suite->setup = info->setup;
    test_suite->teardown = info->teardown;

    test_suite->next = context.list.next;
    context.list.next = test_suite;

    return test_suite;
}

int dtest_add_cases(dtest_suite_t *test_suite, dtest_case_info_t info_array[])
{
    if (test_suite == NULL) {
        return -1;
    }

    int i;

    for (i = 0;; i++) {
        if (info_array[i].proc == NULL) {
            break;
        }

        dtest_case_t *test_case = calloc(sizeof(dtest_case_t), 1);

        if (test_case == NULL) {
            return -1;
        }

        test_case->name = info_array[i].name;
        test_case->proc = info_array[i].proc;
        test_case->bopen = info_array[i].bopen;

        test_case->next = test_suite->list.next;
        test_suite->list.next = test_case;
    }

    return 0;
}

void dtest_run(void)
{
    dtest_suite_t *test_suite = context.list.next;

    while (test_suite != NULL) {
        dtest_printf("* Run test suite %s ...\n", test_suite->name);

        if (test_suite->init != NULL) {
            test_suite->init();
        }

        dtest_case_t *test_case = test_suite->list.next;

        while (test_case != NULL) {
            if (test_case->bopen) {
                dtest_printf("*   Run test case %s ...\n", test_case->name);

                if (test_suite->setup != NULL) {
                    test_suite->setup();
                }

                test_case->proc();

                if (test_suite->cleanup != NULL) {
                    test_suite->cleanup();
                }
            }

            test_case = test_case->next;
        }

        if (test_suite->teardown != NULL) {
            test_suite->teardown();
        }

        test_suite = test_suite->next;
    }
}

static void dtest_print_cases(void)
{
    dtest_suite_t *test_suite = context.list.next;

    while (test_suite != NULL) {
        dtest_printf("test suite: %s\n", test_suite->name);

        dtest_case_t *test_case = test_suite->list.next;

        while (test_case != NULL) {
            dtest_printf("  test case: %s\n", test_case->name);
            test_case = test_case->next;
        }

        test_suite = test_suite->next;
    }
}

void dtest_run_cmd(char *cmd)
{
    dtest_suite_t *test_suite = context.list.next;

    if (!strcmp("help", cmd)) {
        dtest_print_cases();
        return;
    }

    if (!strcmp("all", cmd)) {
        dtest_run();
        return;
    }

    while (test_suite != NULL) {
        if (!strcmp(test_suite->name, cmd)) {
            dtest_printf("* Run test suite %s ...\n", test_suite->name);

            if (test_suite->init != NULL) {
                test_suite->init();
            }
        }

        dtest_case_t *test_case = test_suite->list.next;

        while (test_case != NULL) {
            if (!strcmp(test_suite->name, cmd)
                || !strcmp(test_case->name, cmd)) {
                if (test_case->bopen) {
                    dtest_printf("*   Run test case %s ...\n", test_case->name);
                }

                if (test_suite->setup != NULL) {
                    test_suite->setup();
                }

                if (test_case->bopen) {
                    test_case->proc();
                }

                if (test_suite->cleanup != NULL) {
                    test_suite->cleanup();
                }
            }

            test_case = test_case->next;
        }

        if (!strcmp(test_suite->name, cmd)) {
            if (test_suite->cleanup != NULL) {
                test_suite->cleanup();
            }
        }

        test_suite = test_suite->next;
    }
}

void dtest_print_result(void)
{
    int total = context.success_cases + context.failure_cases;
    printf("\n-----------------------------------\n");
    printf("\nThe test results are as follows:\n");
    printf("\tsuccess cases : %u / %u\n", context.success_cases, total);
    printf("\tfailure cases : %u / %u\n", context.failure_cases, total);
    printf("\n-----------------------------------\n");
}

void dtest_add_success_case(void)
{
    context.success_cases++;
}

void dtest_add_failure_case(void)
{
    context.failure_cases++;
}

void dtest_printf(const char *fmt, ...)
{
    va_list args;

    va_start(args, fmt);

    vprintf(fmt, args);

    va_end(args);
}

static char perform_report_str[1024];
static int  perform_report_len = 0;
void dtest_perform_report_init(void)
{
    perform_report_str[0] = '\0';
    perform_report_len = 0;
}

void dtest_perform_report_append(const char *format, ...)
{
    va_list arg_ptr;
    va_start(arg_ptr, format);
    vprintf(format, arg_ptr);
    perform_report_len += vsprintf((char *)(&perform_report_str[perform_report_len]),
                                   format, arg_ptr);
    va_end(arg_ptr);
}

void dtest_perform_report_print(void)
{
    printf("\n---- The performance reports are below ----\n");
    printf("%s", perform_report_str);
}
