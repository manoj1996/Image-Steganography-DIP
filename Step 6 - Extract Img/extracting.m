%% Extracting the secret image
secsiz1 = 512;
secsiz2 = 512;
condition = true;
%newimg2 = newimg;
newimg2 = imread('output.jpg');
[siz1, siz2, siz3] = size(newimg2);
plane = 1;
pix = 0;
npix = secsiz1 * secsiz2 * 8;
sec_img = [];
colplane = newimg2(:,:,plane);
c1 = 1; c2 = 1;
one = 1;
while condition
    num = 0;
    for i = 1:8
        bit = bitand(colplane(c1, c2), one);
        num = (num * 10) + double(bit)
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
sec_img = reshape(sec_img, siz1, siz2);
imshow(uint8(sec_img));