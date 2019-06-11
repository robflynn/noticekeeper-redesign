<template>
  <table class="table datatable flex-grow table-header--left">
    <thead>
      <tr>
        <datatable-header
          v-for="(column, i) in columns"
          :key="i"
          :column="i" />
      </tr>
    </thead>

    <tbody>
      <tr v-for="row in datasource" :key="row">
        <td v-for="column_key in columns" :key="column_key" @click="_dataTableRowClicked($event, row, column_key)">
          {{ row[column_key] }}
        </td>
      </tr>
    </tbody>

  </table>
</template>

<script>
  export default {
    props: {
      /**
       * DataTable Data Source
       * @type {Array}
       */
      datasource: {
        type: Array,
        required: true,
        default: [],
      },

      /**
       * Column header labels and value associations
       */
      columns: {
        type: Object,
        required: true,
        default: [],
      },

      rowWasSelected: {
        type: Function,
        default: null,
        required: false,
      }
    },

    methods: {
      _dataTableRowClicked(e, row, column) {
        if (this.rowWasSelected) {
          this.rowWasSelected(row, column)
        }
      }
    }
  }
</script>

<style lang="scss">
  @import "../../stylesheets/global_workaround.scss";
</style>