import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './app.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    render: h => h(App)
  }).$mount('#app')
})

Vue.use(BootstrapVue)