(* Thomas R. Cameron, Lab 3, 9/29/2017 *)

(* Problem 1: Examples *)

(* record type binding - hyperlink *)
type hyperlink =
    { protocol : string,
        address : string,
        display : string }

(* record value binding - mailto_thc *)
val mailto_thc : hyperlink =
    { protocol = "mailto",
        address = "thcameron@davidson.edu",
        display = "Thomas Cameron" }

(* pattern matching to extract elements from record *)
val { protocol=x, display=y, address=z } = mailto_thc

(* extract only one element from record using wildcard symbol *)
val { display=x, protocol=_, address=_ } = mailto_thc

(* extract only one element from record using ellipsis *)
val { address=x, ... } = mailto_thc

(* make the labes in the record act as variables *)
val { protocol, address, display } = mailto_thc

(* length of vector function *)
fun length (x1:real, x2:real):real = Math.sqrt (x1*x1 + x2*x2)

(* real roots of quadratic polynomial *)
fun quad_root (a:real, b:real, c:real):real*real = 
    let
        val f1 = ~b/(2.0*a)
        val f2 = Math.sqrt(b*b-4.0*a*c)/(2.0*a)
    in
        (f1+f2,f1-f2)
    end

(* pattern matching against values of heterogenous type *)
val 0 = 1-1
val (0,x) = (2-2,#"a")
(* val 0 = 2-1 *)

(* boolean negation *)
val lneg : bool -> bool =
    fn true => false 
    | false => true

fun lneg2(true) = false
    | lneg2(false) = true

(* not exhaustive *)
(* fun lneg(true) = false *)

(* redundant *)
(* fun fac(n:int) = n*fac(n-1)
    | fac(0) = 1 *)

(* factorial *)
fun fac(0) = 1
    | fac(n:int) = n*fac(n-1)


(* Problem 2: Complex Record *)
type complex =
    {   rpart : real,
        ipart : real    }

(* Problem 3: Power Function *)
fun pow(a:real,0) = 1.0
    | pow(a:real,n:int) = pow(a,n-1)*a;

(* Problem 4: Complex Power *)

fun cpow(z:complex,n:int):complex =
    let
        val { rpart=x, ipart=y } = z
        val t = Math.atan2(y, x)
        val r = Math.sqrt(x*x+y*y)
        val t = t*Real.fromInt(n)
        val r = pow(r,n)
    in
        { rpart = r*Math.cos(t), ipart = r*Math.sin(t) }
    end

(* test *)
val z:complex = {rpart = ~2.0,ipart = 3.0}
val test:complex = cpow(z,5)
