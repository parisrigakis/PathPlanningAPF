function[angle]=randangle()
  a=rand*360;
  if a>180
      angle=a-360;
  else
      angle=a;
  end
end  
  