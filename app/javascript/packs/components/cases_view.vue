<template>
  <div>
    <div class="flex row">
      <datatable 
        :datasource="court_cases" 
        :columns="court_cases_columns"        
        :rowWasSelected="rowWasSelected"
      />
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
        court_cases_columns: {
          'Name': 'case_name',
          'Case Number': 'case_number',
          'State': 'state',
          'Notices': 'notices',
          'Claims': 'total_claims',
          'Last Activity': 'last_activity'
        }
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

      rowWasSelected(row) {
        this.courtCaseSelected(row)
      }
    },
    mounted() {
      Noticekeeper.getCourtCases()
                  .then((response) => {
                    let court_cases = response.data
                    
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