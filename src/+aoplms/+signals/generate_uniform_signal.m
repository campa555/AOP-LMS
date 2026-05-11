function x = generate_uniform_signal(N, amplitude)

    % Generates a real-valued uniform signal in [-amplitude, amplitude].

    x = -amplitude + 2 * amplitude * rand(N, 1);

end
