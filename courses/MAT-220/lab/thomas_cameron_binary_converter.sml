(*Thomas R. Cameron, Binary Converter, 8/31/2017*)

fun ord_to_bin(n:int,bin:int list) =
let
    val r = n mod 2
    val m = n div 2
in
    if length(bin)=8 then (n,bin) else ord_to_bin(m,[r]@bin)
end;

fun foo(n:int,bin:int list):int list = bin;

fun char_to_bin(a:char):int list =
let
    val n = ord a
    val bin = []
in
    foo(ord_to_bin(n,bin))
end;

fun bin_to_char(bin:int list):char =
let
    val n = 128*List.nth(bin,0)+64*List.nth(bin,1)+32*List.nth(bin,2)+16*List.nth(bin,3)+8*List.nth(bin,4)+4*List.nth(bin,5)+2*List.nth(bin,6)+List.nth(bin,7)
in
    chr n
end;
