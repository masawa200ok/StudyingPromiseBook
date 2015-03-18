// Generated by CoffeeScript 1.9.0
(function() {
  var btn;
  btn = document.getElementById("run");
  return btn.addEventListener("click", function() {
    var promise;
    promise = new Promise(function(resolve) {
      console.log("inner promise");
      return resolve("hoge");
    });
    promise.then(function(value) {
      return console.log(value);
    });
    return console.log("outer promise");
  });
})();
