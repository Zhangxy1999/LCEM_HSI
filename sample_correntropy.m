function corren = sample_correntropy(X,Y,kSize)
% input: vector X, vector Y, kernel size
% output: correntropy between X and Y

n = size(X,1);
twokSizeSquare = 2*kSize^2;
corren = (1/n)*sum(exp(-(X - Y).^2/twokSizeSquare));

end