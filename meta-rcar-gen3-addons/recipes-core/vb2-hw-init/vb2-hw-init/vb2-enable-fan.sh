#!/bin/sh

#enable write
echo 1   > /sys/class/hwmon/$1/pwm1_enable

echo 45000 > /sys/class/hwmon/$1/pwm1_auto_point1_temp
echo 50000 > /sys/class/hwmon/$1/pwm1_auto_point2_temp
echo 55000 > /sys/class/hwmon/$1/pwm1_auto_point3_temp
echo 60000 > /sys/class/hwmon/$1/pwm1_auto_point4_temp
echo 65000 > /sys/class/hwmon/$1/pwm1_auto_point5_temp
echo 70000 > /sys/class/hwmon/$1/pwm1_auto_point6_temp
echo 75000 > /sys/class/hwmon/$1/pwm1_auto_point7_temp
echo 80000 > /sys/class/hwmon/$1/pwm1_auto_point8_temp
echo 80000 > /sys/class/hwmon/$1/pwm1_auto_point9_temp
echo 95000 > /sys/class/hwmon/$1/pwm1_auto_point10_temp
echo 100000 > /sys/class/hwmon/$1/pwm1_auto_point11_temp
echo 105000 > /sys/class/hwmon/$1/pwm1_auto_point12_temp

echo 110 > /sys/class/hwmon/$1/pwm1_auto_point1_pwm
echo 120 > /sys/class/hwmon/$1/pwm1_auto_point2_pwm
echo 130 > /sys/class/hwmon/$1/pwm1_auto_point3_pwm
echo 140 > /sys/class/hwmon/$1/pwm1_auto_point4_pwm
echo 150 > /sys/class/hwmon/$1/pwm1_auto_point5_pwm
echo 170 > /sys/class/hwmon/$1/pwm1_auto_point6_pwm
echo 190 > /sys/class/hwmon/$1/pwm1_auto_point7_pwm
echo 210 > /sys/class/hwmon/$1/pwm1_auto_point8_pwm
echo 220 > /sys/class/hwmon/$1/pwm1_auto_point9_pwm
echo 230 > /sys/class/hwmon/$1/pwm1_auto_point10_pwm
echo 240 > /sys/class/hwmon/$1/pwm1_auto_point11_pwm
echo 255 > /sys/class/hwmon/$1/pwm1_auto_point12_pwm

#enable auto mode
echo 2   > /sys/class/hwmon/$1/pwm1_enable