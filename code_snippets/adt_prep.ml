type 'a expr =
    F   of float
  | B   of bool
  | Add of float expr * float expr;;
Add(F 0.5, B true) (* type checks but won't evaluate *)
