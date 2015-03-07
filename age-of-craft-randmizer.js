'use strict';
(function(def) {
  if (typeof exports === "object") {
    return module.exports = def();
  } else {
    return self.AgeOfCraft = def();
  }
})(function() {
  var AgeOfCraft;
  return AgeOfCraft = (function() {
    var _card, _extend_card, _numberOf, _useRule, array_rand, set_extend_1;

    _useRule = function() {
      return {
        name: 'random',
        extend_1: false,
        extend_2: false
      };
    };

    _numberOf = function() {
      return {
        attack: 1,
        guard: 1,
        exchage: 1,
        relation: 1,
        wealthy: 1,
        other: 2
      };
    };

    _card = function() {
      return {
        attack: ["盗賊団", "海賊", "シノビノサト", "馬賊"],
        guard: ["試作兵器", "倉庫", "砦", "共済保険"],
        exchage: ["錬金術の館", "船着き場", "市場", "行商"],
        relation: ["迎賓館", "特産工芸所", "鳩小屋", "城塞"],
        wealthy: ["大城壁", "アトリエ", "公共事業", "宝物庫"],
        other: ["貿易港", "闇市", "地上げ屋", "詐欺師", "賭博場", "図書館", "騎兵養成所", "牢獄", "キャラバン"]
      };
    };

    _extend_card = function() {
      return {
        sharp_1: {
          other: ["社交界", "建築家ギルド"]
        }
      };
    };

    function AgeOfCraft(options) {
      this.useRule = _useRule();
      this.numberOf = _numberOf();
      this.card = _card();
      this.extend_card = _extend_card();
      if (options != null) {
        if (options.useRule != null) {
          setRule(options.useRule);
        }
      }
    }

    AgeOfCraft.prototype.setRule = function(options) {
      if (options.name != null) {
        this.useRule.name = options.name;
      }
      return this.useRule.extend_1 = options.extend_1 && (options.extend_1 != null);
    };

    AgeOfCraft.prototype.randmizer = function() {
      var chaos_cards, key, num, ref, ref1, result, total;
      result = [];
      if (this.useRule.extend_1) {
        set_extend_1();
      }
      switch (this.useRule.name) {
        case "random":
          ref = this.numberOf;
          for (key in ref) {
            num = ref[key];
            Array.prototype.push.apply(result, array_rand(this.card[key], num));
          }
          break;
        case "chaos":
          chaos_cards = [];
          total = 0;
          ref1 = this.numberOf;
          for (key in ref1) {
            num = ref1[key];
            Array.prototype.push.apply(chaos_cards, this.card[key]);
            total += num;
          }
          Array.prototype.push.apply(result, array_rand(chaos_cards, total));
          break;
        case "firstPlay":
          result.push("盗賊団", "迎賓館", "市場", "倉庫", "大城壁", "貿易港", "図書館");
      }
      return result;
    };

    array_rand = function(array, num) {
      var i, idx, result, targetArray;
      result = [];
      targetArray = Array.apply(null, array);
      i = 0;
      while (i < num) {
        idx = Math.floor(Math.random() * targetArray.length);
        Array.prototype.push.apply(result, targetArray.splice(idx, 1));
        i = i + 1;
      }
      return result;
    };

    set_extend_1 = function() {
      this.card.relation.some(function(val, idx) {
        if (val === "迎賓館") {
          return this.array.splice(idx, 1);
        }
      });
      return Array.prototype.push.apply(this.card.other, this.extend_card.sharp_1.other);
    };

    return AgeOfCraft;

  })();
});
