import Vue from 'vue'
import axios from 'axios'

// This code will setup headers of X-CSRF-Token that it grabs from rails generated token in meta tag.
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
axios.defaults.baseURL = '/';

Vue.use({
  install(Vue) {
    Vue.prototype.$http = axios;
  }
});