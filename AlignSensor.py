import waypoints as wp
import kg_robot as kgr
import time
import numpy as np

zeropose = [-0.0718167, -0.443351, 0.0075692, -1.45804, 2.77907, 0.00753163]
startingpose = np.add(zeropose, [0, 0, 0.01, 0, 0, 0])

#  Connect to UR5
urnie = kgr.kg_robot(port=30010, db_host="169.254.150.50")
urnie.set_tcp(wp.probing_tcp)

# This point should be above the bottom left corner of the sensor grid.
# Once it is there, manually move the UR5 along the x & y axes to check the sensor is aligned with these.
# The height is set automatically.
urnie.movel(startingpose, acc=0.02, vel=0.02)

urnie.close()

