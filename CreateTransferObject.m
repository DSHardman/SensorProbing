xythree = Attempt(H12_grid(:,:,1), 'h12_grid_3');
xyfive = Attempt(H12_grid(:,:,2), 'h12_grid_5');
xyseven = Attempt(H12_grid(:,:,3), 'h12_grid_7');
dpthree = Attempt(h12_grid(:,:,1), 'h12_grid_3');
dpfive = Attempt(h12_grid(:,:,2), 'h12_grid_5');
dpseven = Attempt(h12_grid(:,:,3), 'h12_grid_7');
grid = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H12_random(:,:,1), 'h12_random_3');
xyfive = Attempt(H12_random(:,:,2), 'h12_random_5');
xyseven = Attempt(H12_random(:,:,3), 'h12_random_7');
dpthree = Attempt(h12_random(:,:,1), 'h12_random_3');
dpfive = Attempt(h12_random(:,:,2), 'h12_random_5');
dpseven = Attempt(h12_random(:,:,3), 'h12_random_7');
random = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H12_weighted(:,:,1), 'h12_weighted_3');
xyfive = Attempt(H12_weighted(:,:,2), 'h12_weighted_5');
xyseven = Attempt(H12_weighted(:,:,3), 'h12_weighted_7');
dpthree = Attempt(h12_weighted(:,:,1), 'h12_weighted_3');
dpfive = Attempt(h12_weighted(:,:,2), 'h12_weighted_5');
dpseven = Attempt(h12_weighted(:,:,3), 'h12_weighted_7');
weighted = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H12_2d(:,:,1), 'h12_2d_3');
xyfive = Attempt(H12_2d(:,:,2), 'h12_2d_5');
xyseven = Attempt(H12_2d(:,:,3), 'h12_2d_7');
dpthree = Attempt(h12_2d(:,:,1), 'h12_2d_3');
dpfive = Attempt(h12_2d(:,:,2), 'h12_2d_5');
dpseven = Attempt(h12_2d(:,:,3), 'h12_2d_7');
twod = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H12_invert(:,:,1), 'h12_invert_3');
xyfive = Attempt(H12_invert(:,:,2), 'h12_invert_5');
xyseven = Attempt(H12_invert(:,:,3), 'h12_invert_7');
dpthree = Attempt(h12_invert(:,:,1), 'h12_invert_3');
dpfive = Attempt(h12_invert(:,:,2), 'h12_invert_5');
dpseven = Attempt(h12_invert(:,:,3), 'h12_invert_7');
invert = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

basecase = SingleCase(2.64, 98.82, 'H12NET');
zerocase = SingleCase(3.43, 34.40, 'H12_ZERO');

H12 = Transfer(basecase, zerocase, grid, random, weighted, twod, invert);