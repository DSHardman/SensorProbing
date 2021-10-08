import pickle

import waypoints as wp
import kg_robot as kgr
import time
import numpy as np
import random
import nidaqmx as ni
from nidaqmx.constants import TerminalConfiguration


timebefore = 1
timedown = 1.5
timepressed = 5
timeup = 1.5
timeafter = 1
depth = 0.001
dt = 0.05

upperbound = 34.5 * 0.001

duration = timebefore + timeafter + timedown + timeup + timepressed
samplesdown = int(timedown/dt)
samplesup = int(timeup/dt)


#zeropose = [-0.0436169, -0.513561, 0.00600445, -1.45806, 2.77909, 0.00745422]
zeropose = [-0.0436169, -0.513561, 0.05600445, -1.45806, 2.77909, 0.00745422]


urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)


with ni.Task() as task:
    task.ao_channels.add_ao_voltage_chan("Dev1/ao0")
    task.write(5)

for i in range(3450, 4000):

    x = random.random()*upperbound
    y = random.random()*upperbound
    xy = [x, y]

    startingpose = np.add(zeropose, [x, y, 0.01, 0, 0, 0])
    urnie.movel(startingpose, acc=0.02, vel=0.02)

    poses = 0
    poses = np.ones((int(duration/dt), 1))*startingpose

    for j in range(int(timebefore/dt), int(timebefore/dt) + samplesdown):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01)*(j - int(timebefore/dt))/samplesdown, 0, 0, 0])

    for j in range(int(timebefore/dt) + samplesdown, int((timebefore+timedown+timepressed)/dt)):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01), 0, 0, 0])

    for j in range(int((timebefore+timedown+timepressed)/dt), int((timebefore+timedown+timepressed)/dt) + samplesup):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01) + ((depth+0.01)*(j - int((timebefore+timedown+timepressed)/dt))/samplesup),
                                     0, 0, 0])

    urnie.movel(poses[0], acc=0.02, vel=0.02)

    with ni.Task() as task:
        task.ai_channels.add_ai_voltage_chan("Dev1/ai0:7", terminal_config=TerminalConfiguration.RSE)

        urnie.movel(poses[0], acc=0.02, vel=0.02)
        data = np.zeros((int(duration/dt), 1))*[0, 0, 0, 0, 0, 0, 0, 0]
        times = np.zeros((int(duration/dt), 1))
        t0 = time.time()
        for k in range(0, int(duration/dt)):
            urnie.servoj(poses[k], control_time=dt, lookahead_time=0.2)
            data[k] = task.read()
            times[k] = time.time() - t0
            while time.time() - t0 < dt*(k+1):
                continue

    urnie.movel(startingpose, acc=0.02, vel=0.02)

    # np.save('presses/response'+str(i), data)
    # np.save('presses/poses'+str(i), poses)
    # np.save('presses/times'+str(i), times)
    # np.save('presses/xy'+str(i), xy)

    print(i)
