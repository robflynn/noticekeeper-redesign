<template>
  <table class="table datatable flex-grow table-header--left">
    <thead>
      <tr>
        <th v-bind:colspan="this.columns.length">
          <div class="flex row">
            <span v-if="title" class="datatable__title">{{ title }}</span>

            <div class="search-bar flex-grow">
              <input type="text" name="q" ref="searchbar" @keyup="_searchKeyUp" autocomplete="off" placeholder="search or filter" />
            </div>

            <!-- pagination -->
            <div class="datatable__pagination" v-if="this.pagination.total_pages > 1">
              Page {{ this.pagination.page }} of {{ this.pagination.total_pages }}

              <button v-bind:disabled="this.pagination.links.prev == undefined" class="datatable--prev" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.prev">Prev</button>
              <button v-bind:disabled="this.pagination.links.next == undefined" class="datatable--next" @click="_changePage($event)" v-bind:data-uri="this.pagination.links.next">Next</button>
            </div>
            <!-- end pagination -->

          </div>
        </th>
      </tr>

      <tr class="datatable__headers">
        <th v-for="column in columns"
            :key="column.field"
            @click="_columnClicked(column)"
            v-bind:data-column-name="column.field"
            v-bind:style="{ width: column.width, 'min-width': column.minWidth }"
          >
          <div class="flex row between">
            <div>{{ column.name || column.field }}</div>

            <span v-if="column.field != sortedColumn" class="sort fa fa-sort" />
            <span v-if="column.field == sortedColumn && sortDirection == 'asc'" class="sort fa fa-sort-up" />
            <span v-if="column.field == sortedColumn && sortDirection == 'desc'" class="sort fa fa-sort-down" />
          </div>
        </th>
      </tr>
    </thead>

    <tbody>
      <tr v-for="(row,i) in this.datasource" :key="i">
        <td v-for="column in columns" :key="column.field" @click="_dataTableRowClicked($event, row)" v-bind:data-column-type="column.type">
          {{ renderField(row, column, column.field) }}
          <span v-if="column.subField" class="subtext">{{ renderField(row, column, column.subField) }}</span>
        </td>
      </tr>
    </tbody>

  </table>
</template>

<script>
  var URI = require('urijs');
  const moment = require('moment')
  const currencyFormatter = require('currency-formatter')

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

      perPage: {
        type: Number,
        default: 15
      },

      uri: {
        type: String,
        required: true
      },

      title: {
        type: String
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
        },
      }
    },

    methods: {
      init() {
        this.loadURI()

        this.sortedColumn = null
        this.sortDirection = "desc"
      },

      loadURI(options = {}) {
        var uri = this.uri

        if (typeof options.uri !== 'undefined') {
          uri = options.uri
        }

        uri = URI(uri)

        if (typeof options.filter !== 'undefined') {
          uri.addQuery("q", options.filter)
        }

        uri.addQuery("per_page", this.perPage)

        if (this.sortedColumn && this.sortDirection) {
          uri.addQuery("sort_by", this.sortedColumn)
          uri.addQuery("sort_dir", this.sortDirection)
        }

        fetch(uri).then((response) => {
          return response.json()
        }).then( (data) => {
          console.log(data)
          let datasource = data[this.tmpThing]
          let pagination = data["meta"]["pagination"]

          this.datasource = datasource
          this.pagination = pagination
        })
      },

      _changePage($e) {
        this.loadURI({ uri: $e.target.dataset.uri })
      },

      _dataTableRowClicked(e, row, column) {
        if (this.rowWasSelected) {
          this.rowWasSelected(row, column)
        }
      },

      _searchKeyUp($event) {
        let query = this.$refs.searchbar.value;

        this.loadURI({ filter: query})
      },

      _columnClicked(column) {

        // If the sorted column is the same as the
        // clicked column toggle the sort order
        if (this.sortedColumn == column.field) {
          this._toggleSortOrder()
        } else {
          this.sortDirection = "asc"
        }

        this.sortedColumn = column.field

        this.loadURI()
      },

      _toggleSortOrder() {
        this.sortDirection = this.sortDirection == "asc" ? "desc" : "asc"
      },

      renderField(row, column, field) {
        var value = row[field]

        // If the user specified a filter we should use that
        if (column.filter) {
          value = column.filter(row, column, value)
        } else {
          // Otherwise, we should use our in-built filter
          if (column.type == "datetime") {
           return moment(value).format("LLL")
          }

          if (column.type == "currency") {
            return currencyFormatter.format(value / 100, { locale: 'en-US' })
          }
        }

        return value
      },
    }

  }
</script>

<style lang="scss">
  .datatable {
    $datatable--header-bg: darken(#f2f5f7, 5%);
    $datatable--hover-bg: #ebeff7;
    $border-radius: 0.5em;
    $border-color: darken($datatable--header-bg, 6%);

    user-select: none;

    border-collapse: collapse;

    margin: 10px;
    border-radius: $border-radius;
    border-style: hidden;
    box-shadow: 0 0 0 1px $border-color;

    background: #fff;

    width: 100%;

    td, th {
      padding: 15px;
      white-space: nowrap;

      .subtext {
        display: block;
        font-size: 0.8em;
        color: #999;
        margin-top: 8px;
      }

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

        td {
          padding-right: 30px;
        }

        td[data-column-type="currency"] {
          text-align: right;
        }

        &:hover {
          cursor: pointer;

          td {
            background-color: $datatable--hover-bg;
          }
        }
      }
    }

    &__pagination {
      padding-top: 10px;
      margin-left: 10px;
    }

    &__title {
      font-size: 1.2em;
      margin-bottom: 0;
      margin-top: 10px;
      margin-right: 25px;
    }

    &__headers {
      .sort {
        display: block;
        margin-left: 15px;
      }

      th {
        &:hover {
          background: red;
          cursor: pointer;
        }
      }
    }

    .search-bar {
      input {
        width: 100%;
        padding: 10px;
        font-size: 1em;
        border-radius: 8px;
        border: none;

        &:focus {
          outline: solid 1px rgba(0, 0, 255, 0.2)
        }
      }
    }

  }
</style>