% function dydt = odefunc(t, y, V, I, L, C)
%     VL = y(1);
%     iL = y(2);
%     if t == 0
%         iD = I(find(V >= 0, 1));
%         iC = -iD;
%     else
%         iD = I(find(V >= VL, 1));
%         iC = -iD - iL;
%     end
%     dVLdt = (1/C) * iC;
%     diLdt = (1/L) * VL;
%     
%     dydt = [dVLdt; diLdt];
% end
function dydt = odefunc(t, y, V, I, L, C)
    VL = y(1);
    iL = y(2);
    dV=mean(diff(V));
    ind_0 = find(V >= 0, 1);
    if t == 0
          iD = I(ind_0);
          iC = -iD;
    else
        index=ceil(ind_0+VL/dV);
        if index < 1 || index > numel(I)
            iD = 0;
        else
            iD = I(index);
        end
        iC = -iD - iL;
    end
    dVLdt = (1/C) * iC;
    diLdt = (1/L) * VL;
    
    dydt = [dVLdt; diLdt];
end