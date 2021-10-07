import waypoints as wp
import kg_robot as kgr
import time
import random

def newspot(x, y, depth):
    time_start = time.time()
    x *= 11.5
    y *= 11.5

    urnie.movel([-0.0436169 + x / 1000, -0.491161 + (y - 22.4) / 1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    urnie.movel([-0.0436169+x/1000, -0.491161+(y-22.4)/1000, 0.00600445, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.translatel_rel([0, 0, -depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.movel([-0.0436169 + x / 1000, -0.491161 + (y - 22.4) / 1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue


def middlespot(x, y, depth):
    time_start = time.time()
    x *= 5.75
    y *= 5.75

    urnie.movel([-0.0436169 + (x - 5.75)/ 1000, -0.491161 + (y - 28.15) / 1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    urnie.movel([-0.0436169+ (x - 5.75)/1000, -0.491161+(y-28.15)/1000, 0.00600445, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.translatel_rel([0, 0, -depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.movel([-0.0436169 + (x - 5.75)/ 1000, -0.491161 + (y - 28.15) / 1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue


urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)


positions = list(range(81))
random.shuffle(positions)
for i in range(81):
    middlespot(positions[i]%9, positions[i]//9, 1)

print(positions)


urnie.close()

