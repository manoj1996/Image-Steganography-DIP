%%Embedding image inside images
%Reading the image

cov_img = imread('cover_image.jpg');
secret_img = imread('pirate.tif');
size_sec = size(secret_img);
x = size(secret_img);
secret1d = reshape(secret_img, 1, x(1)*x(2));
%secret1d = [secret1d 0];
imshow(cov_img);
[siz1, siz2, siz3] = size(cov_img);
plane = 1;
colplane = cov_img(:,:,plane);
newimg = [];
c1 = 1; c2 = 1;

for i = 1:length(secret1d)
    temp = de2bi(secret1d(i), 8);
    for j = 8:-1:1
        val = colplane(c1, c2);
        val = floor(double(val)/2) * 2;
        colplane(c1, c2) = bitor(val,temp(j));
        c2 = c2+1;
        if c2 > siz2
            c2 = 1;
            c1 = c1 + 1;
            if c1 > siz1
                c1 = 1;
                c2 = 1;
                newimg = cat(3, newimg, colplane);
                plane = plane + 1;
                colplane = cov_img(:,:,plane);
            end
        end        
    end    
end
newimg = cat(3, newimg, colplane);
for i = plane+1:3
    newimg = cat(3, newimg, cov_img(:,:,i));
end

imwrite(newimg, 'embedded.jpg');




