function [secret_text] = extract_text(stego_img)
%% Extracting hidden data from the stego image
data=[]; %Extracted secret information
[~, siz2] = size(stego_img); 
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
secret_text=[];
for i = 1:length(data)
    secret_text = [secret_text bin2dec(num2str(data(i)))]; %Converting the binary numbers to ASCII values
end
secret_text = char(secret_text); %Coverting the ASCII value to characters
