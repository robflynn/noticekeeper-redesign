<template>
  <div class="datatable flex-grow">
    <table class="table table-header--left">
      <thead>
        <tr class="datatable__filter">
          <th v-bind:colspan="this.columns.length">
            <div class="flex row">
              <span v-if="title" class="datatable__title">{{ title }}</span>

              <div class="search-bar flex-grow">
                <input
                  type="text"
                  name="q"
                  ref="searchbar"
                  v-model="filter"
                  @keyup="_searchKeyUp"
                  autocomplete="off"
                  placeholder="Type to filter..."
                />
              </div>
            </div>
          </th>
        </tr>

        <tr v-if="this.datasource.length > 0" class="datatable__headers">
          <th
            v-for="column in columns"
            :key="column.field"
            @click="_columnClicked(column)"
            v-bind:data-column-name="column.field"
            v-bind:style="{ width: column.width, 'min-width': column.minWidth }"
          >
            <div class="flex row between">
              <div>{{ column.name || column.field }}</div>

              <span v-if="column.field != sortedColumn" class="sort fa fa-sort" />
              <span
                v-if="column.field == sortedColumn && sortDirection == 'asc'"
                class="sort fa fa-sort-up"
              />
              <span
                v-if="column.field == sortedColumn && sortDirection == 'desc'"
                class="sort fa fa-sort-down"
              />
            </div>
          </th>
        </tr>
      </thead>

      <tbody>
        <template v-if="this.datasource.length > 0">
          <tr v-for="(row,i) in this.datasource" :key="i">
            <td
              v-for="column in columns"
              :key="column.field"
              @click="_dataTableRowClicked($event, row)"
              v-bind:data-column-type="column.type"
            >
              {{ renderField(row, column, column.field) }}
              <span
                v-if="column.subField"
                class="subtext"
              >{{ renderField(row, column, column.subField) }}</span>
            </td>
          </tr>
        </template>
        <template v-else>
          <tr>
            <td>No items found...</td>
          </tr>
        </template>
      </tbody>

      <tfoot>
        <th v-bind:colspan="this.columns.length">
          <div class="flex row between" v-if="pagination.total_pages > 1">
            <div class="datatable__results-summary">
              <template>
                  {{ pagination.total_objects }} results, showing {{ this.paginated_range() }}
              </template>
            </div>

            <!-- pagination -->
            <div class="datatable__pagination" v-if="this.pagination.total_pages > 1">
              <button v-for="button in paginationButtons()"
                      :key="button.label"
                      v-bind:class="button.class"
                      v-bind:data-page="button.page"
                      @click="_pageClicked(button.page)"
                      role="button"
              >

                      {{ button.label }}
              </button>
            </div>
            <!-- /pagination -->
          </div>
        </th>
      </tfoot>
    </table>
  </div>
</template>

<script>
var URI = require("urijs");
const moment = require("moment");
const currencyFormatter = require("currency-formatter");

