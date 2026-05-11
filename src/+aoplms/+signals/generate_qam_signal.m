function x = generate_qam_signal(N, M, power)

    % Generates square M-QAM symbols using MATLAB Communications Toolbox.
    % M can be: 4, 16, 64, 256
    % The constellation is normalized so that: E{|x[n]|^2} = power

    data = randi([0 M-1], N, 1);

    x = qammod(data, M, ...
        'InputType', 'integer', ...
        'UnitAveragePower', true);

    x = sqrt(power) * x;

end
