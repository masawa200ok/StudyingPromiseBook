do ->
  console.log("bad-async-call")

  incr = (value) ->
    value++
    console.log("incr: #{value}")
    return value

  ###
  # bad Async
  ###
  badAsyncCall = (promise) ->
    console.log("badAsyncCall")
    #return promise.then(incr)
    promise.then(incr)
    return promise

  badRun = ->
    console.log("badRun start")
    promise = Promise.resolve(0)
    promise = badAsyncCall(promise)  # 1
    promise = badAsyncCall(promise)  # 1

  btn = document.getElementById("badRun")
  btn.addEventListener("click", badRun)
  
  ###
  # Async
  ###
  anAsyncCall = (promise) ->
    console.log("anAsyncCall")
    return promise.then(incr)

  goodRun = ->
    console.log("goodRun start")
    promise = Promise.resolve(0)
    promise = anAsyncCall(promise)  # 1
    promise = anAsyncCall(promise)  # 2

  btn = document.getElementById("goodRun")
  btn.addEventListener("click", goodRun)
  


