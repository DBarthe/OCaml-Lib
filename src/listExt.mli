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
