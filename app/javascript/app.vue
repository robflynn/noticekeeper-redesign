<template>
  <div class="noticekeeper">

    <nav>
      <ul>
        <li><router-link to='/'>Cases</router-link></li>
        <li>Events</li>
        <li>Account</li>
      </ul>
    </nav>

    <router-view @didSelectCourtCase="didSelectCourtCase" @didSelectNotice="didSelectNotice"/>

  </div>
</template>

<style lang="scss">
  nav {
    ul {
      li {
        display: inline-block;
        padding: 0.5em;
      }
    }
  }

  .flex {
    display: flex;

    &.row {
      flex-direction: row;
    }

    &.column {
      flex-direction: column;
    }

    &.grow {
      flex: 1;
    }
  }

  .flex-grow {
    flex: 1;
  }
</style>

<script>
import CasesView from './packs/components/cases_view.vue'

import { mapGetters, mapMutations, mapState } from "vuex";

export default {
  components: {
    'cases-view': CasesView
  },

  computed: {},

  methods: {
    didSelectCourtCase: function(court_case) {
      this.$router.push({ name: 'court_cases_show', params: { slug: court_case.id }})
    },

    didSelectNotice(notice) {
      this.$router.push({ name: 'court_case_notices_show', params: { case_id: 1, id: notice.id } })
    }
  },

  mounted() {},

};
</script>