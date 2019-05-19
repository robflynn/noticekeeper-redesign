<template>
  <div>
    <div class="flex row">
      <table class="cases-list table datatable flex-grow table-header--left">
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th>Name</th>
            <th>Case Number</th>
            <th>State</th>
            <th>Notices</th>
            <th>Claims</th>
            <th>Last Activity</th>
          </tr>
        </thead>

        <tbody>
          <tr v-for="(court_case, index) in court_cases" :key="court_case.id" :data-case-id="court_case.id">
            <td></td>
            <td></td>
            <td>{{ court_case.name }}</td>
            <td>{{ court_case.case_number }}</td>
            <td>{{ court_case.state }}</td>
            <td>{{ court_case.notices }}</td>
            <td>${{ court_case.total_claims }}</td>
            <td>{{ court_case.last_activity }}</td>
          </tr>
        </tbody>

        <tfoot>
          <tr>
            <th colspan="8">Footer</th>
          </tr>
        </tfoot>
      </table>
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

<script>
  import { mapState } from 'vuex'
  import Mock from '../../mock'

  export default {
    props: {},
    methods: {},
    computed: {
      ...mapState([
        'court_cases'
      ])
    },
  }
</script>