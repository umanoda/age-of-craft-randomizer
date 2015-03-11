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
    _useRule = ->
      name: 'random'
      extend_1: false
      extend_2: false

    # ランダムチョイスするカードの数
    _numberOf = ->
      attack: 1
      guard: 1
      exchage: 1
      relation: 1
      wealthy: 1
      other: 2

    # 攻撃系(attack)、防御系(guard)、変換系(exchange)
    # 交渉系(relation)、大得点系(wealthy)、その他(other)
    _card = ->
      attack: ["A:盗賊団","A:海賊","A:シノビノサト","A:馬賊"]
      guard: ["D:試作兵器","D:倉庫","D:砦","D:共済保険"]
      exchage: ["C:錬金術の館","C:船着き場","C:市場","C:行商"]
      relation: ["N:迎賓館","N:特産工芸所","N:鳩小屋","N:城塞"]
      wealthy: ["L:大城壁","L:アトリエ","L:公共事業","L:宝物庫"]
      other: ["O:貿易港","O:闇市","O:地上げ屋","O:詐欺師","O:賭博場","O:図書館","O:騎兵養成所","O:牢獄","O:キャラバン"]
    _extend_card = ->
      sharp_1:
        other: ["O:社交界", "O:建築家ギルド"]

    constructor: (options)->
      @useRule = _useRule()
      @numberOf = _numberOf()
      @card = _card()
      @extend_card = _extend_card()
      if options?
        setRule(options.useRule) if options.useRule?

    # 仕様レギュレーションの追加
    setRule: (options)->
      # 固有ルールの設定
      @useRule.name = options.name if options.name?

      # 拡張ルールの使用
      @useRule.extend_1 = options.extend_1 && options.extend_1?

    randmizer: ->
      result = []
      set_extend_1(@card, @extend_card) if @useRule.extend_1

      # 仕様レギュレーションによって動作を変更
      switch @useRule.name
        when "random"
          # 各カード種別から決められた枚数ずつ取得
          for key, num of @numberOf
            Array.prototype.push.apply result, array_rand(@card[key], num)
        when "chaos"
          # 完全ランダム
          chaos_cards = []
          total = 0
          for key, num of @numberOf
            Array.prototype.push.apply chaos_cards, @card[key]
            total += num
          Array.prototype.push.apply result, array_rand(chaos_cards, total)
        when "firstPlay"
          # 初回プレイの推奨カード
          result.push "A:盗賊団","N:迎賓館","C:市場","D:倉庫","L:大城壁","O:貿易港","O:図書館"

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

    # 「拡張＃1 設計と来訪」を反映
    set_extend_1 = (card, extend_card)->
      # 迎賓館を削除
      card.relation.some (val, idx)->
        @array.splice(idx, 1) if val is "迎賓館"
      Array.prototype.push.apply card.other, extend_card.sharp_1.other

)
