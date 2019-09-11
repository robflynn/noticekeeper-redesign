<template>
  <div>

    <div v-if="notice.amended" class="alert alert--note">
      NOTE: This notice has been superceded by an

      <a :href="amended_notice_url()" @click.prevent="_amendmentClicked">amendment</a>.
    </div>

    <section class="box box--no-pad">
      <h1>{{ notice.title }}</h1>

      <div>
        <MetadataTable>
          <template slot="metadata">
            <tr>
              <th scope="col">
                Case Name
              </th>
              <td>{{ courtCase.case_name }}</td>
            </tr>
            <tr>
              <th scope="col">
                Case Number
              </th>
              <td>{{ courtCase.case_number }}</td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>{{ courtCase.case_state }}</td>
            </tr>
            <tr>
              <th scope="col">
                Document Number
              </th>
              <td>
                <a v-bind:href="notice.document_url" target="_blank">{{ notice.document_number }}</a>
              </td>
            </tr>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>$$attorney$$</td>
            </tr>
            <tr class="full">
              <td colspan="2">
                {{ notice.body }}
              </td>
            </tr>
          </template>
        </MetadataTable>
      </div>
    </section>

    <section class="box">
      <h1>Documents | Upload</h1>
      <div>
        <div class="document-list">
          <DocumentPreview v-for="document in documents" :key="document.id" :document="document" :documentPreviewSelected="_documentClicked" />
        </div>
      </div>
    </section>

    <datatable
      tmpThing="events"
      :columns="events_columns"
      :uri="notice.associated.events"
      title="Events"
    />
  </div>
</template>

<script>
  import DocumentPreview from './document_preview'

  let dummyNotice = {
    title: ""
  }

  let dummyCase = {
    case_number: "",
    case_name: "",
    case_state: "",
    total_clains: 0.00
  }

  export default {
    components: {
      DocumentPreview
    },

    data: function() {
      return {
        notice: dummyNotice,
        courtCase: dummyCase,
        documents: [],

        events_columns: [
          {
            field: "date",
            name: "Date",
            width: "125px"
          },
          {
            field: "time",
            name: "Time",
            width: "125px"
          },
          {
            field: "court_case",
            name: "Case",
            filter: this._caseFilter,
            width: "150px"
          },
          {
            field: "description",
            name: "Description"
          }
        ]
      }
    },

    methods: {
      amended_notice_url() {
        return `/cases/${this.courtCase.id}/notices/${this.notice.amended.notice_id}`
      },

      _documentClicked(document) {
        //court_case_notice_document_show
        console.log(document)

        this.$emit('didSelectDocument', document)
      },

      _amendmentClicked() {
        let url = this.amended_notice_url()

        this.$router.push({ name: 'court_case_notice_show', params: { case_id: this.courtCase.id, id: this.notice.amended.notice_id } })
      },

      _caseFilter(row, column, value) {
        return value.case_number
      },

      init(case_id, notice_id) {
        Noticekeeper.getNotice(case_id, notice_id).then((response) => {
          this.notice = response
        })

        Noticekeeper.getCourtCase(case_id).then((response) => {
          this.courtCase = response
        })

        Noticekeeper.getDocuments(case_id, notice_id).then((response) => {
          this.documents = response
        })
      },

    },

    beforeRouteUpdate(to, from, next) {
      this.init(to.params.case_id, to.params.id)

      next()
    },

    mounted() {
      let case_id = this.$route.params.case_id
      let notice_id = this.$route.params.id

      this.init(case_id, notice_id)
    }
  }
</script>

<style lang="scss">
  @import "../../stylesheets/theme.scss";

  .alert {
    background: #ccc;
    border: #888;
    padding: 10px;
    border: solid 2px rgba(0, 0, 0, 0.1);
    margin: 10px;

    &--note {
      background: #ffffcc;
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