export default {
  props: {
    /**
     * Column header labels and value associations
     */
    columns: {
      type: Array,
      required: true,
      default: []
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
      required: false
    }
  },

  beforeMount() {
    this.init();
  },

  data() {
    return {
      datasource: [],
      pagination: {
        links: {}
      },
      filter: ''
    };
  },

  methods: {
    init() {
      this.loadURI();

      this.sortedColumn = null;
      this.sortDirection = "desc";
    },

    paginated_range() {
      let recordStart = (this.pagination.per_page * (this.pagination.page - 1)) + 1
      let recordEnd = recordStart + this.pagination.per_page - 1

      return `${recordStart} - ${recordEnd}`
    },

    paginationButtons() {
      let buttons = []
      let page = this.pagination.page
      let pages = this.pagination.total_pages
      let look_back = 3

      if (page > 1) {
        buttons.push({ label: "<", page: page - 1, class: "datatable__pagination__prev-page datatable__pagination__button"})
      }

      let pageStart = page - look_back

      for (var i = 0; i < look_back; i++) {
        if (pageStart > 1) {
          buttons.push({ label: pageStart , page: pageStart, class: "datatable__pagination__button" })
        }

        pageStart++;
      }

      buttons.push({ label: pageStart, class: "current-page no-style" })

      pageStart = page + 1

      for (var i = 0; i < look_back; i++) {
        if (pageStart < pages) {
          buttons.push({ label: pageStart, page: pageStart, class: "datatable__pagination__button" })
        }

        pageStart++;
      }

      if (page + look_back < pages) {
        buttons.push({ label: "...", class: "no-style" })
      }

      if (page < pages) {
        buttons.push({ label: ">", page: page + 1, class: "datatable__pagination__button pagination__next-page"})
      }

      return buttons
    },

    loadURI(options = {}) {
      var uri = this.uri;

      if (typeof options.uri !== "undefined") {
        uri = options.uri;
      }

      uri = URI(uri);

      if (typeof this.filter !== "undefined" && this.filter !== '') {
        uri.addQuery("q", this.filter);
      }

      let page = 1
      if (typeof options.page !== "undefined") {
        page = parseInt(options.page)
      }
      uri.addQuery("page", page)

      uri.addQuery("per_page", this.perPage);

      if (this.sortedColumn && this.sortDirection) {
        uri.addQuery("sort_by", this.sortedColumn);
        uri.addQuery("sort_dir", this.sortDirection);
      }
      console.log(options)
      console.log(uri.toString())

      fetch(uri)
        .then(response => {
          return response.json();
        })
        .then(data => {
          console.log(data);
          let datasource = data[this.tmpThing];
          let pagination = data["meta"]["pagination"];

          this.datasource = datasource;
          this.pagination = pagination;
        });
    },

    _changePage($e) {
      this.loadURI({ uri: $e.target.dataset.uri });
    },

    _pageClicked(page) {
      this.loadURI({ page: page })
    },

    _dataTableRowClicked(e, row, column) {
      if (this.rowWasSelected) {
        this.rowWasSelected(row, column);
      }
    },

    _searchKeyUp($event) {
      let query = this.$refs.searchbar.value;

      this.loadURI({ filter: query });
    },

    _columnClicked(column) {
      // If the sorted column is the same as the
      // clicked column toggle the sort order
      if (this.sortedColumn == column.field) {
        this._toggleSortOrder();
      } else {
        this.sortDirection = "asc";
      }

      this.sortedColumn = column.field;

      this.loadURI();
    },

    _toggleSortOrder() {
      this.sortDirection = this.sortDirection == "asc" ? "desc" : "asc";
    },

    renderField(row, column, field) {
      var value = row[field];

      // If the user specified a filter we should use that
      if (column.filter) {
        value = column.filter(row, column, value);
      } else {
        // Otherwise, we should use our in-built filter
        if (column.type == "datetime") {
          return moment(value).format("LLL");
        }

        if (column.type == "currency") {
          return currencyFormatter.format(value / 100, { locale: "en-US" });
        }
      }

      return value;
    }
  }
};
</script>

<style lang="scss">
.datatable {
  $border-radius: 0.5em;
  margin-bottom: 25px;

  width: 100%;
  box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.05);
  border-radius: $border-radius;

  table {
    $datatable--hover-bg: #ebeff7;

    user-select: none;

    border-collapse: collapse;

    border-radius: $border-radius;
    border-style: hidden;
    box-shadow: 0 0 0 1px solid 1px #f0eff4;

    background: #fff;

    width: 100%;

    td,
    th {
      padding: 15px;
      white-space: nowrap;

      .subtext {
        display: block;
        font-size: 0.8em;
        color: #999;
        margin-top: 8px;
      }
    }

    tfoot {
      background: var(--nk-sidebar-background-color);

      th {
        text-align: right;
        padding-right: 50px;
        color: #e1e1ff;

        border-bottom-right-radius: $border-radius;
        border-bottom-left-radius: $border-radius;
      }
    }

    thead {
      background: var(--nk-datatable-header-background);

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
          // border-bottom: solid 1px red;
        }
      }
    }

    tbody {
      tr {
        // border-bottom: solid 1px lighten(red, 5%);

        &:nth-child(odd) {
          background: hsl(218, 25%, 98%);
        }


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
  }

  &__results-summary {
    margin-top: 20px;
    display: block;
  }

  &__pagination {
    font-size: 0.8em;

    &__button {
      cursor: pointer;
      margin: 5px;
      border: solid 1px var(--nk-primary-color);
      background: #444;
      display: inline-block;
      text-align: center;
      color: #fff;
      width: 35px;
      height: 35px;
    }

    .no-style {
      margin: 5px;
      margin-left: 0;
      margin-right: 0;
      height: 10px;
      color: #fff;
      background: transparent;
      height: 35px;
      width: 35px;
      border: solid 1px transparent;
    }
  }

  &__title {
    font-size: 1.2em;
    font-weight: 800;
    margin-bottom: 0;
    margin-top: 0px;
    margin-right: 25px;
  }

  &__filter {
    border-bottom: solid 1px #f0eff4;
    margin-left: 50px;
  }

  &__headers {
    .sort {
      display: block;
      margin-left: 15px;

      &.fa-sort-up,
      &.fa-sort-down {
        color: var(--nk-primary-color);
      }
    }

    th {
      &:hover {
        cursor: pointer;
      }
    }
  }

  .search-bar {
    input {
      width: 100%;
      font-size: 1em;
      border-radius: 8px;
      border: none;

      &:focus {
        outline: none;
      }
    }
  }
}
</style>