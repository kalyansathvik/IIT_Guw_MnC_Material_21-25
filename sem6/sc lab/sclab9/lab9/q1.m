f1a=@(x)((x^2)*log(x));
disp("1a:")
disp("from newton-cote:")
disp(newcot(f1a,1,1.5,2))
disp("actual:")
disp(eval(int(sym(f1a),1,1.5)))

f1b=@(x)(2/(x^2-4));
disp("1b:")
disp("from newton-cote:")
disp(newcot(f1b,0,0.35,2))
disp("actual:")
disp(eval(int(sym(f1b),0,0.35)))