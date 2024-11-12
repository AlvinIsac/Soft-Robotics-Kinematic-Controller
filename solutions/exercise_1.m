
% Clean workspace
clear
clc
hold off

% Initial posture
L = 0.4; % [m]
q = deg2rad(80); % [rad]
phi =  deg2rad(0); % [rad]

r = L./q;
x = compute_arc_points(q,r,phi);

% Draw arc
figure(1)
draw_arc(x,'c')
xlim([0 0.4])
ylim([0 0.3])
axis equal

% Write the mapping m(q) as a function
m = @(q,L) [q/2, 2*L*sin(q/2)/q, q/2]';

for i = 1:15
    dq = 0.1;
    q = q+dq;
    
    % Get the PCC parameters to draw the arc corresponding to the current q
    % (note : phi and q are known, only the radius is missing)
    
    % Get the length of the chord connecting the extreme of the arc
    d = m(q,L); d = d(2);
    y = d*cos(q/2); 
    r = y/sin(q);
    
    % Compute points and draw
    x = compute_arc_points(q,r,phi);
    draw_arc(x,'r')
    
    % Compute and draw the position of the tip of the arc given the mapping
    % m(q)
    x_ee = [d*sin(q/2); d*cos(q/2)];
    scatter(x_ee(1),x_ee(2),'b','filled')
    
    drawnow
    pause(0.05)
end




