(**
  List extension.

  @author barthelemy delemotte
*)

(** [zip l1 l2] takes two lists and returns a list of corresponding pairs.
    If one input is short, excess elements are discarded. *)
val zip : 'a list -> 'b list -> ('a * 'b) list

(** [take n l] returns the prefix of [l] of length [n] max. *)
val take : int -> 'a list -> 'a list

(** [take_while f l] returns the longest prefix of [l] with
    all element satisfying the predicate [f]. *)
val take_while : ('a -> bool) -> 'a list -> 'a list

(** [drop n l] dicards [n] leading elements (if possible) of [l]. *)
val drop : int -> 'a list -> 'a list

(** [drop_while f l] discards leading elements of [l] until the
    predicate [f] is not satisfyed. *)
val drop_while : ('a -> bool) -> 'a list -> 'a list

(** [init length f] returns a list of [length] elements initialized with the
    function [f], called with the element's index as parameter. *)
val init : int -> (int -> 'a) -> 'a list

(** [flatten_opti l] does the same job than
    [List.flatten] except it's tail-recursive. *)
val flatten_opti : 'a list list -> 'a list

(** [map_opti f l] does the same than [List.map] but is tail
    recursive. *)
val map_opti : ('a -> 'b) -> 'a list -> 'b list
