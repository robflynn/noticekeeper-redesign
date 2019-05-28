<template>
  <div class="datatable">
    <table>
      <thead>        
        <tr>
          <datatable-header
            v-for="(column, i) in columns"
            :key="i"
            :column="i" />
        </tr>
      </thead>

      <tbody>
        <tr v-for="row in datasource" :key="row">
          <td v-for="column in columns" :key="column">
            Colly
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  export default {
    props: {
      /**
       * DataTable Data Source
       * @type {Array}
       */
      datasource: {
        type: Array,
        required: true
      },

      /**
       * Column header labels and value associations
       */
      columns: {
        type: Array,
        required: true
      }
    },
  }
</script>
