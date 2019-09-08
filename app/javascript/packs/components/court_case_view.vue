<template>
  <div>
    <section class="box">
      <h1>{{ court_case.case_number }} - {{ court_case.case_name }}</h1>

      <div>
        <table class="metadata">
          <tbody>
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
              <td>{{ court_case.case_state }}</td>
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
      <h1>Notices</h1>

      <div class="flex row">
        <datatable
          v-if="court_case.id"
          :uri="this.notices_url()"
          tmpThing="notices"
          :columns="notices_columns"
          :rowWasSelected="noticeClicked" />
      </div>
    </section>

  </div>
</template>

<style lang="scss">
  @import "../../stylesheets/global_workaround.scss";
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
            field: "updated_at"
          }
        ]
      }
    },

    methods: {
      notices_url() {
        if (this.court_case == undefined) {
          return ""
        }

      console.log(this.court_case)
        return `/api/cases/${this.court_case.id}/notices`
      },

      noticeClicked(notice) {
        this.$emit('didSelectNotice', notice)
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