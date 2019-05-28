<template>
  <div>
    <section class="box">
      <h1>{{ court_case.case_number }} - {{ court_case.case_name }}</h1>

      <div>
        <table class="metadata">
          <tbody>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>{{ court_case.attorney }}</td>
            </tr>
            <tr>
              <th scope="col">
                Status
              </th>
              <td>{{ court_case.status }}</td>
            </tr>
            <tr>
              <th scope="col">
                Chapter
              </th>
              <td></td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>{{ court_case.state }}</td>
            </tr>
            <tr>
              <th scope="col">
                Total Claim Amount
              </th>
              <td>${{ court_case.total_claims }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section class="box padded">
      <h1>Proofs of Claim</h1>

      <div>
        <table class="table table--full">
          <thead>
            <tr>
              <th>Notice</th>
              <th>Creditor</th>
              <th>Amount</th>
              <th>Received</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="notice in court_case.notices" :key="notice.id">
              <td>{{ notice.title }}</td>
              <td>{{ notice.creditor }}</td>
              <td>{{ notice.claim_amount }}</td>
              <td>{{ notice.created_at }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </div>
</template>

<style lang="scss">
  $yellow: rgb(244, 247, 180);
  $darkBlue: rgb(42, 69, 112);

  // FIXME: Collapse these into a styles file. Currently duplicated in CasesView
  // Haven;t decided where I wanna store it just yet
 .table {
    $cellPadding: 0.5em;
    $yellow: rgb(244, 247, 180);
    $darkBlue: rgb(42, 69, 112);
    $rowBorder: solid 1px rgba(0, 0, 0, 0.1);

    &--full {
      width: 100%;
    }

    thead {
      tr {
        th, td {        
          background: $darkBlue;
          color: #eee;
          font-weight: bold;
          padding: $cellPadding;
          text-align: left;
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

    td {
      &:empty {
        background: red !important;
      }
    }  

  // TODO: Move me into a style!
  .box {
    display: block;
    margin: 10px;
    border: solid 1px rgba(0, 0, 0, 0.25);

    > div {
      padding: 10px;
    }

    h1 {
      display: block;
      background: $darkBlue;
      margin: 0;
      padding: 10px;
      color: #eee;
    }
  }

  .metadata {
    width: 100%;
    $rowBorder: solid 1px rgba(0, 0, 0, 0.1);


    th, td {
      padding: 10px;
      border: $rowBorder;      
    }

    th {
      text-align: left;
      font-weight: bold;
      width: 25%;
    }

    tr {
      &:nth-child(odd) {
        background-color: #eee;
      }
    }
  }
</style>

<script>
  import { mapState } from 'vuex'
  import Mock from '../../mock'

  let dummyCase = {
    case_number: "",
    case_name: "",
    case_state: "",
    total_clains: 0.00,
    notices: [],
  }

  export default {
    data: function() {
      return { 
        court_case: dummyCase,
      }
    },
    methods: {
    },
    computed: {
    },
    mounted() {
      let case_id = this.$route.params.slug

      Noticekeeper.getCourtCase(case_id)
                .then((response) => {
                  let court_case = response    
                  console.log("Loaded data for the following court case:")
                  console.log(court_case)

                  this.court_case = court_case
                })      
    }
  }
</script>