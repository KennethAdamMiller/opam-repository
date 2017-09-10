open Swig;;
open Dai;;

let v = new_Var (C_list [(C_int64 (Int64.(of_int 0))) ; (C_int64 (Int64.(of_int 2)))]) in
let factors = new_VecFactor C_void in
let factor = new_Factor v in 
let _ = (invoke factors) "push_back" (factor) in
let fg = new_FactorGraph factors in 
let _ = print_endline ("hello world! " ) in ()
