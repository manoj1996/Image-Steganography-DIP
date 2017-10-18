function [] = splitimage(out_img)
%% Splitting of image into 16 sub images for transmission of data
%Initializing the required variables
[s1, s2, ~] = size(out_img);
i = 1; 
j = 1;
in = 0;
cond = true;

%Running a while loop to split the image into sub-images as required
while (cond)
    img = out_img(i:i+(s1/4)-1, j:j+(s2/4)-1,:); %Splitting the image into 16 equal parts using s1/4 and s2/4
    j = j+(s2/4);
    if j > s2
        i = i+(s1/4);
        j = 1;
        if i > s1
            cond = false;
        end
    end
    imwrite(img, strcat('output/img', num2str(in), '.tif')); %write every image into the disk as img(num).tif
    in = in + 1;
end