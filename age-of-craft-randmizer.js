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
    var cards;

    cards = [1, 2, 3];

    function AgeOfCraft() {
      this.tekitou = 2;
    }

    AgeOfCraft.prototype.randmizer = function() {
      return [1, 2, 3];
    };

    return AgeOfCraft;

  })();
});

console.log(module.exports);
