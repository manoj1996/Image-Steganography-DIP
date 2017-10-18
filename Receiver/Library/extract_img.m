function [sec_img] = extract_img(newimg2)
%% Extracting the secret image
secsiz1 = 480;
secsiz2 = 480;
condition = true;
[siz1, siz2, ~] = size(newimg2);
plane = 1;
pix = 0;
npix = secsiz1 * secsiz2;
sec_img = [];
colplane = newimg2(:,:,plane);
c1 = 1; c2 = 1;
one = 1;

%Extracting the data in every pixel from the least significant bit
while condition
    num = 0;
    %Extracting one pixel of secret image
    for i = 1:8
        bit = bitand(colplane(c1, c2), one);
        num = (num * 10) + double(bit);
        c2 = c2 + 1;
        if c2 > siz2
            c2 = 1;
            c1 = c1 + 1;
            if c1 > siz1
                c1 = 1;
                plane = plane + 1;
                colplane = newimg2(:,:,plane);
            end
        end
    end
    pix = pix + 1;
    num = bin2dec(num2str(num));
    sec_img = [sec_img num];
    if pix >= npix
        condition = false;
    end
end

%sec_img is a linear array. Hence, we will need to reshape it back to it's
%original dimensions
sec_img = reshape(sec_img, secsiz1, secsiz2);
imwrite(uint8(sec_img), '2-extract_secret_image.tif'); 
