
% Clean workspace
clear
clc
hold off

% Initial posture
L = [0.4, 0.1]'; % [m]
q = deg2rad([80, 20])'; % [rad]
phi =  deg2rad([0, 0])'; % [rad]

r = L./q;
x = compute_arc_points(q,r,phi);

% Draw arc

figure(1)

draw_arc(x,'c')
xlim([0 0.35])
ylim([0 0.35])
axis equal

L = q.*r;
m = @(q,L) [q/2, 2*L*sin(q/2)/q, q/2]';

dx = [0 -0.05]';

T_max = 2;
t = 0.0;
dT = 0.1;

while t < T_max
   
    J = get_jacobian(q,L);
    dq = pinv(J)* dx;
    q = q+dq*dT;
    
    M = [m(q(1),L(1)) m(q(2),L(2))];
    d = M(2,:)';
  
    xy = [d(1)*sin(q(1)/2),d(1)*cos(q(1)/2)];
    xy = [ xy; ...
        xy(1) + d(2)*sin(q(1)+q(2)/2), ...
        xy(2) + d(2)*cos(q(1)+q(2)/2)...
        ];
    
    y = d.*cos(q./2);
    r = y./sin(q);
%     hold off
    scatter(xy(:,1),xy(:,2),'b','filled')

    x = compute_arc_points(q,r,phi);
    draw_arc(x,'r')

    drawnow
    pause(dT)
   
    t = t + dT;
end


