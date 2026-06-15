function report = check_orthonormality(Phi, tol)
    % Check orthonormality of AOP basis by computing the Gram matrix:
    % Inputs:
    %   Phi : NxK basis matrix
    %   tol : tolerance
    % Output:
    %   report : struct with Gram matrix and error metrics

    % set default value for tol
    if nargin < 2 || isempty(tol)
        tol = 1e-10;
    end

    [N, K] = size(Phi);

    G = (Phi' * Phi) / N;
    I = eye(K);

    errorMatrix = G - I;

    diagonalError = max(abs(diag(G) - 1));

    offDiagonalMatrix = G - diag(diag(G));
    maxOffDiagonal = max(abs(offDiagonalMatrix(:)));

    maxAbsError = max(abs(errorMatrix(:)));
    frobeniusError = norm(errorMatrix, "fro");

    report.gramMatrix = G;
    report.errorMatrix = errorMatrix;
    report.diagonalError = diagonalError;
    report.maxOffDiagonal = maxOffDiagonal;
    report.maxAbsError = maxAbsError;
    report.frobeniusError = frobeniusError;
    report.tolerance = tol;
    report.isOrthonormal = maxAbsError < tol;

end