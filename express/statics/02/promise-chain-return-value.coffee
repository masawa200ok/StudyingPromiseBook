do ->

  doPromise = ->
    taskA = (value) ->
      return value * 2

    taskB = (value) ->
      return value * 3

    onRejected = (err) ->
      console.log("onRejected: #{err}")

    onFullfilled = (value) ->
      console.log("value is #{value}")

    promise = Promise.resolve(1)
    promise
      .then(taskA)
      .then(taskB)
      .catch(onRejected)
      .then(onFullfilled)
    return promise

  btn = document.getElementById("run")
  btn.addEventListener("click", doPromise)
