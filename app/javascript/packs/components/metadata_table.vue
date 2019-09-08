<template>
  <table class="metadata metadata--no-margin">
    <slot name="metadata" />
  </table>
</template>

<style lang="scss" scoped>
  .metadata {
    width: 100%;
    $rowBorder: solid 1px rgba(0, 0, 0, 0.1);
    margin: 10px;

    &--no-margin {
      margin: 0;

      tr {
        th:first-child,
        td:first-child {
          border-left: solid 1px transparent;
        }

        th:last-child,
        td:last-child {
          border-right: solid 1px transparent;
        }
      }

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