clear all;
close all;
clc;

rng(2);
lambda = @(t) 2 + sin(t);
M = 4;
T = 4*pi;

[A,Ay,R,Ry] = InhomogeneousPoissonProcess(T, lambda, M);
hold on;
t = 0:0.01:T;
xlabel('$t$','interpreter','latex');
ylabel('$P$','interpreter','latex');
plot(t, lambda(t));
line([0, T], [M, M],'LineWidth', 4);
scatter(A,Ay,[],[0 .5 0],'o','LineWidth',1);
scatter(R, Ry,[],[1 0 0],'+','LineWidth',1);
scatter(A, zeros(size(A)), 80, [0 .5 0],'s','filled');
for i=1:numel(A)
    line([A(i), A(i)], [0, Ay(i)],'LineStyle','--','Color', [0 .5 0]);
end
axis([0, T, 0, M+.01]);
legend({'$ \lambda(t)$','$M$','Accepted Points','Rejected Points'},'interpreter','latex');
%% Hawkes process by thining
clear all;
close all;
clc;
rng(8);

T = 4; lambda = 1; alpha = 1; beta = 1.2;
% T = 30; lambda = 0.5; alpha = .15; beta = 1;
% T = 40; lambda = 0.5; alpha = -.15; beta = 1;
[A,Ay,R,Ry,MXs,MYs] = HawkesProcessByThinning(T,lambda,alpha,beta);
hold on;
t = 0:0.01:T; 
lambdas = cif(t, A, lambda, alpha, beta);
xlabel('$t$','interpreter','latex');
ylabel('$P$','interpreter','latex');
h = zeros(4, 1);
h(1) = plot(t, lambdas);
h(3) = scatter(A, Ay,[],[0 .5 0],'o','LineWidth',1);
h(4) = scatter(R, Ry,[],[1 0 0],'+','LineWidth',1);
many = line(MXs, MYs,'Color','b','LineWidth', 3);
h(2) = many(1);
scatter(A, zeros(size(A)), 80, [0 .5 0],'s','filled');
for i=1:numel(A)
line([A(i), A(i)], [0, Ay(i)],'LineStyle','--','Color', [0 .5 0]);
end
axis([0, T, 0, max(lambdas)*1.05]);
legend(h, {'$\lambda^*(t)$','$M$','Accepted Points','Rejected Points'},'interpreter','latex');
%% Hawkes process by cluster
clear all;
close all;
clc;

rng(4);
T = 10; lambda = 1; alpha = 2; beta = 1.2;

allpoints = HawkesProcessByClustering(T,lambda,alpha,beta);
scatter(allpoints, zeros(size(allpoints)), 100, [0,0,0],'x');
xlabel('$t$','interpreter','latex');
ylabel('Family Number','interpreter','latex');
a = axis(); axis([0, T, a(3), a(4)]);
