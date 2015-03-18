do ->
  console.log("start up start")
  fn = ->
    Promise.resolve("hoge").then((value) ->
      console.log("hoge 1")
      setTimeout( ->
          console.log(value)
        , 3000)
      console.log("hoge 2")
    )

  btn = document.getElementById("run")
  console.log("start up end")
  btn.addEventListener("click", fn)

