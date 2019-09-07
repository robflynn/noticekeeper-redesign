<template>
  <div class="document-view">
    hey im a document

    <div v-if="document" class="document">
      <embed v-bind:src="document.pdf_url" class="pdf" width="100%" />
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

    updated() {
      let pdfs = document.querySelectorAll(".document .pdf")

      pdfs.forEach((pdf) => {
        let width = pdf.offsetWidth
        let height = width * 1.4375

        pdf.height = height
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
