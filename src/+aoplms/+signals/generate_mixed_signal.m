function x = generate_mixed_signal(N, M, power)

    % Generates a Gaussian-QAM mixed signal.

    x_gaussian = aoplms.signals.generate_gaussian_signal(N, power);
    x_qam = aoplms.signals.generate_qam_signal(N, M, power);

    x = x_gaussian + x_qam;

end
