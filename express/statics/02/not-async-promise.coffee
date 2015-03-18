do ->

  doPromise = do ->

    taskA = (value) ->
      value++
      console.log("taskA: value: #{value}")

    taskB = (value) ->
      value++
      console.log("taskB: value: #{value}")

    taskC = (value) ->
      value++
      console.log("taskC: value: #{value}")

    return ->
      promise = Promise.resolve(1)
      promise.then(taskA)
      promise.then(taskB)
      promise.then(taskC)

  btn = document.getElementById("run")
  btn.addEventListener("click", doPromise)
