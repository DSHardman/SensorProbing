import waypoints as wp
import kg_robot as kgr
import time
import numpy as np
import random
import nidaqmx as ni
from nidaqmx.constants import TerminalConfiguration

#  Set positive rail to 5V
with ni.Task() as task:
    task.ao_channels.add_ao_voltage_chan("Dev1/ao0")
    task.write(5)


# t0 = time.time()
#
# while True:  # Continue until physically stopped
#     t_it = time.time()
#     # Measure and record sensor data
#     with ni.Task() as task:
#         task.ai_channels.add_ai_voltage_chan("Dev1/ai0:7", terminal_config=TerminalConfiguration.RSE)
#
#         data = task.read()
#
#     myfile = open('J/response.txt', 'a')
#     myfile.write(str(data)+'\n')
#     myfile.close()
#
#     myfile = open('J/times.txt', 'a')
#     myfile.write(str(time.time() - t0)+'\n')
#     myfile.close()
#
#     while time.time() - t_it < 15:
#         continue
