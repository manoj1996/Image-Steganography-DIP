v = imread('embedded.jpg');
[s1 s2 s3] = size(v);
i = 1; 
j = 1;
in = 0;
cond = true;
while (cond)
    img = v(i:i+(s1/4)-1, j:j+(s2/4)-1,:);
    j = j+(s2/4);
    if j > s2
        i = i+(s1/4);
        j = 1;
        if i > s1
            cond = false;
        end
    end
    imshow(img);
    imwrite(img, strcat('img', num2str(in), '.jpg'));
    in = in + 1;
end