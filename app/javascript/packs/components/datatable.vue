<template>
  <table class="table datatable flex-grow table-header--left">
    <thead>
      <tr v-if="this.pagination.total_pages > 1">
        <th v-bind:colspan="Object.keys(this.columns).length">
          Page {{ this.pagination.page }} of {{ this.pagination.total_pages }}
          <button v-bind:disabled="this.pagination.links.prev == undefined" class="datatable--prev" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.prev">Prev</button>
          <button v-bind:disabled="this.pagination.links.next == undefined" class="datatable--next" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.next">Next</button>
        </th>
      </tr>

      <tr>
        <datatable-header-cell
          v-for="(column, i) in columns"
          :key="i"
          :column="i" />
      </tr>
    </thead>

    <tbody>
      <tr v-for="(row,i) in this.datasource" :key="i">
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
       * Column header labels and value associations
       */
      columns: {
        type: Object,
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

    mounted() {
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
  @import "../../stylesheets/global_workaround.scss";
</style>