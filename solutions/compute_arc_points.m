function x = compute_arc_points(q,r,phi)
    p = @(k,s) [(1/k)*(1-cos(k*s)); 0; (1/k)*sin(k*s)];
    Ry = @(k,s) [cos(k*s), 0, sin(k*s); 0, 1, 0; -sin(k*s), 0, cos(k*s)];
    Rz = @(a) [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0, 0, 1];

    T_inplane = @(R,p)[[R;[0,0,0]],[p;1]];
    T_rot = @(R)[[R;[0,0,0]],[0;0;0;1]];

    % Compute the points on the arc by using the arc parameters
    points = struct([]); 
    axes = struct([]);
    T_prev = eye(4,4); 
    x = [];
    for i = 1:length(q)
        k = 1/r(i);
        l = q(i)*r(i);
        step = l/100;
        for s = 0:step:l 
            T = T_prev * T_rot(Rz(phi(i))) * T_inplane(Ry(k,s),p(k,s));
            x = [x; T(1:3,end)'];     
        end
        T_prev = T_prev * T_rot(Rz(phi(i))) * T_inplane(Ry(k,l),p(k,l)) * T_rot(Rz(-phi(i)));
    end
end