/**
 * @file 工具
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

/**
 * [inArray 表示某个数组是否包含给定的值]
 * @param  {[type]} value    [给定值]
 * @param  {[Array]} array   [某个数组]
 * @return {[Boolean]}       [方法返回一个布尔值]
 */
exports.inArray = function (value, array) {
  if (array.includes) {
    return array.includes(value)
  } else {
    var flag = false
    for (var i = 0; i < array.length; i++) {
      if (array[i] === value) {
        flag = true
        break
      }
    }
    return flag
  }
}