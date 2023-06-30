function dydt = odefunc(t, y, V, I, L, C)
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
