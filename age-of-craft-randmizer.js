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
    var _card, _extend_card, _numberOf, _useRule, array_rand;

    _useRule = {
      name: 'random',
      basic: true,
      extend: false
    };

    _numberOf = {
      attack: 1,
      guard: 1,
      exchage: 1,
      relation: 1,
      wealthy: 1,
      other: 2
    };

    _card = {
      attack: ["盗賊団", "海賊", "シノビノサト", "馬賊"],
      guard: ["試作兵器", "倉庫", "砦", "共済保険"],
      exchage: ["錬金術の館", "船着き場", "市場", "行商"],
      relation: ["迎賓館", "特産工芸所", "鳩小屋", "城塞"],
      wealthy: ["大城壁", "アトリエ", "公共事業", "宝物庫"],
      other: ["貿易港", "闇市", "地上げ屋", "詐欺師", "賭博場", "図書館", "騎兵養成所", "牢獄", "キャラバン"]
    };

    _extend_card = {
      attack: [],
      guard: [],
      exchage: [],
      relation: [],
      wealthy: [],
      other: []
    };

    function AgeOfCraft(options) {
      if (options != null) {
        this.useRule.extend = (options.useRule != null) && (options.useRule.extend != null);
      }
    }

    AgeOfCraft.prototype.randmizer = function() {
      var key, num, result;
      result = [];
      for (key in _numberOf) {
        num = _numberOf[key];
        Array.prototype.push.apply(result, array_rand(_card[key], num));
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

    return AgeOfCraft;

  })();
});
