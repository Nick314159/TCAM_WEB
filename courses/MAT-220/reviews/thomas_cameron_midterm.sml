(* Thomas Cameron, SML Midterm, 10/6/2017 *)

(* Part a: Implication *)
fun impl(true,false) = false
    | impl(x:bool,y:bool) = true

(* Part b: Power base 2 *)
fun pow2(0) = 1
    | pow2(n:int) = 2*pow2(n-1)

(* Part b: binary to char *)
fun bin_to_char(x:int*int*int*int*int*int*int*int):char =
    let
        val (x7,x6,x5,x4,x3,x2,x1,x0) = x
        val a = x0*pow2(0)+x1*pow2(1)+x2*pow2(2)+x3*pow2(3)+x4*pow2(4)+x5*pow2(5)+x6*pow2(6)+x7*pow2(7)
    in
        Char.chr(a)
    end

(* Part b: testing *)
val x1:int*int*int*int*int*int*int*int=(0,1,1,0,0,0,0,1)
val test1:char = bin_to_char(x1)

(* Part c: char to binary *)
fun char_to_bin(x:char):int*int*int*int*int*int*int*int = 
    let
        val n:int = Char.ord(x)
        val x0 = n mod 2 and n = n div 2
        val x1 = n mod 2 and n = n div 2
        val x2 = n mod 2 and n = n div 2
        val x3 = n mod 2 and n = n div 2
        val x4 = n mod 2 and n = n div 2
        val x5 = n mod 2 and n = n div 2
        val x6 = n mod 2 and n = n div 2
        val x7 = n mod 2 and n = n div 2
    in
        (x7,x6,x5,x4,x3,x2,x1,x0)
    end

val x2 = #"a"
val test2 = char_to_bin(x2)
