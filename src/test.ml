let log module_name =
  Printf.printf "Testing module %s ...\n" module_name

let test_priority_queue () =
  log "PriorityQueue" ;
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


let test_utils () = 
  log "Utils" ;
  assert (Utils.range 0 4 = [0;1;2;3;4]) ;
  assert (Utils.range 42 42 = [42] );
  assert (Utils.range 5 4 = []);
  assert (Utils.range 1 6 ~step:2 = [1;3;5]) ;
  assert (Utils.rev_range 5 1 = [5;4;3;2;1]) ;
  assert (Utils.rev_range 8 1 ~step:3 = [8;5;2]) ;
  assert (Utils.rev_range 1 2 = []) ;

  let f x = x * x and g x = x + 1 in
  assert ( (Utils.(-|) f g) 2 = 9)



let tests = [
  test_priority_queue ;
  test_utils ;
] 

let do_tests () = 
  List.iter (fun test_fun -> test_fun ()) tests ;;

let () = do_tests () ;;
