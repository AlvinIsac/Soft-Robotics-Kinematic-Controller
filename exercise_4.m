
% Clean workspace
clear
clc
hold off

% Initial posture
L = [0.4, 0.1]'; % [m]
q = deg2rad([80, 30])'; % [rad]
phi =  deg2rad([0, 0])'; % [rad]

r = L./q;
x = compute_arc_points(q,r,phi);

% Draw arc
figure(1)
draw_arc(x,'c')
x_max = 0.4;
y_max = 0.4;
xlim([0 x_max])
ylim([0 y_max])
axis equal

L = % TO FILL
m = % TO FILL

x_ref = [0.3; 0.05];
x_ee = [x(end,1), x(end,3)]';
gamma = 0.5; % Proportional gain
dT = 0.05;
e = % TO FILL

while sqrt(e'*e) > 0.001
    
    % Display the norm of the error
    disp(sqrt(e'*e));
    
    % Compute control command 
    J = get_jacobian(q,L);
    dq = % TO FILL
    
    % Update the agle
    q = % TO FILL
    
    % Compute the mapping and find the PCC parameters 
    r = % TO FILL
    
    % Recompute the arc points for the new robot posture
    x = compute_arc_points(q,r,phi);
    
    % Update the end-effector current position and the error
    x_ee = % TO FILL
    e = % TO FILL
    
    % Redraw the scene
    hold off
    draw_arc(x,'r')
    % Draw the target point    
    scatter(x_ref(1),x_ref(2),'g','filled')
    xlim([0 x_max])
    ylim([0 y_max])
    
    drawnow
    pause(dT)
end

