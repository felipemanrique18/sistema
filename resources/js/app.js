/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
window.axios = require('axios');
window.Vue = require('vue');
// window.Pusher=require('pusher-js');

import swal from 'sweetalert';
import Vue from 'vue';
import 'vue-select/dist/vue-select.css';
import router from './routes.js';


/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))
Vue.component('notification', require('./components/Notification.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */




Vue.prototype.$api = '/api/';
Vue.prototype.$token = {
    'X-CSRF-TOKEN': window.$('meta[name="csrf-token"]').attr('content')
};

const app = new Vue({
    el: '#app',
    router,
    data: {
        menu: 0,
        notifications: []
    },
    created() {
        let me = this;
        let data = {
            'X-CSRF-TOKEN': window.$('meta[name="csrf-token"]').attr('content')
        }
        axios.post('/api/notification/get', data).then(function(response) {
            me.notifications = response.data;

        }).catch(function(error) {
            console.log(error);
        });
        var userId = ($('meta[name="userId"]').attr('content'));
        Echo.private('App.User.' + userId)
            .notification((notification) => {
                me.notifications.notificacion.unshift(notification);
                me.notifications.noleida = me.notifications.noleida + 1;
            });


    }
});