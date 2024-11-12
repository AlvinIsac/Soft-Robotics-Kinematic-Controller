
% Clean workspace
clear
clc
hold off

% Initial posture
L = [0.4, 0.1]'; % [m]
q = deg2rad([80, 30])'; % [rad]
% Remove phi for the exercise
phi =  deg2rad([0, 180])'; % [rad]

r = L./q;
x = compute_arc_points(q,r,phi);

% Draw arc
figure(1)
draw_arc(x,'c')
xlim([0 0.4])
ylim([0 0.5])
axis equal

m = @(q,L) [q/2, 2*L*sin(q/2)/q, q/2]';

for i = 1:15
    dq = [0.05 0.2]';
    q = q+dq;
    
    % Get the PCC parameters to draw the arc corresponding to the current q
    M = [m(q(1),L(1)) m(q(2),L(2))];
    d = M(2,:)';
    y = d.*cos(q./2);
    r = y./sin(q);
    x = compute_arc_points(q,r,phi);
    draw_arc(x,'r')
    
    % Compute and draw the position of the tip of each segment given the mapping
    % m(q)
    
    x_ee = [d(1)*sin(q(1)/2),d(1)*cos(q(1)/2)];
    x_ee = [ x_ee; ...
        x_ee(1) + d(2)*sin(q(1)-q(2)/2), ...
        x_ee(2) + d(2)*cos(q(1)-q(2)/2)...
        ];
    scatter(x_ee(:,1),x_ee(:,2),'b','filled')

    drawnow
    pause(0.05)
end