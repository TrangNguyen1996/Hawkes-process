rng(2);
lambda = @(t) 2 + sin(t);M = 4;T = 4*pi;
[A,Ay,R,Ry] = InhomogeneousPoissonProcess(T, lambda, M);
%Plot
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
title('Inhomogeneous Poisson Process By Thinning');
legend({'$ \lambda(t)$','$M$','Accepted Points','Rejected Points'},'interpreter','latex');