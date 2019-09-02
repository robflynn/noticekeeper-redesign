<template>
  <div class="document-preview" @click="_documentPreviewClicked($event) ">
    <div class="flex col">
      <img style="width: 140px; height: 175px;" v-bind:src="document.thumbnail_url" />

      <button>Download</button>
    </div>
  </div>
</template>

<style lang="scss">
  .document-preview {
    background-color: var(--main-bg-color);
  }
</style>

<script>
export default {
  name: 'document-preview',
  props: {
    document: Object
  },
  methods: {
    _documentPreviewClicked(e) {
      console.log(this.document)
      if (this.documentPreviewSelected) {
        this.documentPreviewSelected(this.document)
      }
    }
  }

}
</script>