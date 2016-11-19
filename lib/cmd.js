/**
 * @file 命令扫描模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

var command = ['create']

exports.main = function (args) {
  if (command.includes(args[0])) {
    require(`./${args[0]}`).main(args)
  } else {
    require('./log').error('错误的执行命令' + args[0])
  }
}