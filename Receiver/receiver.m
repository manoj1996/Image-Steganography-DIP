%% Adding path of libraries
addpath('Library');

%% Merge images received by the receiver
merged_img = mergeimg();

%% Extract encrypted image from the merged image
encrypted_img = extract_img(merged_img);

%% Extract secret text from the encrypted image
secret_text = extract_text(encrypted_img);
disp(strcat('Secret Text : ', secret_text));

%% Extract original secret image from encrypted secret image
secret_img = decryption(encrypted_img);
imwrite(secret_img, 'SECRET_IMAGE.jpg');
figure('Name', 'Secret Image Received'), imshow(secret_img);
