let data = [ (0, 0); (1, 2); (2, 4); (3, 6);
             (4, 8); (5, 10); (6, 12); (7, 14) ]

let linreg_model points =
  let* m = normal 0. 2. in
  let* c = normal 0. 2. in
  List.fold
    points
    ~init:(return (m, c))
    ~f:(fun d (x,y) -> observe y (normal (m*x+c) 1.) d)

let slope = fmap fst (linreg_model data)
let y_intercept = fmap snd (linreg_model data)
