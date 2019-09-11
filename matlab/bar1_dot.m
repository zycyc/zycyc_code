function bar1_dot(data)
    %format of data for plot: sub*cond
    % [stats F1 P1]=do_anova1(data);
    sub_num = size(data,1);
%     figure;
    set(gcf,'color','w');
%     set(gcf,'Position',[0 0 600 400]);
    x=1:size(data,2);
    ymean=nanmean(data);
    bar(x,ymean,'facecolor',[0.4,0.4,0.4],'edgecolor','w','barWidth',0.6);
    hold on;
    errorbar(x,ymean,nanstd(data)./sqrt(size(data,1))-sum(isnan(ymean)),'color',[0.4,0.4,0.4],'LineStyle','none','LineWidth',2.0);

    hold on
    rand_x = [rand(1,floor(sub_num/2))*0.1 rand(1,sub_num-floor(sub_num/2))*(-0.1)];
    rand_x = rand_x(randperm(sub_num));
    for is = 1:size(data,1)
        x_tmp = x+rand_x(is);
        plot(x_tmp,data(is,:),'.','MarkerSize',25);
        hold on
    end
    hold off
end