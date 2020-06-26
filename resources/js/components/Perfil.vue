<template>
	<div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="p-0 text-center">
                    <div class="member-card">
                        <div class="thumb-xl member-thumb m-b-10 center-block">
                            <img src="assets/images/users/user.png" class="img-circle img-thumbnail" alt="profile-image">
                            <i class="fas fa-circle member-star text-success" title="verified user"></i>
                        </div>
                        <div class="">
                            <h4 class="m-b-5" v-text="nombre"></h4>
                            <p class="text-muted" v-text="rol"></p>
                        </div>

                    </div>

                </div> <!-- end card-box -->

            </div> <!-- end col -->
        </div> <!-- end row -->

        <div class="m-t-30">
            <ul class="nav nav-tabs tabs-bordered">
                <li class="active">
                    <a href="#home-b1" data-toggle="tab" aria-expanded="true">
                        Perfil
                    </a>
                </li>
                <li class="">
                    <a href="#profile-b1" data-toggle="tab" aria-expanded="false">
                        Configuracion
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="home-b1">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Personal-Information -->
                            <div class="panel panel-default panel-fill">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Informacion Personal</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="m-b-20">
                                        <strong><i class="fas fa-user"></i> Nombre</strong>
                                        <br>
                                        <p class="text-muted" v-text="nombre"></p>
                                    </div>
                                    <div class="m-b-20">
                                        <strong><i class="fas fa-id-card-alt"></i>
                                        Identificacion</strong>
                                        <br>
                                        <p class="text-muted" v-if="identificacion" v-text="identificacion"></p>
                                        <p class="text-muted" v-else>Sin documento</p>
                                    </div>
                                    <div class="m-b-20">
                                        <strong><i class="fas fa-phone-square-alt"></i> Telefono</strong>
                                        <br>
                                        <p class="text-muted" v-if="telefono" v-text="telefono"></p>
                                        <p class="text-muted" v-else>Sin telefono</p>
                                    </div>
                                    <div class="m-b-20">
                                        <strong><i class="fas fa-envelope"></i> Email</strong>
                                        <br>
                                        <p class="text-muted" v-if="email" v-text="email"></p>
                                        <p class="text-muted" v-else>Sin email</p>
                                    </div>
                                    <div class="about-info-p m-b-0">
                                        <strong><i class="fas fa-map-marked-alt"></i> Direccion</strong>
                                        <br>
                                        <p class="text-muted" v-if="direccion" v-text="direccion"></p>
                                        <p class="text-muted" v-else>Sin direccion</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Personal-Information -->
                        </div>


                        

                    </div>
                </div>
                <div class="tab-pane" id="profile-b1">
                    <!-- Personal-Information -->
                    <div class="panel panel-default panel-fill">
                        <div class="panel-heading">
                            <h3 class="panel-title">Edit Profile</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <div class="form-group">
                                    <label for="FullName">Full Name</label>
                                    <input type="text" value="John Doe" id="FullName" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="Email">Email</label>
                                    <input type="email" value="first.last@example.com" id="Email" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="Username">Username</label>
                                    <input type="text" value="john" id="Username" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <input type="password" placeholder="6 - 15 Characters" id="Password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="RePassword">Re-Password</label>
                                    <input type="password" placeholder="6 - 15 Characters" id="RePassword" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="AboutMe">About Me</label>
                                    <textarea style="height: 125px" id="AboutMe" class="form-control">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</textarea>
                                </div>
                                <button class="btn btn-primary waves-effect waves-light w-md" type="submit">Save</button>
                            </form>

                        </div>
                    </div>
                    <!-- Personal-Information -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data (){
            return {
                user:[],
                nombre:'',
                rol:'',
                identificacion:'',
                telefono:'',
                email:'',
                direccion:''
            }
        },
        mounted(){
            this.getUser();
        },
        methods:{
            getUser(){
                let me=this;
                var url= '/user/show';
                axios.get(url).then(function (response) {
                    var respuesta=response.data;
                    me.user = respuesta.user;
                    me.nombre=me.user.persona.nombre;
                    me.rol=me.user.rol.nombre_rol;
                    me.identificacion=me.user.persona.tipo_documento+" "+me.user.persona.num_documento;
                    me.telefono=me.user.persona.telefono;
                    me.email=me.user.persona.email;
                    me.direccion=me.user.persona.direccion;
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            mostrarerror(error){
                switch (error.response.status) {
                    case 500:
                        swal("Eroor!", {
                          icon: "error",
                          text: "Actualiza tu fecha!",
                          buttons: false,
                          timer: 3000,
                        });
                        break;
                    case 401:
                        swal("Eroor!", {
                          icon: "error",
                          text: "A caducado tu session!",
                          buttons: false,
                          timer: 3000,
                        });
                        window.location.reload(); 
                        break;
                    case 419:
                        swal("Eroor!", {
                          icon: "error",
                          text: "A caducado tu session!",
                          buttons: false,
                          timer: 3000,
                        });
                        window.location.reload(); 
                        break;
                    default:
                        // statements_def
                        break;
                }
            }
        }
    }
</script>