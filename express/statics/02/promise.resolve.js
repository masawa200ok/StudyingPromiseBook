// Generated by CoffeeScript 1.9.0
(function() {
  var btn, fn;
  console.log("start up start");
  fn = function() {
    return Promise.resolve("hoge").then(function(value) {
      console.log("hoge 1");
      setTimeout(function() {
        return console.log(value);
      }, 3000);
      return console.log("hoge 2");
    });
  };
  btn = document.getElementById("run");
  console.log("start up end");
  return btn.addEventListener("click", fn);
})();
