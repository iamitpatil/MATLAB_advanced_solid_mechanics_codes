function [Q] = cal_P(n, Load)
% cal_P Summary of this function goes here
% In this Function cal_P is calculated at x provided
p0=25;
if(Load==1)
    if(n==1)
        Q=p0;
    else
        Q=0;
    end
end
 if(Load ==2)
     if (rem(n,2)==1)
     Q=4*p0/(n*pi);
     else
     Q=0;
     end 
 end
if (Load == 3)
    if (rem(n,2)==1)
      Q=2*p0*sin((n*pi/2));
    else
        Q=0;
    end
end
end

