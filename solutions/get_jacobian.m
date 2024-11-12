function J = get_jacobian(q,L)
    q1 = q(1); q2 = q(2);
    L1 = L(1); L2 = L(2);
    J = [(2*L2*cos(q1 + q2/2)*sin(q2/2))/q2 - (2*L1*sin(q1/2)^2)/q1^2 + (2*L1*cos(q1/2)*sin(q1/2))/q1, (L2*cos(q1 + q2/2)*sin(q2/2))/q2 + (L2*sin(q1 + q2/2)*cos(q2/2))/q2 - (2*L2*sin(q1 + q2/2)*sin(q2/2))/q2^2 ;
        (L1*cos(q1/2)^2)/q1 - (L1*sin(q1/2)^2)/q1 - (2*L2*sin(q1 + q2/2)*sin(q2/2))/q2 - (2*L1*cos(q1/2)*sin(q1/2))/q1^2, (L2*cos(q1 + q2/2)*cos(q2/2))/q2 - (2*L2*cos(q1 + q2/2)*sin(q2/2))/q2^2 - (L2*sin(q1 + q2/2)*sin(q2/2))/q2
        ];
end