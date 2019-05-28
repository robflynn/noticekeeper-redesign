<template>
  <th>
    {{ column }}
  </th>
</template>

<script>
export default {
  name: 'datatable-header',
  props: {
    'column': String,
    required: true
  }
}
</script>