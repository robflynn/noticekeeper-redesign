<template>
  <th>
    {{ column }}
  </th>
</template>

<script>
export default {
  name: 'datatable-header-cell',
  props: {
    'column': String,
    required: true
  }
}
</script>