do ->

  taskA = ->
    msg = "TaskA Error"
    console.log(msg)
    throw new Error(msg)

  taskB = ->
    console.log("TaskB Completed")

  taskC = ->
    console.log("TaskC Completed")

  onRejected = (err) ->
    console.log("onRejected: #{err}")

  onFullfilled = ->
    console.log("onFullfilled")

  btn = document.getElementById("run")
  btn.addEventListener("click", ->
    promise = Promise.resolve()
    promise
      .then(taskA)
      .then(taskB)
      .catch(onRejected)
      .then(onFullfilled)
  )




