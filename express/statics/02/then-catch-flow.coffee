do ->
  taskA = ->
    console.log("Task A")
  
  taskB = ->
    console.log("Task B")

  onRejected = (err) ->
    console.log("Catch Error: A or B Task", err)

  finalTask = ->
    console.log("Final Task")

  btn = document.getElementById("run")
  btn.addEventListener("click", ->
    promise = Promise.resolve()
    promise
      .then(taskA)
      .then(taskB)
      .catch(onRejected)
      .then(finalTask)
  )

