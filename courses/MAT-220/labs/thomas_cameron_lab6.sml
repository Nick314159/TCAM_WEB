(* Thomas Cameron, Lab 6, 10/30/2017 *)

val f1 : 'a -> 'a =
    fn x:'a => x

val f2 = fn x => x

val f3 : 'a*'b -> 'b =
    fn (x:'a, y:'b) => y

(* Composition of two functions *)
val g : 'a -> 'a =
    fn x:'a => f1 f2 x

(* adding to elements *)
val double = fn x => x+x;

let
    val double = fn x => x+x;
in
    (double 1.0, double 2.0)
end

(* name record *)
fun lead (x:int,_) = x
