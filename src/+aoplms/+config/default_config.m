function cfg = default_config()

% This file stores simulation parameters used across the project.
% It does not generate signals or run algorithms.

    %% General simulation settings
    cfg.sim.numSamples = 10000;
    cfg.sim.randomSeed = 1;

    %% Transmit signal settings
    cfg.signal.type = "gaussian";  % Can be "gaussian", "qam", or "mixed"
    cfg.signal.power = 1;  % Normalized average signal power
    cfg.signal.qamOrder = 4;  % Default QAM order
    cfg.signal.qamOrders = [4 16 64 256];

    % Used later for adaptive modulation experiments
    cfg.signal.qamSchedule.orders = [16 64 4 256 64];
    cfg.signal.qamSchedule.lengths = [2200 5500 3300 4400 2200];

    %% Saleh PA model settings
    cfg.pa.gamma = 3;  % Small-signal gain
    cfg.pa.beta = 0.09;  % Transition sharpness
    cfg.pa.memoryLength = 9;  % PA memory length

    %% Noise settings
    cfg.noise.floorDbm = -100;

    %% Nonlinear polynomial model settings
    cfg.model.nonlinearOrder = 7;  % odd integer (represented as P in the paper)
    cfg.model.numBasis = (cfg.model.nonlinearOrder + 1) / 2;

    %% Moment-estimation settings
    cfg.moments.maxSamples = 55;
    cfg.moments.updateInterval = 3000;

    %% LMS settings
    cfg.lms.stepSize = 1e-3;    
    cfg.lms.numTaps = 11;  % Represents the effective FIR memory learned by LMS.

    %% LUT settings
    cfg.lut.modOrders = [4 16 64 256];
    cfg.lut.cacheFile = fullfile("results", "lut", "qam_aop_lut.mat");
    cfg.lut.rebuild = false;

    %% Result paths
    cfg.paths.results = "results";
    cfg.paths.figures = fullfile("results", "figures");
    cfg.paths.mat = fullfile("results", "mat");
    cfg.paths.lut = fullfile("results", "lut");

end