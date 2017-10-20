(* Thomas R. Cameron, Lab 5, 10/20/2017*)

(* Recursive Binding *)
val rec factorial : int->int =
    fn 0 => 1 | n:int => n*factorial(n-1)

(* A better factorial *)
local
    val rec helper : int*int->int =
        fn (0,r:int) => r | (n:int,r:int) => helper(n-1,n*r)
in
    val fac : int->int =
        fn n:int => helper(n,1)
end

(* pow1: simple recursive function *)
val rec pow1 : (real*int)->real =
    fn (a:real,0) => 1.0 | (a:real,n:int) => a*pow1(a:real,n-1)

(* pow2: simple tail recursion *)
local
    val rec helper : real*int*real->real =
        fn (a:real,0,r:real) => r 
            | (a:real,n:int,r) => helper(a,n-1,r*a)
in
    val pow2 : real*int->real =
        fn (a:real,n:int) => helper(a,n,1.0)
end


(* pow3: minimize the number of subproblmes*)
val rec pow3 : real*int->real =
    fn (a:real,0) => 1.0 | (a:real,n:int) => if (n mod 2)=0 then pow3(a,n div 2)*pow3(a,n div 2) else a*pow3(a,n-1)

(* Horner's Method *)
val x:real list = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0]

local
    val rec helper : real list*real*real*int->real =
        fn  (x:real list,t:real,r:real,0) => r
        |   (x:real list,t:real,r:real,1) => helper(x,t,r*t+List.nth(x,0),0)
        |   (x:real list,t:real,r:real,n:int) => helper(x,t,r*t+List.nth(x,n-1),n-1)
in
    fun horner(x:real list,t:real):real =
        let
            val n:int = List.length(x)
        in
            helper(x,t,List.nth(x,n),n)
        end
end


