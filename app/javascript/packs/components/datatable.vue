<template>
  <table class="table datatable flex-grow table-header--left">
    <thead>
      <tr v-if="this.pagination.total_pages > 1">
        <th v-bind:colspan="this.columns.length">
          Page {{ this.pagination.page }} of {{ this.pagination.total_pages }}
          <button v-bind:disabled="this.pagination.links.prev == undefined" class="datatable--prev" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.prev">Prev</button>
          <button v-bind:disabled="this.pagination.links.next == undefined" class="datatable--next" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.next">Next</button>
        </th>
      </tr>

      <tr>
        <datatable-header-cell
          v-for="column in columns"
          :key="column.field"
          :column="column.name" />
      </tr>
    </thead>

    <tbody>
      <tr v-for="(row,i) in this.datasource" :key="i">
        <td v-for="column in columns" :key="column.field" @click="_dataTableRowClicked($event, row, column_key)">
          {{ row[column.field] }}
        </td>
      </tr>
    </tbody>

  </table>
</template>

<script>
  export default {
    props: {
      /**
       * Column header labels and value associations
       */
      columns: {
        type: Array,
        required: true,
        default: [],
      },

      uri: {
        type: String,
        required: true
      },

      // I'm going to change the API and call the results 'data' or 'items'
      // or something like that. This is a place holder until I get around to that
      //
      // Tells us which key in the paginated results contains our results
      tmpThing: {
        type: String,
        required: true
      },

      rowWasSelected: {
        type: Function,
        default: null,
        required: false,
      }
    },

    beforeMount() {
      this.init()
    },

    data() {
      return {
        datasource: [],
        pagination: {
          links: {
          }
        }
      }
    },

    methods: {
      init() {
        this.loadURI()
      },

      loadURI(uri = null) {
        if (uri == null) {
          uri = this.uri
        }

        fetch(uri).then((response) => {
          return response.json()
        }).then( (data) => {
          let datasource = data[this.tmpThing]
          let pagination = data["meta"]["pagination"]

          this.datasource = datasource
          this.pagination = pagination
        })

      },

      _changePage($e) {
        this.loadURI($e.target.dataset.uri)
      },

      _dataTableRowClicked(e, row, column) {
        if (this.rowWasSelected) {
          this.rowWasSelected(row, column)
        }
      }
    }
  }
</script>

<style lang="scss">
  .datatable {
    $datatable--header-bg: #f2f5f7;
    $datatable--hover-bg: #ebeff7;
    $border-radius: 0.5em;
    $border-color: darken($datatable--header-bg, 6%);

    border-collapse: collapse;

    margin: 10px;
    border-radius: $border-radius;
    border-style: hidden;
    box-shadow: 0 0 0 1px $border-color;

    td, th {
      padding: 15px;
    }

    thead {
      background: $datatable--header-bg;

      color: #444;
      font-weight: 800;
      text-align: left;
      border-radius: 10px;

      tr:first-child {
        th:first-child {
          border-top-left-radius: $border-radius;
        }

        th:last-child {
          border-top-right-radius: $border-radius;
        }
      }

      tr:last-child {
        th {
          border-bottom: solid 1px $border-color;
        }
      }
    }

    tbody {
      tr {
        border-bottom: solid 1px lighten($border-color, 5%);

        &:hover {
          cursor: pointer;

          td {
            background-color: $datatable--hover-bg;
          }

        }
      }
    }
  }
</style>