function [a] = vch_e(th)
  if th<0
      a=th+360;
  else
      a=th;
  end
end 