'use strict';
var ref$, map, fold1;
ref$ = require('prelude-ls'), map = ref$.map, fold1 = ref$.fold1;
module.exports = function(circuit, type){
  var series, parallel;
  series = fold1(curry$(function(x$, y$){
    return x$ + y$;
  }));
  parallel = function(){
    return (function(it){
      return Math.pow(it, -1);
    })(fold1(curry$(function(x$, y$){
      return x$ + y$;
    }), map((function(it){
      return Math.pow(it, -1);
    }), arguments[0])));
  };
  switch (type) {
  case 'series':
  case 's':
    return series(circuit);
  case 'parallel':
  case 'p':
    return parallel(circuit);
  default:
    return 'Please enter a valid type of resistors association.';
  }
};
function curry$(f, bound){
  var context,
  _curry = function(args) {
    return f.length > 1 ? function(){
      var params = args ? args.concat() : [];
      context = bound ? context || this : this;
      return params.push.apply(params, arguments) <
          f.length && arguments.length ?
        _curry.call(context, params) : f.apply(context, params);
    } : f;
  };
  return _curry();
}