do ->

  getURLCallback = (url, callback) ->
    req = new XMLHttpRequest()
    req.open("GET", url, true)
    req.onload = ->
      if req.status is 200
        console.log("req.onload and req.status is 200")
        callback(null, req.responseText)
      else
        console.log("req.onload and req.status isn't 200")
        callback(new Error(req.statusText, req.response))
    req.onerror = ->
      console.log("req.onerror")
      callback(new Error(req.statusText))
    req.send()

  jsonParse = (callback, err, value) ->
    if err
      callback(err, value)
    else
      try
        result = JSON.parse(value)
        callback(null, result)  # success to parse json
      catch e
        callback(e, value)

  allRequest = (requests, callback, results) ->
    if requests.length is 0
      return callback(null, results)
    task = requests.shift()
    task((err, value) ->
      if err
        callback(err, value)
      else
        results.push(value)
        allRequest(requests, callback, results)
    )

  tasks = {
    comment: (callback) ->
      url = "http://localhost:3000/json/comment.json"
      # jsonParseをcallbackとする
      return getURLCallback(url, jsonParse.bind(null, callback))

    people: (callback) ->
      url = "http://localhost:3000/json/people.json"
      # jsonParseをcallbackとする
      return getURLCallback(url, jsonParse.bind(null, callback))
  }

  main = (callback) ->
    allRequest([tasks.comment, tasks.people], callback, [])

  btn = document.getElementById("run")
  btn.addEventListener("click", ->
    main((err, results) ->
      if err
        console.error(err)
      else
        console.log("click end")
        console.dir(results)
    )
  )

