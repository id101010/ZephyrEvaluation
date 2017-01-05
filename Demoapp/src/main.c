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
#include <sensor.h>
#include <gpio.h>

#define DEBUG
#define PORT            "GPIO_0"
#define SENSOR          "DHT11"

#define DHT11_PIN       0
#define LED1            17
#define LED2            18
#define LED3            19
#define LED4            20

#define SLEEP_TIME      1000

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

    // Configure gpios
    struct device *gpio = device_get_binding(PORT);
    // Test if gpio binding has been created
    if(!gpio){
        debug("GPIO Error!");
        return;
    }

    // Configure Sensor
    struct device *sensor = device_get_binding(SENSOR);
    // Test if sensor binding has been created
    if(!sensor){
        debug("Sensor Error!");
        return;
    }

    // Configure LEDS as output
    gpio_pin_configure(gpio, LED1, GPIO_DIR_OUT);
    gpio_pin_configure(gpio, LED2, GPIO_DIR_OUT);
    gpio_pin_configure(gpio, LED3, GPIO_DIR_OUT);
    gpio_pin_configure(gpio, LED4, GPIO_DIR_OUT);

    // Configure sensor pin as input
    //gpio_pin_configure(sensor, DHT11_PIN, GPIO_DIR_IN);

    while (1) {
        //struct sensor_value temp;
        int rc;

        rc = sensor_sample_fetch(sensor);
        if(rc != 0){
            debug("sensor_sample_fetch error.");
            return;
        }

        //rc = sensor_channel_get(sensor, SENSOR_CHAN_TEMP, &temp);        
        if(rc != 0){
            debug("sensor_channel_get error.");
            return;
        }

        //printk("temp: %d.%06d\n", temp.val1, temp.val2);

        k_sleep(SLEEP_TIME);
    }
}
