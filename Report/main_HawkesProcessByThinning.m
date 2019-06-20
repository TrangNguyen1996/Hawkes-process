rng(8);
T = 4; lambda = 1; alpha = 1; beta = 1.2;
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
title('Hawkes Process By Thinning');
legend(h, {'$\lambda^*(t)$','$M$','Accepted Points','Rejected Points'},'interpreter','latex');