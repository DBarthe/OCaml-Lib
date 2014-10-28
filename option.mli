(**
  Optional type

  @author Barthelemy Delemotte
*)

(** The optional type. *)
type 'a t = Some of 'a | None

(** [is_some option] returns true if the [option] is a [Some] value. *)
val is_some : 'a t -> bool 

(** [is_none option] returns true if the [option] is a [None] value. *)
val is_none : 'a t -> bool

(** [expect option msg] returns the value contained in [option].
    @raise Failure [msg] if the [option] is a [None] value. *)
val expect : 'a t -> string -> 'a 

(** [unwrap option] returns the value contained in [option].
    @raise Failure if the [option] is a [None] value. *)
val unwrap : 'a t -> 'a

(** [unwrap_of option def] returns the value contained in [option] or [def] 
    if [option] is [None]. *)
val unwrap_or : 'a t -> 'a -> 'a

(** [unwrap_or_else option f] is like [unwrap_or] but with the default value
    given by calling the closure function [f]. *)
val unwrap_or_else : 'a t -> (unit -> 'a) -> 'a

(** [map option f] maps an [option] of type 'a to an option of type 'b by applying the
    function [f] to the contained value. (Note: [None] gives [None]) *)
val map : 'a t -> ('a -> 'b) -> 'b t

(** [map_or option def f] maps an [option] of type 'a to a value of type 'b
    by applying the function [f] if [option] is a [Some] value, or taking
    the value [def] otherwise. *)
val map_or : 'a t -> 'b -> ('a -> 'b) -> 'b 

(** [map_or_else option def_fun map_fun] is like [map_or] but with the default
    value given by calling the closure function [def_fun] instead of the value
    directly. *)
val map_or_else : 'a t -> (unit -> 'b) -> ('a -> 'b) -> 'b
