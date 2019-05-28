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

    <tfoot>
      <tr>
        <th colspan="8">Footer</th>
      </tr>
    </tfoot>   

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
 .table {
    $cellPadding: 0.5em;
    $yellow: rgb(244, 247, 180);
    $darkBlue: rgb(42, 69, 112);
    $rowBorder: solid 1px rgba(0, 0, 0, 0.1);

    thead {
      tr {
        th, td {        
          background: $darkBlue;
          color: #eee;
          font-weight: bold;
          padding: $cellPadding;
        }

        &:last-child {
          th, td {
            border-bottom: solid 1px rgba(0, 0, 0, 0.1)        
          }
        }
      }
    }

    &-header {
      &--left {
        thead th,
        thead td {
          text-align: left;
        }
      }
    }

    tbody {
      td {
        padding: $cellPadding;
      }

      tr {
        &:nth-child(odd) {
          td {
            background-color: #eee;
            border-bottom: $rowBorder;
          }
        }

        &:last-child {
          td {
            border-bottom: $rowBorder;
          }
        }

        &:hover {
          td {
            background-color: $yellow;
            cursor: pointer;
          }
        }
      }
    }

    tfoot {
      th, td {
        background: #444;
        color: #fff;
        padding: $cellPadding;
      }

      tr {
        &:last-child {
          td, th {
            border-bottom: $rowBorder;
          }
        }
      }
    }
  }  
</style>