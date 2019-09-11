<template>
  <div class="document-preview">
    <div class="flex col">
      <img class="document-preview__thumbnail" v-bind:src="document.thumbnail_url" @click="_documentPreviewClicked($event)" />

      <span class="document-preview__meta">{{ documentPageCountLabel }}</span>

      <button class="nk-button document-preview__download" @click.prevent="_downloadClicked">Download</button>
    </div>
  </div>
</template>

<style lang="scss">
  @import "../../stylesheets/theme.scss";

  .nk-button {
    background: #eee;
    border-radius: 5px;
    padding: 5px;
    border-color: #e5e5e5;
    font-size: 1.0em;
    cursor: pointer;

    &:hover {
      background: #ffe5e5;
    }
  }

  .document-preview {
    margin: 0.25em;

    &__download {
      box-shadow: 0px 0px 2.5px rgba(0, 0,0, 0.05)
    }

    &__thumbnail {
      cursor: pointer;
      border: solid 1px #ccc;
      margin-bottom: 10px;

      box-shadow: 0px 0px 2.5px rgba(0, 0,0, 0.05)
    }

    &__meta {
      color: #444;
      text-align: center;
      font-weight: bold;
      font-size: 0.8em;
      margin-bottom: 0.5em;
    }
  }
</style>

<script>
const pluralize = require('pluralize')

export default {
  name: 'document-preview',

  props: {
    document: {
      type: Object,
      required: true
    },

    documentPreviewSelected: Function
  },

  computed: {
    documentPageCountLabel() {
      return `${this.document.pages} ${pluralize('Page', this.document.pages)}`
    }
  },

  methods: {
    _documentPreviewClicked(e) {
      if (this.documentPreviewSelected) {
        this.documentPreviewSelected(this.document)
      }
    },

    _downloadClicked($e) {
      console.log(this.document.pdf_url)

      this.downloadPDF()
    },

    downloadPDF() {
      this.$http.get(this.document.pdf_url,
        { responseType: 'blob' }
      )
      .then(response => {
        this.downloadFile(response, this.document.filename)
      })
      .catch(error => {
        console.warn(error)
        console.log("download error")
      })
    },

    downloadFile(response, filename) {
      // It is necessary to create a new blob object with mime-type explicitly set
      // otherwise only Chrome works like it should
      var newBlob = new Blob([response.data], { type: 'application/pdf' })

      console.log(newBlob)

      // IE doesn't allow using a blob object directly as link href
      // instead it is necessary to use msSaveOrOpenBlob
      if (window.navigator && window.navigator.msSaveOrOpenBlob) {
        window.navigator.msSaveOrOpenBlob(newBlob)
        return
      }

      // For other browsers:
      // Create a link pointing to the ObjectURL containing the blob.
      const data = window.URL.createObjectURL(newBlob)
      var link = document.createElement('a')
      link.href = data
      link.download = filename + '.pdf'
      link.click()

      setTimeout(function () {
        // For Firefox it is necessary to delay revoking the ObjectURL
        window.URL.revokeObjectURL(data)
      }, 100)
    },
  }

}
</script>