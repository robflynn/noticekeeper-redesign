import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import Mock from '../mock'

Vue.use(Vuex)

export const store = new Vuex.Store({
  // initial state
  state: {
    court_cases: []
  },

  mutations: {
    setCourtCases(state, court_cases) {
      state.court_cases = court_cases
    }
  },

})
