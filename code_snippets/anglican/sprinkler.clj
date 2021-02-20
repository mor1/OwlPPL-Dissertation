(defquery sprinkler
  (let [ cloudy (sample (flip 0.5))
         rain (cond
                (= cloudy true) (sample (flip 0.8))
                (= cloudy false) (sample (flip 0.2))
                )
         sprinkler (cond
                     (= cloudy true) (flip 0.1)
                     (= cloudy false) (flip 0.5))
         wet-grass
         (cond
           (and (= rain true) (= sprinkler true)) (flip 0.99)
           (and (= rain true) (= sprinkler false)) (flip 0.9)
           (and (= rain false) (= sprinkler true)) (flip 0.9)
           (and (= rain false) (= sprinkler false)) (flip 0.1))
         ]
    (observe wet-grass true)
    rain))
