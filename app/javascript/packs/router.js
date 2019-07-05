import Vue from 'vue'
import Router from 'vue-router'
import Main from './components/Main'
import User from './components/User'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            component: Main
        },
        {
            path: '/user',
            component: User
        },
    ]
})