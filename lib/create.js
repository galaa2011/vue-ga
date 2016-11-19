/**
 * @file 创建page功能模块
 *
 * @author galaa2011[zhaopeng7353@163.com]
 */

var fs = require('fs')
var path = require('path')
var mkdirp = require('mkdirp')
var handlebars = require('handlebars')
var log = require('./log')

// 页面类型
var PAGE_TYPES = ['list', 'form']

function inArray (ele, arr) {
  var flag = false
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === ele) {
      flag = true
      break
    }
  }
  return flag
}

/**
 * [main] 新建page模板主函数
 * @param  {[Array]} args [命令行参数]
 */
exports.main = function (args) {
  log.log('开始创建文件...')
  if (inArray(args[1], PAGE_TYPES)) {
    var toFile = path.resolve(process.cwd(), './' + (args[2] || `${args[1]}.vue`))
    var tplFile = path.resolve(__dirname, '../tpl', args[1] + '.tpl')

    var source = fs.readFileSync(tplFile, 'UTF-8')
    var tpl = handlebars.compile(source)
    var result = tpl({})

    if (!fs.existsSync(toFile) || inArray('-f', args)) {
      mkdirp.sync(path.dirname(toFile))
      fs.writeFileSync(toFile, result, 'UTF-8')
      log.info('创建成功')
    } else {
      log.warn('文件已存在，使用-f参数强制覆盖')
    }
  } else {
    log.error('新建page类型错误，使用--help参数查看帮助')
  }
}