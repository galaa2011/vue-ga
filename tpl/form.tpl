<template>
  <div class="form-container">
    <x-form
      :model="formData"
      :rules="rules"
      ref="formData"
      label-width="120px"
      class="create">
      <x-form-item label="名称" prop="name">
        <x-input
          style="width: 300px;"
          v-model="formData.name"
          auto-complete="off"
          display-words-count-bar
          display-words-count
          :maxlength="48">
        </x-input>
      </x-form-item>
      <x-form-item>
        <x-button type="primary" @click.native.prevent="submit">提交</x-button>
        <x-button @click.native.prevent="handleReset">重置</x-button>
      </x-form-item>
    </x-form>
  </div>
</template>

<script>
  // baseComponents
  import XFormItem from 'components/form-item'
  import XForm from 'components/form'
  import XInput from 'components/input'
  import XButton from 'components/button'

  // bizComponents

  // others

  export default {
    components: {
      XForm,
      XFormItem,
      XInput,
      XButton
    },
    data () {
      return {
        // 辅助数据
        edit: false,
        // 表单相关
        formData: {
          name: ''
        },
        // 验证相关
        rules: {
          name: [
            {
              type: 'string',
              required: true,
              trigger: 'blur',
              message: '请填写名称'
            },
            {
              trigger: 'blur',
              validator: (rule, value, callback) => {
                if (value.replace(/[^\x00-\xff]/g, 'zp').length > 48) {
                  callback(new Error('输入内容过长'))
                }
                if (!/^[\u4e00-\u9fa5_a-zA-Z0-9\s,:\.?!;()"'，：。？！；、（）“”‘’]+$/.test(value)) {
                  callback(new Error('名称 必须为中英文字符、数字、下划线或者常见标点字符'))
                }
                callback()
              }
            }
          ]
        }
      }
    },
    methods: {
      handleReset () {
        this.$refs.formData.resetFields()
      },
      beforeSubmit (formData) {
        return new Promise((resolve, reject) => {
          // 数据处理resolve or reject
          console.log('beforeSubmit')
          // 定义submitData，不直接改变this.formData的值，避免触发渲染
          let submitData = {}

          // 处理数据到约定格式
          for (let key in formData) {
            submitData[key] = formData[key]
          }
          resolve(submitData)
        })
      },
      submit (ev) {
        this.$refs.formData.validate((valid) => {
          if (valid) {
            this.beforeSubmit(this.formData)
              .then(formData => {
                this.submitRequester(formData)
                  .then(data => {
                    console.log('submit success!')
                    return data
                  })
                  .then(data => {
                    this.afterSubmit(data)
                  })
              })
          } else {
            console.log('error submit!!')
            return false
          }
        })
      },
      afterSubmit (data) {
        console.log('afterSubmit')
        this.$router.push({path: '/xxxx/list'})
      }
    },
    created () {
      //
    },
    watch: {
      // 根据具体模块修改id和接口submitRequester
      '$route': {
        immediate: true,
        handler (to, form) {
          if (to.query.id) {
            this.edit = true
            this.submitRequester = xxxx.update
          } else {
            this.submitRequester = xxxx.add
          }
        }
      }
    }
  }
</script>
<style scoped>
</style>