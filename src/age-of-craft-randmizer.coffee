'use strict'

((def)->
  # CommonJS
  if typeof exports is "object"
    module.exports = def()

  # <script>
  else
    self.AgeOfCraft = def()
)( ->
  class AgeOfCraft
    cards = [1,2,3]

    constructor: ()->
      @tekitou = 2

    randmizer: ->
      [1,2,3]
)


console.log module.exports
