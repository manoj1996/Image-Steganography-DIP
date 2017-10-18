function [out] = mergeimg()
%% Merging of input image files back to the original image on the receiver's end
for i = 0:3
    for j = 0:3
        temp = imread(strcat('output/img', num2str(4*i + j), '.tif'));
        if j == 0            
            img = temp;
        else
            img = [img temp];
        end
    end
    if i == 0
        out = img;
    else
        out = [out; img];
    end
end
imwrite(out, '1-merged_image.tif');