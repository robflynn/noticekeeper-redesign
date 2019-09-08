<template>
  <div>
    <div class="flex row">
      <div style="margin: 25px; width: 100%;">
      <datatable
        ref="cases_data_table"
        uri="/api/cases"
        tmpThing="court_cases"
        :datasource="court_cases"
        :columns="court_cases_columns"
        :rowWasSelected="courtCaseSelected"
      />
      </div>
    </div>
  </div>
</template>

<style lang="scss">
  .flex {
    display: flex;

    &.row {
      flex-direction: row;
    }

    &.column {
      flex-direction: column;
    }

    &.grow {
      flex: 1;
    }
  }

  .flex-grow {
    flex: 1;
  }
</style>

<script>
  import { mapState } from 'vuex'
  import Mock from '../../mock'

  import Datatable from './datatable'

  const moment = require('moment');

  export default {
    components: {
      Datatable
    },
    props: {
      courtCaseClicked: {
        required: false,
        type: Function
      },
    },
    data: function() {
      return {
        court_cases_columns: [
          {
            name: "Case Name",
            field: "case_name",
            type: "string",
          },
          {
            name: "Case Number",
            field: "case_number",
            type: "string",
            subField: "case_state"
          },
          {
            name: "Last Activity",
            field: "updated_at",
            type: "datetime",
            filter: this._dateFilter
          }
        ]
      }
    },

    methods: {
      setCourtCases(court_cases) {
        this.court_cases = court_cases
      },

      courtCaseSelected(court_case) {
        this.$emit('didSelectCourtCase', court_case)

        if (this.courtCaseClicked) {
          this.courtCaseClicked(court_case)
        }
      },

      _dateFilter(value) {
        return moment(value).format("LLL")
      },
    },

    mounted() {
      Noticekeeper.getCourtCases()
                  .then((response) => {
                    let court_cases = response

                    this.$store.state.court_cases = court_cases
                  })
    },

    computed: {
      ...mapState([
        'court_cases'
      ]),
    },
  }
</script>