#!/usr/bin/env python
 
from time import sleep
import os
import RPi.GPIO as GPIO
 
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(17, GPIO.IN)
GPIO.setup(23, GPIO.IN)
GPIO.setup(25, GPIO.OUT)
GPIO.output(25, True)
 
while True:
	if (GPIO.input(17) == False ):
		os.system('./get-all-files.sh')
		GPIO.output(25, False)
	if (GPIO.input(23) == False):
		os.system('sudo halt')
        sleep(0.1);
