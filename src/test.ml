
let test_priority_queue () =
  print_endline "testing PriorityQueue" ;
  let rec make q = function
  | 0 -> q
  | n -> 
    let q = PriorityQueue.push q (Random.int 100) in
    make q (n - 1) in

  let rec check_sorted = function
  | x::((x'::xs) as next) -> if x > x' then false else check_sorted next
  | _ -> true in

  let len = 1000 in
  let q = make (PriorityQueue.create Pervasives.compare) len in
  assert (PriorityQueue.length q = len) ;
  let l = PriorityQueue.to_list q in
  assert (List.length l = len) ;
  assert (check_sorted l )

let () = test_priority_queue () ;;