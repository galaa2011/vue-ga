/**
 * @file 命令行功能模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

/**
 * [resolveArgs] 分解带有'-'的参数
 * @param  {[Array]} args [命令行参数]
 * @return {[Array]} args [分解后参数]
 */
function resolveArgs (args) {
  var _args =[]
  for (var i = 0; i < args.length; i++) {
    if (args[i].indexOf('-') > -1) {
      _args.push(args.splice(i, 1)[0])
    }
  }
  return args.concat(_args)
}

/**
 * 解析参数。作为命令行执行的入口
 *
 * @param {Array} args 参数列表
 */
exports.start = function (args) {
  args = resolveArgs(args.slice(2))
  if (args[0] === 'create') {
    require('./create').main(args)
  } else if (args[0].indexOf('-') !== -1) {
    require('./help').main(args)
  } else {
    require('./log').warn('ga: 扶翼Vue重构脚手架工具')
  }
}