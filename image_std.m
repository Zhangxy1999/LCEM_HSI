function std_img = image_std(img)
 [m,n,b] = size(img);
 da = reshape(img,m*n,b);
 [RD_hsi]  = PCA(da, 1);
 img = reshape(RD_hsi,m,n,1);
std_img = std(double(img(:)));
end