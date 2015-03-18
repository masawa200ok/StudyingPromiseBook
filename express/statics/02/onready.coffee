
onReady = (fn) ->
  switch document.readyState
    when "interactive", "complete"
      setTimeout(fn, 3000)
    else
      window.addEventListener("DOMContentLoaded", fn)

onReady( ->
  console.log("=== DOM COMPLETE ===")
)

console.log("=== STARTING ===")
