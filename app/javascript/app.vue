<template>
  <div class="noticekeeper" data-theme="noticekeeper">
    <header>
      <NavBar />
    </header>
    <main role="main">

      <router-view
        @didSelectCourtCase="didSelectCourtCase"
        @didSelectNotice="didSelectNotice"
        @didSelectDocument="didSelectDocument"
      />

    </main>
  </div>
</template>

<style lang="scss">
  body {
    background: var(--nk-background-color);
  }
</style>

<script>
import CasesView from './packs/components/cases_view.vue'
import NavBar from './packs/components/navbar.vue'

import { mapGetters, mapMutations, mapState } from "vuex";

export default {
  components: {
    'cases-view': CasesView,
    'NavBar': NavBar,
  },

  computed: {},

  methods: {
    // Is this really how I want to do this? It feels super awkward now. I took a long break on
    // this redesign and my concept for the app has changed.
    didSelectCourtCase: function(court_case) {
      this.$router.push({ name: 'court_case_show', params: { slug: court_case.id }})
    },

    didSelectNotice(notice) {
      this.$router.push({ name: 'court_case_notice_show', params: { case_id: notice.case_id, id: notice.id } })
    },

    didSelectDocument(document) {
      this.$router.push({ path: document.self })
    },
  },

  mounted() {},
};
</script>