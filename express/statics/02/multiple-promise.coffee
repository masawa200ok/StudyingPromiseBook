do ->

  getUrl = (url) ->
    return new Promise((resolve, reject) ->
      req = new XMLHttpRequest()
      req.open("GET", url, true)
      req.onload = ->
        if req.status is 200
          console.log(req.responseText)
          resolve(req.responseText)
        else
          reject(new Error(req.statusText))
      req.onerror = (err) ->
        reject(new Error(req.statusText))
      req.send()
    )

  request = {
    comment: ->
      url = "http://localhost:3000/json/comment.json"
      getUrl(url).then(JSON.parse)
    
    people: ->
      url = "http://localhost:3000/json/people.json"
      getUrl(url).then(JSON.parse)
  }

  main = ->
    recordValue = (results, value) ->
      results.push(value)
      return results

    resultPusher = recordValue.bind(null, [])
  
    return request
      .comment().then(resultPusher)
      .then(request.people).then(resultPusher)

  btn = document.getElementById("run")
  btn.addEventListener("click", ->
    main()
      .then((value) ->
        console.log(value)
      ).catch((err) ->
        console.error(err)
      )
  )
