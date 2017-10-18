function [shift_rows_out] = shift_rows_fun (shift_rows_in)

idx = [1 2 3 4 6 7 8 5 11 12 9 10 16 13 14 15];

shift_rows_out = shift_rows_in(:, idx);
