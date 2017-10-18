
%% Secret text to be hidden
text = 'Miscrits plan to attack Mumbai. Increase security forces along the harbour!$$@@';
%% Cover Image
secret_img = imread('pirate.tif');
%% Data Hiding
secret_img=double(secret_img);
val = [double(text) 0]; %Coverting secret text to ASCII representation
[siz1, siz2] = size(secret_img); 
i = 1; j = 1; k = 1;
for y = 1:length(val)
    data = val(y); %data is the character in the secret text to be hidden
    bit = 128; %Counter variable
    while bit > 0 %Clearing the LSB of a pixel
        secret_img(i, j) = floor(secret_img(i, j)/2);
        secret_img(i, j) = secret_img(i, j)*2;
        if bitand(data, bit) > 0 %Setting the LSB of pixel to the information bit
            secret_img(i, j) = secret_img(i,j)+1;
        end
        j = j+1;
        if j > siz2
            i = i+1;
            j = 1;
        end            
        bit = floor(bit/2);    
    end    
end
imwrite(uint8(secret_img), 'stego_image.tif'); %writing the stego image into a new file
 







