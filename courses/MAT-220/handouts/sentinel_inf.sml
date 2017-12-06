(* SML: Sentinel Uses of Infinity, Thomas R. Cameron, November 3, 2017 *)

(* Max Function *)
val rec max : real list->real =
    fn x:real list =>
        let
            val k1:real = List.nth(x,0)
            val k2:real = List.nth(x,1)
        in
                if k2<Real.posInf then
                    let
                        val m:real = max(List.drop(x,1))
                    in
                        if m>k1 then m else k1
                    end
                else
                    k1
                        
        end

val x:real list = [~1.0,1.0,~1.0/2.0,1.0/2.0,5.0/2.0,~5.0/2.0,2.0]
val test = max(x@[Real.posInf])
