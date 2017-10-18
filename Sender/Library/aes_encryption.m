function [encrypt_o] = aes_encryption (input_img)
%% SD Dimension
SD_Rw = 480;
SD_Cl = 480;

%% Image Read
image_in = imresize(input_img, [SD_Rw SD_Cl]);

%% Divide image in to Nx16 block
image_x_16 = double(reshape(image_in', 16,(SD_Rw*SD_Cl/16))');

%% Key
key = 0:15;
key = mod(key, 256);
key_i = repmat(key, size(image_x_16,1), 1);

%% Encryption
s_box_o = s_box_fun(image_x_16);
shift_rows_o = shift_rows_fun(s_box_o);
mix_col_o = mix_column_fun(shift_rows_o);
xor_key_o = bitxor(mix_col_o, key_i);
encrypt_o = uint8(reshape(xor_key_o', SD_Cl, SD_Rw)');
imwrite(encrypt_o, '1-encrypted.tif'); %Write the input to the disk