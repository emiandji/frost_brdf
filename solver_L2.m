% This work © 2023 by Tanaboon Tongbuasirilai is licensed under CC BY-NC-SA 4.0 
function [c_r, c_g, c_b] = solver_L2(Qhat, k, r_sp, g_sp, b_sp, eta)
    fprintf('solving coefficients with L2 : k = %d...\n', k);
    
    Qhat = Qhat(:,1:k);
    
    c_core = inv((Qhat'*Qhat) + (eta*eye(k)));

    c_r = c_core*(Qhat'*r_sp);
    c_g = c_core*(Qhat'*g_sp);
    c_b = c_core*(Qhat'*b_sp);

end
