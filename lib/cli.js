/**
 * @file 命令行功能模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

/**
 * 解析参数。作为命令行执行的入口
 *
 * @param {Array} args 参数列表
 */
exports.start = function (args) {
  args = args.slice(2)
  if (args[0] === 'create') {
    console.log('开始创建文件...')
    require('./create').main(args)
  }
}