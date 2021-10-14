import waypoints as wp
import kg_robot as kgr
import time
import random

# define function which probes grid (integer inputs correspond to grid junctions)
def newspot(x, y, depth):
    time_start = time.time()
    x *= 11.5
    y *= 11.5

    urnie.movel([-0.0436169 + x/1000, -0.513561 + y/1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    urnie.movel([-0.0436169 + x/1000, -0.491161 + y/1000, 0.00600445, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.translatel_rel([0, 0, -depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.movel([-0.0436169 + x / 1000, -0.513561 + y/1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue

# similar function which also probes the mid-points of each grid
def middlespot(x, y, depth):
    time_start = time.time()
    x *= 5.75
    y *= 5.75

    urnie.movel([-0.0493639 + x/1000, -0.519311 + y/1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    urnie.movel([-0.0493639 + x/1000, -0.519311 + y/1000, 0.00600445, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.translatel_rel([0, 0, -depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, depth/1000, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(1)
    urnie.movel([-0.0493639 + x/1000, -0.519311 + y/1000, 0.012, -1.45806, 2.77909, 0.00745422], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue


urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")  # connect to UR5
urnie.set_tcp(wp.probing_tcp)  # Define location of probe tip

# 10 probes at random locations
for i in range(10):
    x = random.random()*3
    y = random.random() * 3
    newspot(x, y, 0.5)  # probe at depth 0.5mm

# Probe all intersections of grid in random order
# positions = list(range(81))
# random.shuffle(positions)
# for i in range(81):
#     middlespot(positions[i]%9, positions[i]//9, 1)
#print(positions)


urnie.close()

