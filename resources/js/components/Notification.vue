<template>
    <li class="dropdown top-menu-item-xs">
        <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true" @click="notificacionLeida()">
            <i class="fas fa-bell"></i> <span class="label label-danger">{{ notifications.noleida }}</span>
        </a>
        <ul class="dropdown-menu p-0 dropdown-menu-lg">
            <!--<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>-->
            <li class="list-group notification-list scroll-noti" style="height: 267px;">
               <div class="slimscroll" style="height:auto">
                   <!-- list item-->
                   <div v-if="numNotifications">
                   		<transition-group name="list-complete" tag="p">
	                   		<div v-for="item in notifications.notificacion"  :key="item.id" class="list-complete-item">
	                   			 
		                   			<a href="javascript:void(0);" class="list-group-item list-complete-item">
					                    <div class="media">
					                         <div class="media-left p-r-10">

					                            <em v-if="item.data.datos.mensaje.msj=='Ingreso Registrado'" class="fa fa-store-alt bg-primary"></em>
					                            <em v-if="item.data.datos.mensaje.msj=='Venta Registrada'" class="fa fa-piggy-bank bg-success"></em>
					                            <em v-if="item.data.datos.mensaje.msj=='Nuevo Usuario Registrado'" class="fa fa-user-plus bg-primary"></em>
					                            <em v-if="item.data.datos.mensaje.tipo==2" class="fa fa-user-lock bg-primary"></em>
					                            <em v-if="item.data.datos.mensaje.tipo==3" class="fa fa-user-cog bg-primary"></em>
					                            <em v-if="item.data.datos.mensaje.tipo==4" class="fa fa-user-check bg-primary"></em>

					                         </div>
					                         <div class="media-body">
					                            <h5 class="media-heading">{{ item.data.datos.mensaje.msj }}</h5>
					                            <!-- <p class="m-0">
					                                <small>{{ item.data.datos.mensaje.creador }}</small>
					                            </p> -->
					                         </div>
					                    </div>
				                    </a>
				                
	                   		</div>
	                   	</transition-group>

	                   <!-- list item-->
	                   
					</div>
					<div v-else>
						<a href="javascript:void(0);" class="list-group-item">
	                      <div class="media">
	                         <div class="media-left p-r-10">
	                            <em class="fa fa-bell-slash bg-warning"></em>
	                         </div>
	                         <div class="media-body">
	                            <h5 class="media-heading">Sin Notificaciones</h5>
	                            
	                         </div>
	                      </div>
	                   </a>
					</div>
             
               </div>
            </li>
            <!--<li>-->
                <!--<a href="javascript:void(0);" class="list-group-item text-right">-->
                    <!--<small class="font-600">See all notifications</small>-->
                <!--</a>-->
            <!--</li>-->
        </ul>
    </li>	
</template>
<script>
	export default{
		props:['notifications'],
		data(){
			return {
				nuNotifications:[],
			}
		},
		computed:{
			numNotifications:function(){
				return this.notifications.notificacion.length;
			}
		},
		methods:{
			notificacionLeida(){
				let me=this;
				if (me.notifications.noleida>0) {
					var url= '/notification/leidas';
	                axios.post(url).then(function (response) {
	                    me.notifications.noleida=0;
	                    //cargamos los datos del chart
	                })
	                .catch(function (error) {
	                    console.log(error);
	                });
				}
                
			}
		}

		
	}
</script>

<style>
	.slimScrollDiv{
	  height: auto;
	}
	.slimscroll{
	  height: auto;
	}
	.scroll-noti{
		overflow:auto;
	}
	.scroll-noti::-webkit-scrollbar{
		display: none;
	}
	.list-complete-item {
	  transition: all .5s;
	}
	.list-complete-enter, .list-complete-leave-to
	/* .list-complete-leave-active below version 2.1.8 */ {
	  opacity: 0;
	  transform: translateX(30px);
	}
	.list-complete-leave-active {
	  position: absolute;
	}
</style>