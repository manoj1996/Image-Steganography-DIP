function [inv_mix_column_out] = inv_mix_column_fun (inv_mix_column_in)

idx_1 = 1:16;
idx_2 = [idx_1(5:16) idx_1(1:4)];
idx_3 = [idx_2(5:16) idx_2(1:4)];
idx_4 = [idx_3(5:16) idx_3(1:4)];

data_in_mul_2 = inv_mix_column_in * 2;
mask = bitget(data_in_mul_2, 9)*27;
mul_2 = bitxor(mod(data_in_mul_2, 256), mask);

data_in_mul_4 = mul_2 * 2;
mask = bitget(data_in_mul_4, 9)*27;
mul_4 = bitxor(mod(data_in_mul_4, 256), mask);

data_in_mul_8 = mul_4 * 2;
mask = bitget(data_in_mul_8, 9)*27;
mul_8 = bitxor(mod(data_in_mul_8, 256), mask);

mul_9 = bitxor(mul_8, inv_mix_column_in);
mul_b = bitxor(bitxor(mul_8, mul_2), inv_mix_column_in);
mul_d = bitxor(bitxor(mul_8, mul_4), inv_mix_column_in);
mul_e = bitxor(bitxor(mul_8, mul_4), mul_2);

inv_mix_column_out = bitxor(bitxor(mul_e(:,idx_1), mul_b(:,idx_2)), bitxor(mul_d(:,idx_3), mul_9(:,idx_4)));
