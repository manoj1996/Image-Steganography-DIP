function [decrypt_o] = decryption (encrypt_o)
%% SD Dimension
SD_Rw = 480;
SD_Cl = 480;

%% Key
key = 0:15;
key = mod(key, 256);
key_i = repmat(key, SD_Rw*SD_Cl/16, 1);

%% Divide image in to Nx16 block
image_x_16 = double(reshape(encrypt_o', 16, (SD_Rw*SD_Cl/16))');

%% Decryption
xor_key_o = bitxor(image_x_16, key_i);
inv_mix_col_o = inv_mix_column_fun(xor_key_o);
inv_shift_rows_o = inv_shift_rows_fun(inv_mix_col_o);
inv_s_box_o = inv_s_box_fun(inv_shift_rows_o);
decrypt_o = uint8(reshape(inv_s_box_o', SD_Cl, SD_Rw)');

%% Write output to disk
imwrite(decrypt_o, '4-decrytped_img.tif');