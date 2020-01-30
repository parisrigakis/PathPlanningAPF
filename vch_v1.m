function [a] = vch_v1(th)
  if th>90
      a=th-360;
  else
      a=th;
  end
end 