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
    # nameがrandomの時にいろいろする。firstPlayなどの名前がつくと、固有のカードを配布する
    _useRule =
      name: 'random'
      basic: true
      extend: false

    # ランダムチョイスするカードの数
    _numberOf =
      attack: 1
      guard: 1
      exchage: 1
      relation: 1
      wealthy: 1
      other: 2

    # 攻撃系(attack)、防御系(guard)、変換系(exchange)
    # 交渉系(relation)、大得点系(wealthy)、その他(other)
    _card =
      attack: ["盗賊団","海賊","シノビノサト","馬賊"]
      guard: ["試作兵器","倉庫","砦","共済保険"]
      exchage: ["錬金術の館","船着き場","市場","行商"]
      relation: ["迎賓館","特産工芸所","鳩小屋","城塞"]
      wealthy: ["大城壁","アトリエ","公共事業","宝物庫"]
      other: ["貿易港","闇市","地上げ屋","詐欺師","賭博場","図書館","騎兵養成所","牢獄","キャラバン"]
    _extend_card =
        attack: []
        guard: []
        exchage: []
        relation: []
        wealthy: []
        other: []

    constructor: (options)->
      if options?
        # 拡張ルールの使用
        @useRule.extend = options.useRule? && options.useRule.extend?

    randmizer: ->
      result = []
      for key, num of _numberOf
        Array.prototype.push.apply result, array_rand(_card[key], num)
      result

    ##############
    # Private
    ##############

    # 配列からランダムにnum個の要素を取得する
    array_rand = (array, num)->
      result = []
      targetArray = Array.apply(null, array)
      i = 0
      while i < num
        idx = Math.floor( Math.random() * targetArray.length )
        Array.prototype.push.apply result, targetArray.splice(idx, 1)
        i = i + 1
      result
)
