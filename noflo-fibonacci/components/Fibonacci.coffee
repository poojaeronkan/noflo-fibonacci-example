noflo = require "noflo"

class Fibonacci extends noflo.Component
  description: "This component receives data on a single input
  port and sends the same data out to the output port"

  constructor: ->
    # Register ports
    @inPorts =
      in: new noflo.Port()
    @outPorts =
      out: new noflo.Port()

    @inPorts.in.on "data", (data) =>
      fibonacciValue = @fibonacci(parseInt(data))
      @outPorts.out.send fibonacciValue

    @inPorts.in.on "disconnect", =>
      @outPorts.out.disconnect()

  fibonacci: (number) ->
    if (number <= 1)
      return number
    else
      return @fibonacci(number-1) + @fibonacci(number-2)

exports.getComponent = -> new Fibonacci()