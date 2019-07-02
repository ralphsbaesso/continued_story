import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './App.vue'
import router from './router'
import Turbolink from 'vue-turbolinks'
import store from './stores/store'

import './plugins/axios'

document.addEventListener('DOMContentLoaded', () => {

  if (!document.getElementById('app'))
    return;

  new Vue({
    store,
    router,
    mixin: [Turbolink],
    render: h => h(App)
  }).$mount('#app')
});

Vue.use(BootstrapVue);