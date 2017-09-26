(* Thomas R. Cameron, Lab 2, 9/15/2017 *)

(* Problem 1 *)
val x = 2           (* this is a val binding *)
type count = int    (* this is a type binding *)
val pi:real = 3.14 and e:real = 2.71    (* use of and to perform multiple expressions *)
val m:int = 2
val r:int =
    let
        val m:int = 3
        val n:int =m*m
    in
        m*n
    end*m   (* use of let to override of value of m locally *)

fun fourthroot (x:real):real = Math.sqrt (Math.sqrt x)  (* concise function decleration *)

val x:real = 1.0
val y:real = 2.0
fun f(x:real):real = x+y
fun g(y:real):real = x+y
fun h(x:real,y:real,f:real->real,g:real->real):real = 
    let 
        val x:real = 3.0 
    in 
        f(x) 
    end*g(y)*f(x)

(* limiting scope using parameters and let expressions *)

val test:real=h(~1.0,3.0,f,g) (* val of test is 20.0 *)

val pair:int*int = (2,3)    (* ordered pair, 2-tuple *)
val triple:int*real*string = (2,2.0,"2")    (* ordered triple, 3-tuple *)
val pair_of_pairs:(int*int)*(real*real) = ((2,3),(2.0,3.0)) (* pair of pairs, nesting of parantheses matters *)

val (x:int, y:real, z:string) = triple
val ((_, _), (r:real, _)) = pair_of_pairs   (* pattern matching *)

(* Problem 2 *)
type vec = real*real and mat = (real*real)*(real*real)

val x:vec = (1.0,2.0)
val y:vec = (~1.0,1.0)
val a:mat = (x,y)

(* Problem 3 *)

local
    (* scalar multiple of a vector *)
    fun help1 (x:vec,c:real):vec =
        let
            val (x1:real, _) = x and (_, x2:real) = x
        in
            (c*x1,c*x2)
        end
    (* vector addition *)
    fun help2 (x:vec,y:vec):vec =
        let
            val (x1:real, _) = x and (_, x2:real) = x
            val (y1:real, _) = y and (_, y2:real) = y
        in
            (x1+y1,x2+y2)
        end
in
    (* matrix-vector multiplication *)
    fun mat_vec_mul(a:mat,x:vec):vec =
        let
            val (a1:vec, _) = a and (_, a2:vec) = a
            val (x1:real, _) = x and (_, x2:real) = x
        in
            help2(help1(a1,x1),help1(a2,x2))
        end
    (* rotation matrix *)
    fun rot(x:vec,t:real) =
        let
            val a:mat = ((Math.cos(t),Math.sin(t)),(~1.0*Math.sin(t),Math.cos(t)))
        in
            mat_vec_mul(a,x)
        end
end



