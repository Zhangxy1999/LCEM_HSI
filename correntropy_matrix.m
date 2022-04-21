function corren_matrix = correntropy_matrix(data,kernelSize)
% input: data of size n x d, n is number of sample, d is dimension; kernel size 
% output: a d x d (symmetric) correntropy matrix

dim = size(data,2);
corren_matrix = zeros(dim,dim);

for i=1:dim
    for j=1:i
        corren_matrix(i,j) = sample_correntropy(data(:,i),data(:,j),kernelSize);
    end
end

corren_matrix = (corren_matrix+corren_matrix') - eye(size(corren_matrix,1)).*repmat(diag(corren_matrix),1,size(corren_matrix,1));

end