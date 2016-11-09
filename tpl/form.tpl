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
        <x-button type="primary" @click.native.prevent="handleSubmit">提交</x-button>
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
      handleSubmit (ev) {
        this.$refs.formData.validate((valid) => {
          if (valid) {
            console.log('submit success')
          } else {
            console.log('error submit!!')
            return false
          }
        })
      }
    },
    created () {
      //
    },
    watch: {
      //
    }
  }
</script>
<style scoped>
</style>