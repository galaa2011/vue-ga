/**
 * @file 日志信息接口
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

var chalk = require('chalk')
var log = {}
var fns = [
  {name: 'trace', color: chalk.grey},
  {name: 'debug', color: chalk.grey},
  {name: 'log', color: chalk.grey},
  {name: 'info', color: chalk.green},
  {name: 'warn', color: chalk.yellow},
  {name: 'error', color: chalk.red}
]
fns.forEach(function (item) {
  log[item.name] = function (msg) {
    console.log(item.color(msg))
  }
})
module.exports = log