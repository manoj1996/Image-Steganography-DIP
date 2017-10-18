%% Extracting hidden data from the stego image
stego_img = imread('stego_image.tif');
stego_img = double(stego_img);
data=[]; %Extracted secret information
condition = true;
i = 1;
j = 1;
while condition
    k = 8;
    num = 0;
    while k > 0 %Obtaining the binary representation of a character in the hidden text
        num = (num*10) + bitand(stego_img(i, j),1);
        k = k - 1;
        j = j+1;
        if j > siz2
            i = i+1;
            j = 1;
        end       
    end
    data = [data num]; %Adding the obtained binary representation of character of the secret information
    if num == 0 %Checking if the last character read was a 'null character'
        condition = false;
    end
end
a=[];
for i = 1:length(data)
    a = [a bin2dec(num2str(data(i)))]; %Converting the binary numbers to ASCII values
end
char(a) %Coverting the ASCII value to characters
