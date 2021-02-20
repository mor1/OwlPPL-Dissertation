let sprinkler_model =
  let* cloudy    = bernoulli 0.5 in
  let* rain      = bernoulli (if cloudy then 0.8 else 0.2)
  and* sprinkler = bernoulli (if cloudy then 0.1 else 0.5) in
  let* wet_grass = bernoulli (match rain, sprinkler with
      | true,  true  -> 0.99
      | true,  false -> 0.9
      | false, true  -> 0.9
      | false, false -> 0.0
    )
  in
  condition wet_grass
    (return rain)
