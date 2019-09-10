<template>
  <th>
    <div class="flex row between"><div class="flex-grw">{{ column }}</div><div class="sort"><span class="fa fa-sort" /></div></div>
  </th>
</template>

<style scoped lang="scss">
  .sort {
    display: block;
    margin-left: 15px;
  }
</style>

<script>
export default {
  name: 'datatable-header-cell',
  props: {
    'column': String,
    required: true
  }
}
</script>