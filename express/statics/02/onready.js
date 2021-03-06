// Generated by CoffeeScript 1.9.0
var onReady;

onReady = function(fn) {
  switch (document.readyState) {
    case "interactive":
    case "complete":
      return setTimeout(fn, 3000);
    default:
      return window.addEventListener("DOMContentLoaded", fn);
  }
};

onReady(function() {
  return console.log("=== DOM COMPLETE ===");
});

console.log("=== STARTING ===");
