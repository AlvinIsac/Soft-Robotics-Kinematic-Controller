
function draw_arc(x,color)
    plot(x(:,1),x(:,3),color,'LineWidth',2);
    hold on
    scatter(x(1,1),x(1,3),'k','Filled');
    scatter(x(end,1),x(end,3),'k','Filled');
end