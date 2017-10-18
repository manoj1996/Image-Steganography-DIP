clc; close all;

%% HD Dimension
HD_Rw = 1080;
HD_Cl = 1920;

%% Image Read
image_in = imresize(imread('cameraman.tif'), [HD_Rw HD_Cl]);

%% Divide image in to Nx16 block
image_x_16 = double(reshape(image_in', 16,(HD_Rw*HD_Cl/16))');

%% Key
key = 0:15;
key = mod(key, 256);
key_i = repmat(key, size(image_x_16,1), 1);

%% Encryption
tic;
s_box_o = s_box_fun(image_x_16);
shift_rows_o = shift_rows_fun(s_box_o);
mix_col_o = mix_column_fun(shift_rows_o);
xor_key_o = bitxor(mix_col_o, key_i);
encrypt_o = uint8(reshape(xor_key_o', HD_Cl, HD_Rw)');
enc_time = toc;

%% Divide image in to Nx16 block
image_x_16 = double(reshape(encrypt_o', 16, (HD_Rw*HD_Cl/16))');

%% Decryption
tic;
xor_key_o = bitxor(image_x_16, key_i);
inv_mix_col_o = inv_mix_column_fun(xor_key_o);
inv_shift_rows_o = inv_shift_rows_fun(inv_mix_col_o);
inv_s_box_o = inv_s_box_fun(inv_shift_rows_o);
decrypt_o = uint8(reshape(inv_s_box_o', HD_Cl, HD_Rw)');
dec_time = toc;

%% Display
% figure, imshow([image_in encrypt_o decrypt_o], [0 255]); 
figure, 
subplot(221), imshow(image_in); title('Input Image');
subplot(222), imshow(encrypt_o, [0 255]); title('Encrypted Image');
subplot(223), imshow(decrypt_o, [0 255]); title('Decrypted Image');
