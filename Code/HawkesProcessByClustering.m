function HawkesProcessByClustering(T,lambda,alpha,beta)
    k = poissrnd(lambda*T);
    C = sort(T*rand(k,1));
    D = poissrnd(alpha/beta, k, 1);
    allDes = [];
    hold on;
    colorOrder = get(gca,'ColorOrder');
    for i = 1 : k
        color = colorOrder(mod(i, size(colorOrder, 1))+1,:);
        numDes = poissrnd(alpha/beta);
        Des = C(i) + exprnd(1/beta, numDes, 1);
        scatter(C(i), i, [], color,'filled','s');
        scatter(Des, i.*ones(size(Des)), [], color);
        allDes = [allDes; Des];
    end
    allpoints = sort([C; allDes]);
    title('Hawkes Process By Cluster');
    scatter(allpoints, zeros(size(allpoints)), 100, [0,0,0],'x','LineWidth',1);
    xlabel('$t$','interpreter','latex');
    ylabel('Family Number','interpreter','latex');
    a = axis(); axis([0, T, a(3), a(4)]);
end