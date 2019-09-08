<template>
  <div>
    <section class="box">
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

  </div>
</template>

<script>
  import { mapState } from 'vuex'
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
        documents: []
      }
    },

    methods: {
      _documentClicked(document) {
        //court_case_notice_document_show
        console.log(document)

        this.$emit('didSelectDocument', document)
      }
    },

    mounted() {
      let case_id = this.$route.params.case_id
      let notice_id = this.$route.params.id

      Noticekeeper.getNotice(case_id, notice_id).then((response) => {
        this.notice = response
      })

      Noticekeeper.getCourtCase(case_id).then((response) => {
        this.courtCase = response
      })

      Noticekeeper.getDocuments(case_id, notice_id).then((response) => {
        this.documents = response
      })
    }
  }
</script>

<style lang="scss">
  @import "../../stylesheets/global_workaround.scss";

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
