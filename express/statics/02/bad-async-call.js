// Generated by CoffeeScript 1.9.0
(function() {
  (function() {
    var anAsyncCall, badAsyncCall, badRun, btn, goodRun, incr;
    console.log("bad-async-call");
    incr = function(value) {
      value++;
      console.log("incr: " + value);
      return value;
    };

    /*
     * bad Async
     */
    badAsyncCall = function(promise) {
      console.log("badAsyncCall");
      promise.then(incr);
      return promise;
    };
    badRun = function() {
      var promise;
      console.log("badRun start");
      promise = Promise.resolve(0);
      promise = badAsyncCall(promise);
      return promise = badAsyncCall(promise);
    };
    btn = document.getElementById("badRun");
    btn.addEventListener("click", badRun);

    /*
     * Async
     */
    anAsyncCall = function(promise) {
      console.log("anAsyncCall");
      return promise.then(incr);
    };
    goodRun = function() {
      var promise;
      console.log("goodRun start");
      promise = Promise.resolve(0);
      promise = anAsyncCall(promise);
      return promise = anAsyncCall(promise);
    };
    btn = document.getElementById("goodRun");
    return btn.addEventListener("click", goodRun);
  })();

}).call(this);
