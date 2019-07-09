import Vue from 'vue'
import Router from 'vue-router'
import Menu from './components/Main'
import User from './components/User'
import Histories from './components/Histories'
import History from './components/histories/History'

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
        {
            path: '/histories',
            component: Histories
        },
        {
            path: '/histories/:id',
            component: History,
            props: true
        }
    ]
})