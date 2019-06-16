function [A,Ay,R,Ry,MXs,MYs] = HawkesProcessByThinning(T,lambda,alpha,beta)
    M = lambda; t = 0;
    A = []; Ay = [];
    R = []; Ry = [];
    MXs = []; MYs = [];
    while t < T
        lastM = M; lastT = t;
        M = cif(t + 1e-10, A, lambda, alpha, beta);
        t = t + exprnd(1/M);
        MXs = [MXs, [lastT; t]];
        MYs = [MYs, [M; M]];
        if t < T
            U = M*rand();
            if U <= cif(t, A , lambda, alpha, beta)
                A = [A, t];
                Ay = [Ay, U];
            else
                R = [R, t];
                Ry = [Ry, U];
            end
        end
    end
end