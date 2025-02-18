function vectorPrinter(x, n, string)
  fprintf("%s: [", string);
    for i = 1:n
      if(i==n)
        fprintf("%0.8f", x(i));
      else
        fprintf("%.8f, ", x(i));
      end
    end
  fprintf("]\n");
end
