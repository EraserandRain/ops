'use strict';
function product(arr) {
    var sum=arr.reduce(function (x, y) {
        return x * y;
    })
    console.log(sum);
}
product([0,2,3]);
module.exports = product;