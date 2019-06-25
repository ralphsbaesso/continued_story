import Vue from 'vue'
import Router from 'vue-router'
import Menu from './components/Main'
import User from './components/User'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            component: Menu
        },
        {
            path: '/user',
            component: User
        },
    ]
})