for i = 0:3
    for j = 0:3
        temp = imread(strcat('img', num2str(4*i + j), '.jpg'));
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
imshow(out)
imwrite(out, 'output.jpg');