import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import Mock from '../mock'

Vue.use(Vuex)

export const store = new Vuex.Store({
  // initial state
  state: {
    court_cases: Mock.all_cases
  },

  mutations: {
  },

})
