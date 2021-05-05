<template>
<div class="container">
    <div class="loadingio-spinner-spin-73ue9c5at0j" v-if="carga==0"><div class="ldio-yymc290haz">
    <div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div>
    </div></div>
    <div class="row" v-if="carga==1">
        <div class="col-sm-12">
            <div class="m-b-20 table-responsive">
                <div class="form-group container-titulo">
                    <h2>
                        <b>Roles</b>
                    </h2>
                </div>
                
                <!-- <p class="text-muted font-13 m-b-30">
                    The Buttons extension for DataTables provides a common set of options, API methods and
                    styling to display buttons on a page that will interact with a DataTable. The core
                    library provides the based framework upon which plug-ins can built.
                </p> -->
                <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                    <div class="dataTables_filter">
                        <label>
                            <font _mstmutation="1" _msthash="917306" _msttexthash="138502">Búsqueda:</font>
                            <input type="search" v-model="buscar" v-on:keypress="listarCategoria(1,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                            <button type="submit" @click="listarCategoria(1,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                        </label>
                    </div>
                    <div class="table-responsive">
                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                            </tr>
                            </thead>


                            <tbody>
                            <tr v-for="rol in arrayRoles" :key="rol.id">
                                <td v-text="rol.nombre_rol"></td>
                                <td >
                                    <div style='width:200px; overflow:hidden;' v-text="rol.descripcion"></div>
                                </td>
                                <td>
                                    <div v-if="rol.condicion">
                                        <span class="label label-success">Activo</span>
                                        
                                    </div>
                                    <div v-else>
                                        <span class="label label-danger">Desactivado</span>
                                        
                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_info" id="datatable_info" role="status" aria-live="polite" _msthash="255762" _msttexthash="657423" v-text="num_entradas"></div>
                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" >
                                <ul class="pagination">
                                    <li v-if="pagination.current_page >1">
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page-1,buscar)"><i class="fa fa-angle-left"></i></a>
                                    </li>
                                    <li :class="[page == isActived ? 'active' : '']" v-for="page in pagesNumber" :key="page">
                                        <a href="" @click.prevent="cambiarPagina(page,buscar)" v-text="page"></a>
                                    </li>
                                    <li v-if="pagination.current_page < pagination.last_page">
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page+1,buscar)"><i class="fa fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</div>  


</template>

<script>
    export default {
        data(){
          return{
            nombre:'',
            descripcion:'',
            arrayRoles:[],
            pagination:{
                'total':0 ,
                'current_page':0 ,
                'per_page':0,
                'last_page':0,
                'from' :0,
                'to':0 ,
            },
            offset:3,
            buscar : '',
            num_entradas:'',
            carga:0,
          }
        },
        computed:{
            isActived:function(){
                return this.pagination.current_page;
            },
            pagesNumber:function(){
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;

            }
        }
        ,
        mounted() {
            
            this.listarRol(1,this.buscar); 
            // let initScript = document.createElement('script');
            // initScript.setAttribute('src', 'assets/pages/jquery.datatables.init.js');
            // document.head.appendChild(initScript);

        },
        methods: {
            listarRol(page,buscar){
                let me=this;
                var url= this.$api+'roles?page=' + page + '&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayRoles = respuesta.roles.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                    me.carga=1;
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarRol(page,buscar);
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
<style>    
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        background-color: #000000c9 !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: #ff0000c4 !important;
        width: 100%;
    }
</style>

