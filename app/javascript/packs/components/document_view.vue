<template>
  <div>
    hey im a document

    <div v-if="document">
      <embed v-bind:src="document.pdf_url" width="800px" height="2100px" class="pdf" />
    </div>
  </div>
</template>

<script>
  export default {
    name: 'document-view',

    mounted() {
      let case_id = this.$route.params.case_id
      let notice_id = this.$route.params.notice_id
      let document_id = this.$route.params.id

      Noticekeeper.getDocument(case_id, notice_id, document_id).then((response) => {
        this.document = response
      })
    },

    data() {
      return {
        document: null
      }
    }
  }
</script>

<style lang="scss">
</style>
