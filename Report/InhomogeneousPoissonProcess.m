function [A,Ay,R,Ry] = InhomogeneousPoissonProcess(T,lambda,M)
    t = 0;
    A = []; Ay = [];
    R = []; Ry =[];
    while t < T
        t = t + exprnd(1/M);
        U = M * rand();
        if (t < T) && (U <= lambda(t))
            A = [A, t];
            Ay = [Ay, U];
        else
            R = [R, t];
            Ry = [Ry, U];
        end
    end
end