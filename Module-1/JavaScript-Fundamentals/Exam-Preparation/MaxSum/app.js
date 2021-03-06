'use strict';

function solve(params) {
    var n = parseInt(params[0]);
    var currentSum = 0;

    params = params.slice(1).map(Number);
    var maxSum = params[0];

    var length = params.length;
    for (var i = 0; i < length; i += 1) {
        var index = 0;

        while (true) {
            if (index === length + 1) {
                break;
            }

            for (var j = i; j < index; j += 1) {
                currentSum += params[j];

                if (currentSum > maxSum) {
                    maxSum = currentSum;
                }
            }

            currentSum = 0;
            index += 1;
        }
    }

    return maxSum;
}


var input1 = [8, 1, 6, -9, 4, 4, -2, 10, -1];

var input2 = [6, 1, 3, -5, 8, 7, -6];

var input3 = [9, -9, -8, -8, -7, -6, -5, -1, -7, -6];

var input4 = [10, 1255569, -851435, 1457629, 858237, 221970, -652780, 1379095, -732864, -606100, 1566514];

console.log(solve(input1) == 16);
console.log(solve(input2) == 15);
console.log(solve(input3) == -1);
console.log(solve(input4) == 3895835);

// function solve(input) {
//     var i, j, k, length, maxSum,
//         currentSum = 0;

//     input = input.slice(1).map(Number);

//     maxSum = input[0];

//     length = input.length;
//     for (i = 0; i < length; i += 1) {
//         for (j = i; j < length; j += 1) {
//             for (k = i; k <= j; k += 1) {
//                 currentSum += input[k];
//             }

//             if (currentSum > maxSum) {
//                 maxSum = currentSum;
//             }

//             currentSum = 0;
//         }
//     }

//     console.log(maxSum);
// }

// input = [
//     8, 1, 6, -9, 4, 4, -2, 10, -1
// ];

// input2 = [
//     6, 1, 3, -5, 8, 7, -6
// ];

// input3 = [
//     9, -9, -8, -8, -7, -6, -5, -1, -7, -6
// ];

// var input4 = [10,
// 1255569,
// -851435,
// 1457629,
// 858237,
// 221970,
// -652780,
// 1379095,
// -732864,
// -606100,
// 1566514];

// //solve(input);
// //solve(input2);
// //solve(input3);

// solve(input4);