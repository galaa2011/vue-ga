/**
 * @file 命令行功能模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

let fs = require('fs')

/**
 * 解析参数。作为命令行执行的入口
 *
 * @param {Array} args 参数列表
 */
exports.parse = function ( args ) {
  args = args.slice(2)
  console.log(args)
}