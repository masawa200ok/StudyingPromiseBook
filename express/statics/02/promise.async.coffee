do ->
  btn = document.getElementById("run")
  btn.addEventListener("click", ->
    promise = new Promise((resolve) ->
      console.log("inner promise")
      resolve("hoge")
    )

    promise.then((value) ->
      console.log(value)
    )

    console.log("outer promise")
  )
