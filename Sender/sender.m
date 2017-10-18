%% Adding path of libraries
addpath('Library');
%% Reading the secret image and cover image
secret_img = imread('secret_img.jpg');
cover_img = imread('cover_img.jpg');

cov_size = size(cover_img);
sec_size = size(secret_img);
if(sec_size(1)*sec_size(2) * 8 > cov_size(1)*cov_size(2)*cov_size(3))
    disp('Cover image too small for the secret image');
    return;
end
%% Setting the secret message to be send to the receiver
secret_msg = 'My credit card CVV is 482. The PIN of this card is 8632.';

%% Step 1 - AES Encyption of secret image
encrypted_img = aes_encryption(secret_img);

if((length(secret_msg)+1)*8 > sec_size(1)*sec_size(2))
    disp('Secret message too long to be fit into the secret message');
    return;
end
%% Step 2 - LSB based steganography to hide secret message in the encrypted secret image
img_with_text = lsbstego(encrypted_img, secret_msg);

%% Step 3 - LSB based steganography to hide encryped secret image with text into the cover image
stego_img = embedding(cover_img, img_with_text);

%% Step 4 - Split the images to be sent to the receiver
splitimage(stego_img);

% The images that have been split and saved as img[0-15].tif must be
% shipped to the receiver. The receiver runs the receiver module to fetch
% back the secret message and secret image.