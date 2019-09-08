<template>
  <table class="metadata">
    <slot name="metadata" />
  </table>
</template>

<style lang="scss" scoped>
  .metadata {
    width: 100%;
    $rowBorder: solid 1px rgba(0, 0, 0, 0.1);
    margin: 10px;

    &--no-margin {
      margin: 0px;
    }

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
</style>

<script>
export default {
  name: 'MetaDataTable'
}
</script>