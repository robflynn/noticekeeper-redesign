<template>
  <div>
    <section class="box">
      <h1>{{ court_case.case_number }} - {{ court_case.case_name }}</h1>

      <div>
        <MetadataTable>
          <template slot="metadata">
            <tr>
              <th scope="col">
                Case Number
              </th>
              <td>{{ court_case.case_number }}</td>
            </tr>
            <tr>
              <th scope="col">
                Case Name
              </th>
              <td>{{ court_case.case_name }}</td>
            </tr>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>{{ court_case.user_id }}</td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>{{ court_case.case_state }}</td>
            </tr>
            <tr>
              <th scope="col">
                Total Claim Amount
              </th>
              <td>{{ this.$currency.format(court_case.total_claims / 100, { locale: 'en-US' }) }}</td>
            </tr>
          </template>
        </MetadataTable>
      </div>
    </section>

    <datatable
      v-if="court_case.id"
      :uri="this.claims_url()"
      tmpThing="claims"
      title="Claims"
      :columns="claims_columns"
      :perPage=5
    />

    <datatable
      v-if="court_case.id"
      :uri="this.notices_url()"
      tmpThing="notices"
      title="Notices"
      :columns="notices_columns"
      :perPage=5
      :rowWasSelected="noticeClicked" />
  </div>
</template>

<style lang="scss">
  @import "../../stylesheets/theme.scss";
</style>

<script>
  import { mapState } from 'vuex'
  import Mock from '../../mock'

  let dummyCase = {
    case_number: "",
    case_name: "",
    case_state: "",
    total_clains: 0.00
  }

  export default {
    data: function() {
      return {
        court_case: dummyCase,

        notices: [],

        notices_columns: [
          {
            name: "Title",
            type: "string",
            field: "title"
          },
          {
            name: "Received",
            type: "datetime",
            field: "updated_at",
            width: "250px"
          }
        ],

        claims_columns: [
          {
            name: "Creditor",
            field: "creditor_id",
            filter: this._creditorFilter
          },
          {
            name: "Amount",
            type: "currency",
            field: "amount",
            width: "120px"
          },
          {
            name: "Received",
            field: "created_at",
            type: "datetime",
            width: "250px",
          }
        ]
      }
    },

    methods: {
      notices_url() {
        if (this.court_case == undefined) {
          return ""
        }

        return `/api/cases/${this.court_case.id}/notices`
      },

      claims_url() {
        if (this.court_case == undefined) {
          return ""
        }

        return `/api/cases/${this.court_case.id}/claims`
      },

      noticeClicked(notice) {
        this.$emit('didSelectNotice', notice)
      },

      _creditorFilter(row, column, value) {
        return row.creditor.name
      }
    },

    computed: {
    },

    mounted() {
      let case_id = this.$route.params.slug

      Noticekeeper.getCourtCase(case_id).then((response) => {
        this.court_case = response
      })

      // load the associated notices
      Noticekeeper.getCourtCaseNotices(case_id).then((response) => {
        this.notices = response
      })
    }
  }
</script>