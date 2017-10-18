function [newimg] = embedding(cov_img, secret_img)
%%Embedding image inside images
size_sec = size(secret_img);
secret1d = reshape(secret_img, 1, size_sec(1)*size_sec(2));
%Declaration of variables to control the insertion of encrypted image into
%the cover image
[siz1, siz2, ~] = size(cov_img);
plane = 1;
colplane = cov_img(:,:,plane);
newimg = []; %Output image - cover image with secret image embedded in it
c1 = 1; c2 = 1;

%% Embedding the secret image in the least significant bits of the cover image
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
                plane = plane + 1; %Embedding it in the next plane on exhaustion of current plane
                colplane = cov_img(:,:,plane);
            end
        end        
    end    
end
newimg = cat(3, newimg, colplane);
%Inserting back the remaining color plains into the output image
for i = plane+1:3
    newimg = cat(3, newimg, cov_img(:,:,i));
end

imwrite(newimg, '3-embedded_image.tif');




