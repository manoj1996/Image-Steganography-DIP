function [mix_column_out] = mix_column_fun (mix_column_in)

idx_1 = 1:16;
idx_2 = [idx_1(5:16) idx_1(1:4)];
idx_3 = [idx_2(5:16) idx_2(1:4)];
idx_4 = [idx_3(5:16) idx_3(1:4)];

data_in_mul_2 = mix_column_in * 2;
mask = bitget(data_in_mul_2, 9)*27;
mul_2 = bitxor(mod(data_in_mul_2, 256), mask);

data_in_mul_3 = bitxor(data_in_mul_2, mix_column_in);
mask = bitget(data_in_mul_3, 9)*27;
mul_3 = bitxor(mod(data_in_mul_3, 256), mask);

mix_column_out = bitxor(bitxor(mul_2(:,idx_1), mul_3(:,idx_2)), bitxor(mix_column_in(:,idx_3), mix_column_in(:,idx_4)));
