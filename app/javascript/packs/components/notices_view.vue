<template>
  <div>
    <!--
      <datatable
        ref="cases_data_table"
        uri="/api/cases"
        tmpThing="court_cases"
        :datasource="court_cases"
        :columns="court_cases_columns"
        :rowWasSelected="courtCaseSelected"
      />
    -->

    <datatable
      ref="notices_datatable"
      uri="/api/notices"
      tmpThing="notices"
      :columns="notices_columns"
    />
  </div>
</template>

<script>
export default {
  name: "NoticesView",

  data: function() {
    return {
      notices_columns: [
        {
          name: "Title",
          type: "string",
          field: "title"
        },
        {
          name: "Received",
          type: "datetime",
          field: "updated_at"
        }
      ]
    };
  }
};
</script>