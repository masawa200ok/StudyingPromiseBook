// Generated by CoffeeScript 1.9.0
(function() {
  var btn, getUrl, main, request;
  getUrl = function(url) {
    return new Promise(function(resolve, reject) {
      var req;
      req = new XMLHttpRequest();
      req.open("GET", url, true);
      req.onload = function() {
        if (req.status === 200) {
          console.log(req.responseText);
          return resolve(req.responseText);
        } else {
          return reject(new Error(req.statusText));
        }
      };
      req.onerror = function(err) {
        return reject(new Error(req.statusText));
      };
      return req.send();
    });
  };
  request = {
    comment: function() {
      var url;
      url = "http://localhost:3000/json/comment.json";
      return getUrl(url).then(JSON.parse);
    },
    people: function() {
      var url;
      url = "http://localhost:3000/json/people.json";
      return getUrl(url).then(JSON.parse);
    }
  };
  main = function() {
    var recordValue, resultPusher;
    recordValue = function(results, value) {
      results.push(value);
      return results;
    };
    resultPusher = recordValue.bind(null, []);
    return request.comment().then(resultPusher).then(request.people).then(resultPusher);
  };
  btn = document.getElementById("run");
  return btn.addEventListener("click", function() {
    return main().then(function(value) {
      return console.log(value);
    })["catch"](function(err) {
      return console.error(err);
    });
  });
})();
