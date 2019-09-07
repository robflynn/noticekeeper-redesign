<template>
  <div class="noticekeeper">

    <nav>
      <ul>
        <li><router-link to='/'>Cases</router-link></li>
        <li>Events</li>
        <li>Account</li>
      </ul>
    </nav>

    <router-view
      @didSelectCourtCase="didSelectCourtCase"
      @didSelectNotice="didSelectNotice"
      @didSelectDocument="didSelectDocument"
    />

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
    }
  },

  mounted() {},
};
</script>