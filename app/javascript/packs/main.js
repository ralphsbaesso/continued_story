import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './App.vue'
import router from './router'
import store from './stores/store'
import Turbolink from 'vue-turbolinks'

import './plugins/axios'

Vue.use(Turbolink)

document.addEventListener('DOMContentLoaded', () => {

  if (!document.getElementById('app'))
    return;

  Vue.prototype.$myFunction = function() { alert('ok') }

  new Vue({
    store,
    router,
    render: h => h(App)
  }).$mount('#app')
});

Vue.use(BootstrapVue);