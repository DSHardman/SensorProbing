xythree = Attempt(H25_grid(:,:,1), 'h25_grid_3');
xyfive = Attempt(H25_grid(:,:,2), 'h25_grid_5');
xyseven = Attempt(H25_grid(:,:,3), 'h25_grid_7');
dpthree = Attempt(h25_grid(:,:,1), 'h25_grid_3');
dpfive = Attempt(h25_grid(:,:,2), 'h25_grid_5');
dpseven = Attempt(h25_grid(:,:,3), 'h25_grid_7');
grid = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H25_random(:,:,1), 'h25_random_3');
xyfive = Attempt(H25_random(:,:,2), 'h25_random_5');
xyseven = Attempt(H25_random(:,:,3), 'h25_random_7');
dpthree = Attempt(h25_random(:,:,1), 'h25_random_3');
dpfive = Attempt(h25_random(:,:,2), 'h25_random_5');
dpseven = Attempt(h25_random(:,:,3), 'h25_random_7');
random = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H25_weighted(:,:,1), 'h25_weighted_3');
xyfive = Attempt(H25_weighted(:,:,2), 'h25_weighted_5');
xyseven = Attempt(H25_weighted(:,:,3), 'h25_weighted_7');
dpthree = Attempt(h25_weighted(:,:,1), 'h25_weighted_3');
dpfive = Attempt(h25_weighted(:,:,2), 'h25_weighted_5');
dpseven = Attempt(h25_weighted(:,:,3), 'h25_weighted_7');
weighted = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H25_2d(:,:,1), 'h25_2d_3');
xyfive = Attempt(H25_2d(:,:,2), 'h25_2d_5');
xyseven = Attempt(H25_2d(:,:,3), 'h25_2d_7');
dpthree = Attempt(h25_2d(:,:,1), 'h25_2d_3');
dpfive = Attempt(h25_2d(:,:,2), 'h25_2d_5');
dpseven = Attempt(h25_2d(:,:,3), 'h25_2d_7');
twod = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

xythree = Attempt(H25_invert(:,:,1), 'h25_invert_3');
xyfive = Attempt(H25_invert(:,:,2), 'h25_invert_5');
xyseven = Attempt(H25_invert(:,:,3), 'h25_invert_7');
dpthree = Attempt(h25_invert(:,:,1), 'h25_invert_3');
dpfive = Attempt(h25_invert(:,:,2), 'h25_invert_5');
dpseven = Attempt(h25_invert(:,:,3), 'h25_invert_7');
invert = Approach(xythree, xyfive, xyseven, dpthree, dpfive, dpseven);

basecase = SingleCase(2.64, 98.82, 'H25NET');
zerocase = SingleCase(3.43, 34.40, 'H25_ZERO');

H25 = Transfer(basecase, zerocase, grid, random, weighted, twod, invert);