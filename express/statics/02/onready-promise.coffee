
promise = do ->
  return new Promise((resolve, reject) ->
    switch document.readyState
      when "interactive", "complete"
        console.log("loaded!!!")
        resolve()
      else
        console.log("loading...")
        window.addEventListener("DOMContentLoaded", resolve)
  )

onReady = ->
  console.log("=== DOM COMPLETE ===")

promise.then(onReady)

console.log("=== STARTING ===")
