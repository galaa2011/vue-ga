/**
 * @file 命令扫描模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

var inArray = require('./utils').inArray

var command = ['create']

exports.main = function (args) {
  if (inArray(args[0], command)) {
    require(`./${args[0]}`).main(args)
  } else {
    require('./log').error('错误的执行命令' + args[0])
  }
}