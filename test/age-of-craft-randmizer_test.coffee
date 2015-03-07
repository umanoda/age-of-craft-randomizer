AgeOfCraft = require('../age-of-craft-randmizer')
should = require('should')

describe 'age-of-craft', ->
  it '何も設定しないでランダマイズすると、７つの要素を取得する', ->
    aoc = new AgeOfCraft()
    aoc.randmizer().length.should.equal(7)

  it '初回プレイ次の推奨ランダムカードは固定されている', ->
    aoc= new AgeOfCraft()
    aoc.setRule name: 'firstPlay'
    aoc.randmizer().length.should.equal(7)
    aoc.randmizer().should.containEql("盗賊団")
    aoc.randmizer().should.containEql("迎賓館")
    aoc.randmizer().should.containEql("市場")
    aoc.randmizer().should.containEql("倉庫")
    aoc.randmizer().should.containEql("大城壁")
    aoc.randmizer().should.containEql("貿易港")
    aoc.randmizer().should.containEql("図書館")
