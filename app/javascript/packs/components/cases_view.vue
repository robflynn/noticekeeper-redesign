<template>
  <div class="cases-view">
    <div class="flex row">
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
</template>

<style lang="scss">
.cases-view {
  padding: 10px;
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
            name: "Case",
            field: "case_number",
            type: "string",
            subField: "case_state",
            width: "125px"
          },
          {
            name: "Last Activity",
            field: "updated_at",
            type: "datetime",
            width: "250px",
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