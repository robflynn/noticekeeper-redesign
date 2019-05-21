<template>
  <div>
    <section class="box">
      <h1>$CaseNumber$ - $CaseName$</h1>

      <div>
        <table class="metadata">
          <tbody>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>$Attorney$</td>
            </tr>
            <tr>
              <th scope="col">
                Status
              </th>
              <td>$Status$</td>
            </tr>
            <tr>
              <th scope="col">
                Chapter
              </th>
              <td>$Chapter$</td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>$State$</td>
            </tr>
            <tr>
              <th scope="col">
                Total Claim Amount
              </th>
              <td>$Total Claim Amount$</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section class="box padded">
      <h1>Proofs of Claim</h1>

      <div>
        <table class="table">
          <thead>
            <tr>
              <th></th>
              <th>Notice</th>
              <th>Creditor</th>
              <th>Amount</th>
              <th>Received</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td></td>
              <td>Proof of Claim</td>
              <td>Something Associates, LLC</td>
              <td>$1234.56</td>
              <td>March 22rd, 2293 at 19:55 PM</td>
            </tr>
            <tr>
              <td></td>
              <td>Proof of Claim</td>
              <td>Something Associates, LLC</td>
              <td>$1234.56</td>
              <td>March 22rd, 2293 at 19:55 PM</td>
            </tr>
            <tr>
              <td></td>
              <td>Proof of Claim</td>
              <td>Something Associates, LLC</td>
              <td>$1234.56</td>
              <td>March 22rd, 2293 at 19:55 PM</td>
            </tr>
            <tr>
              <td></td>
              <td>Proof of Claim</td>
              <td>Something Associates, LLC</td>
              <td>$1234.56</td>
              <td>March 22rd, 2293 at 19:55 PM</td>
            </tr>
            <tr>
              <td></td>
              <td>Proof of Claim</td>
              <td>Something Associates, LLC</td>
              <td>$1234.56</td>
              <td>March 22rd, 2293 at 19:55 PM</td>
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

  export default {
    props: {
    },
    methods: {
    },
    computed: {
    },
  }
</script>