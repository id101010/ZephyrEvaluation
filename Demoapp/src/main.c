/*
 * Copyright (c) 2016 Intel Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <zephyr.h>
#include <misc/printk.h>
#include <board.h>
#include <device.h>
#include <gpio.h>

#define DEBUG
#define PORT        "GPIO_0"

#define LED1         17
#define LED2         18
#define LED3         19
#define LED4         20

#define SLEEP_TIME  100

// Debug using serial terminal
void debug(const char *message)
{
#ifdef DEBUG
    printk("[\e[1;31mDEBUG\e[0m] %s\n", message);
#endif
}

void main(void)
{
    debug("Started program.");

    int cnt = 0;

    // Configure gpio
    struct device *dev;
    dev = device_get_binding(PORT);
    gpio_pin_configure(dev, LED1, GPIO_DIR_OUT);
    gpio_pin_configure(dev, LED2, GPIO_DIR_OUT);
    gpio_pin_configure(dev, LED3, GPIO_DIR_OUT);
    gpio_pin_configure(dev, LED4, GPIO_DIR_OUT);

    while (1) {
        debug("Main cycle.");
        printk("Cycle: %d\n", cnt);
        
        gpio_pin_write(dev, LED1, (cnt % 2));
        gpio_pin_write(dev, LED2, (cnt % 3));
        gpio_pin_write(dev, LED3, (cnt % 4));
        gpio_pin_write(dev, LED4, (cnt % 5));
        
        k_sleep(SLEEP_TIME);
        cnt++;
    }
}
