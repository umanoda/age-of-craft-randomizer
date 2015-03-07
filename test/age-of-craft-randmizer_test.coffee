AgeOfCraft = require('../age-of-craft-randmizer')
should = require('should')

describe 'age-of-craft', ->
  it '何も設定しないでランダマイズすると、７つの要素を取得する', ->
    agf = new AgeOfCraft()
    agf.randmizer().length.should.equal(7)
