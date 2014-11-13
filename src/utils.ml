(**
  Basic functions that ocaml should aready have (I think).

  @author Barthelemy Delemotte
*)

(* range [start..stop] *)
let range ?(step=1) start stop =
  assert (step > 0) ; 
  let rec aux accu i =
    if i > stop then List.rev accu
    else aux (i::accu) (i+step) in
  aux [] start

(* infix version of range *)
let (--) = range ~step:1

(* reversed range *)
let rev_range ?(step=1) start stop =
  assert (step > 0) ;
  let rec aux accu i =
    if i < stop then List.rev accu
    else aux (i::accu) (i-step) in
  aux [] start

(* function composition *)
let (-|) f g = fun x -> f (g x)