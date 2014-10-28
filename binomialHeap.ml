(**
  File: binomialHeap.ml
  @author Barthelemy Delemotte

  Functional implementation of a binomial heap
*)

(** binomial tree *)
type 'a binomial_tree = {
  key: 'a ;
  order: int ;
  children: 'a binomial_tree list ;
}

(** binomial heap *)
type 'a t = {
  trees: 'a binomial_tree list ;
  compare: 'a -> 'a -> int ;
}

(** create a new binomial tree of the order 0 and the given [key] *)
let create_tree key =
  { key = key; order = 0; children = [] }

(** merge two binomial trees of the same order *)
let merge_trees compare_fun t1 t2 =
  assert (t1.order = t2.order) ;
  let order = t1.order + 1 in
  let (key, children) =
    if compare_fun t1.key t2.key <= 0 then
      (t1.key, t2 :: t1.children)
    else
      (t2.key, t1 :: t2.children) in
  { key = key; order = order; children = children }

(** create a new binomial heap with one element [elt] *)
let create compare_fun elt =
  let t = create_tree elt in
  { trees = [t]; compare = compare_fun }

(** create a new empty binomial heap *)
let empty compare_fun = 
  { trees = []; compare = compare_fun }

(** return true if the heap [h] is empty *)
let is_empty h =
  h.trees = []

(** merge two binomial heap [h1] and [h2] *)
let merge h1 h2 =
  let compare_fun = h1.compare in (* compare of h1 and h2 should be the same *)

  (* unreadable but tail-recursive *)
  let rec merge_trees_list accu ts1 ts2 carry_opt =

    let merge_same_order t1 t2 ts1 ts2 =  
      let carry = merge_trees compare_fun t1 t2 in
      merge_trees_list accu ts1 ts2 (Option.Some carry) in

    let with_carry carry =
      match ts1, ts2 with
      | t1::_, t2::_ when t1.order = t2.order ->
        merge_trees_list (carry :: accu) ts1 ts2 Option.None
      | t::ts', _ when carry.order = t.order -> merge_same_order carry t ts' ts2
      | _, t::ts' when carry.order = t.order -> merge_same_order carry t ts' ts1
      | _, _ -> merge_trees_list (carry :: accu) ts1 ts2 Option.None

    and with_none () =
      match ts1, ts2 with
      | t1::ts1', t2::_ when t1.order < t2.order ->
         merge_trees_list (t1 :: accu) ts1' ts2 Option.None
      | t1::_, t2::ts2' when t1.order > t2.order -> 
         merge_trees_list (t2 :: accu) ts1 ts2' Option.None
      | t1::ts1', t2::ts2' -> merge_same_order t1 t2 ts1' ts2'
      | _, [] -> List.rev_append accu ts1
      | [], _ -> List.rev_append accu ts2 in

    match carry_opt with
    | Option.Some carry -> with_carry carry
    | Option.None -> with_none () in

  let trees = merge_trees_list [] h1.trees h2.trees Option.None in 
  { trees = trees; compare = compare_fun }

(** insert an element [elt] in the binomial heap [h] *)
let insert elt h =
  let h' = create h.compare elt in
  if is_empty h then h' else merge h h'

(** find and return the minimum key contained in the heap [h] *)
let find_min h =
  let lambda o t = 
    Option.Some (Option.map_or o t.key
      (function k when h.compare k t.key <= 0 -> k | _ -> t.key)) in
  Option.expect (List.fold_left lambda Option.None h.trees) "binomialHeap.find_min"

(** Remove the min element from the heap *)
let delete_min h =
  let min_key = find_min h in
  let min_tree = List.find (fun t -> t.key = min_key) h.trees
  and trees = List.filter (fun t -> t.key != min_key) h.trees in
  let h = { trees = trees; compare = h.compare }
  and h' = { trees = List.rev min_tree.children; compare = h.compare } in
  merge h h'
