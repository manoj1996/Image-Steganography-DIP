README

Code :
File - 
1. 'sender.m' in the directory 'Sender'
2. 'receiver.m' in the directory 'Receiver'
3. Files 'aes_encryption.m', 'embedding.m', 'lsbstego.m', 'mix_column_fun.m', 's_box_fun.m', 'shift_rows_fun.m' and 'splitimage.m' in folder 'Library' of directory 'Sender' (dependencies for 'sender.m')
4. Files 'decryption.m', 'extract_img.m', 'extract_text.m', 'inv_mix_column_fun.m', 'inv_s_box_fun.m', 'inv_shift_rows_fun.m'and 'mergeimg.m'  in folder 'Library' of directory 'Sender' (dependencies for 'receiver.m')

Software Dependencies :
MATLAB

Steps to be followed :

Steps performed by sender -
1. Place the cover image in the directory 'Sender' with name, 'cover_img.jpg'
2. Place the secret image to be sent in the directory 'Sender' with name 'secret_img.jpg'
3. Open MATLAB and set the working directory to the directory 'Sender'.
4. Run the code 'sender.m' by executing the following command in the Command Window: 
    >> sender 
5. Output files - 
This code takes as input the secret image ('secret_img.jpg'), cover image ('cover_img.jpg'), and secret message and generates as output the segmented cover images with the secret image and message embedded in it in the folder 'output' ('img0.tif', ..., 'img15.tif'). The output of intermediate steps are also obtained in directory, 'Sender' that includes the encrypted secret image ('1-encrypted.tif'), encypted secret image + secret text in it ('2-image_with_text.tif'), embedded/stego image which contains the encypted secret image and secret text ('3-embedded_image.tif').
6. The images in the 'output' directory are sent to the receiver over the network.

Steps to be performed by receiver - 
1. The contents of the 'output' folder received is copied and pasted in the 'output' folder of the 'Receiver' directory.
2. Open MATLAB and set the working directory to the directory 'Receiver'.
3. Run the code 'receiver.m' by executing the following command in the Command Window: 
    >> receiver
4. Output files -
This code takes as input the segmented sub images in the folder 'output' ('img0.tif', ..., 'img15.tif') and generates as output the secret text which is printed on command prompt as well as the secret image ('SECRET_IMAGE.jpg'). The output of intermediate steps are also obtained in directory, 'Receiver' that includes the merged image containing information ('1-merged_image.tif') and the extracted encypted secret image + secret text in it ('2-extract_secret_image.tif') and the decrypted image ('4-decrytped_img.tif')

Note :
The above codes can take about 150 seconds for their execution.
Comments present in the source code provide a step-by-step explanation of each step.