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


/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('dashboard', require('./components/Dashboard.vue').default);
Vue.component('categoria', require('./components/Categoria.vue').default);
Vue.component('articulo', require('./components/Articulo.vue').default);
Vue.component('cliente', require('./components/Cliente.vue').default);
Vue.component('proveedor', require('./components/Proveedor.vue').default);
Vue.component('rol', require('./components/Rol.vue').default);
Vue.component('usuario', require('./components/Usuario.vue').default);
Vue.component('ingreso', require('./components/IngresoV2.vue').default);
Vue.component('venta', require('./components/Venta.vue').default);
Vue.component('consultaingreso', require('./components/ConsultaIngreso.vue').default);
Vue.component('consultaventa', require('./components/ConsultaVenta.vue').default);
Vue.component('notification', require('./components/Notification.vue').default);
Vue.component('venta2', require('./components/VentaV2.vue').default);
Vue.component('perfil', require('./components/Perfil.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */




 
const app = new Vue({
    el: '#app',
    data :{
    	menu:0,
    	notifications:[]
    },
    created(){
    	let me =this;
    	axios.post('notification/get').then(function(response){
    		me.notifications=response.data;

    	}).catch(function(error){
    		console.log(error);
    	});
        var userId=($('meta[name="userId"]').attr('content'));
        Echo.private('App.User.' + userId)
        .notification((notification) => {
            me.notifications.notificacion.unshift(notification);
            me.notifications.noleida=me.notifications.noleida+1;
        });
        
        
    }
});
