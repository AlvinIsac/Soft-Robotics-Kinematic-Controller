
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

L = q.*r;
m = @(q,L) [q/2, 2*L*sin(q/2)/q, q/2]';

x_ref = [0.3; 0.05];
x_ee = [x(end,1), x(end,3)]';
e = x_ee - x_ref;
gamma = 0.5;
dT = 0.05;

while sqrt(e'*e) > 0.001
    
    % Display the norm of the error
    disp(sqrt(e'*e));
    
    % Compute control command dq
    J = get_jacobian(q,L);
    dq = -gamma * pinv(J)*e;
    % Update q
    q = q+dq*dT;
    
    % Compute the mapping and find the PCC parameters 
    M = [m(q(1),L(1)) m(q(2),L(2))];
    d = M(2,:)';
    y = d.*cos(q./2);
    r = y./sin(q);
    
    % Recompute the arc
    x = compute_arc_points(q,r,phi); 
    
    % Update the end-effector current position and the error
    x_ee = [x(end,1), x(end,3)]';
    e = x_ee - x_ref;
    
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

