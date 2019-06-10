<template>
  <div>
    <section class="box">
      <h1>$$Notice Title$$ | Notification</h1>

      <div>

        <!-- metadata table -->
        <!-- TODO: Make me a component -->
        <table class="metadata">
          <tbody>
            <tr>
              <th scope="col">
                Case Name
              </th>
              <td>$$case_name$$</td>
            </tr>
            <tr>
              <th scope="col">
                Case Number
              </th>
              <td>$$case_number$$</td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>$$state$$</td>
            </tr>
            <tr>
              <th scope="col">
                Document Number
              </th>
              <td>$$document_number$$</td>
            </tr>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>$$attorney$$</td>
            </tr>
            <tr class="full">
              <td colspan="2">
                $$body$$
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section class="box">
      <h1>Documents | Upload</h1>

      <div>
        <div class="document-list">
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
  export default {}
</script>

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

  .document-list {
    display: flex;
    flex-direction: row;

    .document + .document {
      margin-left: 1em;
    }
  }

  .document {
    display: flex;
    flex-direction: column;

    button {
      margin-top: 1em;
    }

  }
</style>
