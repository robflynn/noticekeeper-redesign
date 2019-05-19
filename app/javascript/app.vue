<template>
  <div class="noticekeeper">
    <cases-view />
  </div>
</template>

<script>
import CasesView from './packs/components/cases_view.vue'

import { mapGetters, mapMutations, mapState } from "vuex";

export default {
  components: {
    'cases-view': CasesView
  },

  computed: {},

  methods: {},

  mounted() {}
};
</script>