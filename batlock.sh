#!/bin/bash

#sudo s2disk && slock
touch /home/dasmoep/.lock.log
date > /home/dasmoep/.lock.log
sudo echo Stopping for a halt>>/home/dasmoep/.lock.log
slock& 
sudo s2disk
echo Welcome Back>>/home/dasmoep/.lock.log
wait
kill -9 $PPID
