/**
 * @file 命令信息提示帮助模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */
var log = require('./log')

var pkg = require('../package.json')
var help = '-v, --version     打印版本信息\ncreate <form/list> [path]     页面类型，路径'
var options = {
  '-h': help,
  '--help': help,
  '-v': pkg.version,
  '--version': pkg.version
}

exports.main = function (args) {
  if (options[args[0]]) {
    log.log(options[args[0]])
  } else {
    log.error('错误的信息命令' + args[0])
  }
}