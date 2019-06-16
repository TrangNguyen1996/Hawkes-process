function [lambda] = cif(t,H,mu,alpha,beta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Consider: lambda^{*}(t) = lambda_0 + alpha*sume^{-beta(t-t_j)}
%h--the history of the process
%mu--the parameter of lambda_0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda = mu*ones(length(t),1) ;
for i = 1 : length(t)
    h = H;
    h = h(h < t(i)) ;
    if ~ isempty(h)
        lambda(i) = lambda(i) +alpha*sum(exp(- beta * (t(i) - h)));
    end
end