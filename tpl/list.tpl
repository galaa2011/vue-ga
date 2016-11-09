<template>
  <div class="list-container">
    <div class="list-page">
      <x-button type="info" size="small" @click.native="create">新建</x-button>
      <x-table
        border
        v-loading.fullscreen="loading"
        selection-mode="multiple"
        :data="datasource">
        <x-table-column width="50" type="selection"></x-table-column>
        <x-table-column
          prop="name"
          min-width="150"
          label="名称">
        </x-table-column>
        <x-table-column
          prop="date"
          min-width="120"
          :formatter="format"
          label="日期">
        </x-table-column>
        <x-table-column
          label="操作"
          inline-template>
          <x-button type="text" @click.native="edit(row.id)">编辑</x-button>
        </x-table-column>
      </x-table>
      <div style='float:right;margin-top: 10px;'>
        <x-pagination
          layout="total, sizes, prev, pager, next, jumper"
          @sizechange="handleSizeChange"
          @currentchange="handleCurrentChange"
          :current-page="page"
          :page-sizes="[10, 30, 50, 100]"
          :page-size="pageSize"
          :total="total">
        </x-pagination>
      </div>
    </div>
  </div>
</template>
<script>
  // 公共组件
  import XButton from 'components/button'
  import XTableColumn from 'components/table-column'
  import XTable from 'components/table'
  import XPagination from 'components/pagination'
  import Loading from 'components/loading'
   // others
  import moment from 'moment'

  export default {
    components: {
      XButton,
      XTableColumn,
      XTable,
      XPagination,
      Loading
    },
    data () {
      return {
        loading: false,
        datasource: [],
        page: 1,
        pageSize: 10,
        total: 0
      }
    },
    methods: {
      format (row, column) {
        return moment().format('YYYY-MM-DD')
      },
      create () {
        this.$router.push({path: '/xxx/create'})
      },
      edit (id) {
        this.$router.push({path: '/xxx/create', query: {id}})
      },
      loadData () {
        // api 请求数据
      },
      handleSizeChange (value) {
        this.pageSize = value
        // 重置page到1
        this.page = 1
        this.loadData()
      },
      handleCurrentChange (value) {
        this.page = value
        this.loadData()
      }
    },
    created () {
      this.loadData()
    },
    computed: {
      //
    },
    watch: {
      //
    }
  }
</script>
<style scoped></style>