<template>
  <div class="noticekeeper">

    <nav>
      <ul>
        <li><router-link to='/'>Cases</router-link></li>
        <li>Events</li>
        <li>Account</li>
      </ul>
    </nav>

    <router-view />

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
    didSelectCourtCase: (court_case) => {
      console.log(court_case)
    }    
  },

  mounted() {},

};
</script>