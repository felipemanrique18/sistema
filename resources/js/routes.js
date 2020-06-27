import Vue from 'vue';
import Router from 'vue-router';
const dashboard = Vue.component('dashboard', require('./components/Dashboard.vue').default);
const categoria =Vue.component('categoria', require('./components/Categoria.vue').default);
const articulo =Vue.component('articulo', require('./components/Articulo.vue').default);
const cliente =Vue.component('cliente', require('./components/Cliente.vue').default);
const proveedor =Vue.component('proveedor', require('./components/Proveedor.vue').default);
const rol =Vue.component('rol', require('./components/Rol.vue').default);
const usuario =Vue.component('usuario', require('./components/Usuario.vue').default);
const ingreso =Vue.component('ingreso', require('./components/IngresoV2.vue').default);
const consultaingreso =Vue.component('consultaingreso', require('./components/ConsultaIngreso.vue').default);
const consultaventa =Vue.component('consultaventa', require('./components/ConsultaVenta.vue').default);
const venta =Vue.component('venta2', require('./components/VentaV2.vue').default);
const perfil =Vue.component('perfil', require('./components/Perfil.vue').default);

Vue.use(Router);

export default new Router({
	routes:[
		{
			path:'/inicio',
			name:'Dashboard',
			component: dashboard,
			// props: true
		},
		{
			path:'/articulo',
			name:'articulos',
			component:articulo
		},
		{
			path:'/categoria',
			name:'categorias',
			component:categoria
		},
		{
			path:'/cliente',
			name:'clientes',
			component:cliente
		},
		{
			path:'/proveedor',
			name:'proveedores',
			component:proveedor
		},
		{
			path:'/rol',
			name:'roles',
			component:rol
		},
		{
			path:'/usuario',
			name:'usuarios',
			component:usuario
		},
		{
			path:'/ingreso',
			name:'ingresos',
			component:ingreso
		},
		{
			path:'/venta',
			name:'ventas',
			component:venta
		},
		{
			path:'/consultaingreso',
			name:'consultaingresos',
			component:consultaingreso
		},
		{
			path:'/consultaventa',
			name:'consultaventas',
			component:consultaventa
		},
		{
			path:'/perfil',
			name:'perfil',
			component:perfil
		}

	],
	mode:'history' //evita que aparesca el #
})