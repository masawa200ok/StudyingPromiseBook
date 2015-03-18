url = "http://localhost:3000/02/02.index.htmla"

getHtml = (url) ->
  return new Promise((resolve, reject) ->
    console.log("promise create start")
    req = new XMLHttpRequest()
    req.open("GET", url, true)
    req.onload = ->
      if req.status is 200
        resolve(req.responseText)
      else
        console.log("req.status error")
        reject(new Error(req.statusText))
    req.onerror = ->
      console.log("req.onerror")
      reject(new Error(req.statusText))
    req.send()
    console.log("promise create end")
  )

onCompleted = (text) ->
  console.log("onCompleted start")
  resultSpace = document.getElementById("result")
  textNode = document.createTextNode(text)
  resultSpace.appendChild(textNode)
  console.log("onCompleted end")

button = document.getElementById("run")
button.addEventListener("click", ->
  console.log("add event start")
  getHtml(url)
    .then((value) ->
      onCompleted(value)
    ).catch((err) ->
      console.log("getHtml catch")
      onCompleted(err)
    )
  console.log("add event end")
)


