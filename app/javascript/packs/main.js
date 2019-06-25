import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './app.vue'
import router from './router'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    router,
    render: h => h(App)
  }).$mount('#app')
})

Vue.use(BootstrapVue)