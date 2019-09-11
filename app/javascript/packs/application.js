/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import Noticekeeper from './noticekeeper'

const currencyFormatter = require('currency-formatter')

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import Router from 'vue-router'

import App from '../app.vue'

// import our state manager
import { store } from './store'

import routes from './routes'

import axios from 'axios'

Vue.prototype.$http = axios
Vue.prototype.$currency = currencyFormatter

Vue.use(Vuex)
Vue.use(Router)

import DataTable from './components/datatable'
import MetadataTable from './components/metadata_table'

Vue.component('datatable', DataTable)
Vue.component('MetadataTable', MetadataTable)

const router = new Router({ routes })

// Let's hack it for now
window.Noticekeeper = Noticekeeper

document.addEventListener("turbolinks:load", function() {
    var element = document.querySelector("#noticekeeper")

    if (element != undefined) {
        const app = new Vue({
            el: element,
            render: h => h(App),
            router,
            store
        })
    }
});