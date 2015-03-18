say = (msg) ->
  console.log("#{@name} say '#{msg}'")

###
# call
###
say.call({name: "よつば"}, "いいわけはじごくできく(call)")

###
# apply
###
say.apply({name: "よつば"}, ["いいわけはじごくできく(apply)"])

###
# bind object
###
plusWithMsg = (msg) ->
  console.log("Message: #{@name} #{msg} #{@a} + #{@b} = #{@a + @b}")

calc1plus2 = plusWithMsg.bind({
  name: "よつば",
  a: 1,
  b: 2
}, "が計算します（bind）...")
calc1plus2()

calc3plus4 = plusWithMsg.bind({
  name: "よつば",
  a: 3,
  b: 4
}, "が計算します（bind）...")
calc3plus4()


