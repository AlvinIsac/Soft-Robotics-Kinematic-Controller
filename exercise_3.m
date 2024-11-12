
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

L = % TO FILL
m = % TO FILL

dx = [0 -0.05]';

T_max = 2;
t = 0.0;
dT = 0.1;

while t < T_max
    
    % Use this function to get the robot jacobian
    J = get_jacobian(q,L)
    
    % Compute the angle
    q = % TO FILL
    
    % Compute the radius
    r = % TO FILL

    % Draw the arc 
    x = compute_arc_points(q,r,phi);
    draw_arc(x,'r')

    % Compute the position of the tip of the two segments
    % xy = [XX,XX];
    % xy = [ xy; XX, XX ];
    
    scatter(xy(:,1),xy(:,2),'b','filled')

    drawnow
    pause(dT)
    
    % Increment the time elapsed
    t = t + dT;
end


