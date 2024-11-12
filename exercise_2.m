
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


% Write the mapping m(q) as a function
% m = TO FILL

for i = 1:15
    dq = [0.05 0.2]';
    
    % Increment q
    % q = TO FILL
    
    % Get the PCC parameters to draw the arc corresponding to the current q
    % r = TO FILL
    x = compute_arc_points(q,r,phi);
    draw_arc(x,'r')
    
    % Compute and draw the position of the tip of each segment given the mapping
    % m(q)
    % x_ee = [XX,XX];
    % x_ee = [ x_ee; XX, XX ]; Keep x_ee, as points are concatenated
    scatter(x_ee(:,1),x_ee(:,2),'b','filled')

    drawnow
    pause(0.05)
end