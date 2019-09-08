<template>
  <div class="document-preview">
    <div class="flex col">
      <img class="document-preview__thumbnail" v-bind:src="document.thumbnail_url" @click="_documentPreviewClicked($event)" />

      <button class="nk-button document-preview__download"><i class="fas fa-file-pdf"></i> Download</button>
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
  }
</style>

<script>
export default {
  name: 'document-preview',
  props: {
    document: Object,
    documentPreviewSelected: Function
  },
  methods: {
    _documentPreviewClicked(e) {
      if (this.documentPreviewSelected) {
        this.documentPreviewSelected(this.document)
      }
    }
  }

}
</script>