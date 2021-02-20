var sprinkler_model = function (method) {
  return function () {
    var sprinkler = function () {
      var cloudy = bernoulli({ p: 0.5 });
      var rain = cloudy
          ? bernoulli({ p: 0.8 })
          : bernoulli({ p: 0.2 });
      var sprinkler = cloudy
          ? bernoulli({ p: 0.1 })
          : bernoulli({ p: 0.5 });
      var wet_grass = rain
          ? (sprinkler? 0.99 : 0.9)
          : (sprinkler? 0.9  : 0.);
      condition(wet_grass);
      return rain;
    };
    return Infer(method, sprinkler);
  };
};
