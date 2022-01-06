classdef Transfer
    properties
        basecase
        zerocase
        grid
        random
        weighted
        twod
        invert
    end

    methods
        function obj = Transfer(basecase, zerocase, grid, random, weighted, twod, invert)
            % Constructor
            obj.basecase = basecase;
            obj.zerocase = zerocase;
            obj.grid = grid;
            obj.random = random;
            obj.weighted = weighted;
            obj.twod = twod;
            obj.invert = invert;
        end
    end
end