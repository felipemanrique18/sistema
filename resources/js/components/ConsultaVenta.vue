<template>
<div class="container">
    <div class="loadingio-spinner-spin-73ue9c5at0j" v-if="carga==0"><div class="ldio-yymc290haz">
    <div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div>
    </div></div>
    <div class="row" v-if="carga==1">
        <div class="col-sm-12">
            <div class="m-b-20">
                <div class="form-group container-titulo">
                    <h2>
                        <b>Consulta Ventas</b>
                    </h2>
                </div>
                
                <!-- <p class="text-muted font-13 m-b-30">
                    The Buttons extension for DataTables provides a common set of options, API methods and
                    styling to display buttons on a page that will interact with a DataTable. The core
                    library provides the based framework upon which plug-ins can built.
                </p> -->
                <!-- listado ingresos -->
                <template v-if="listado==1">
                    
                    <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                        <div class="dataTables_filter">
                            <label>
                                <select v-model="tipo_busqueda" class="form-control input-sm">
                                    <option value="num_comprobante">Numero Comprobante</option>
                                    <option value="serie_comprobante">Serie Comprobante</option>
                                    <option value="fecha">fecha</option>
                                </Select>
                                <input type="search" v-model="buscar" @keyup="listarVenta(1,tipo_busqueda,buscar)" @keyup.delete="listarVenta(1,tipo_busqueda,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                                <button type="submit" @click="listarVenta(1,tipo_busqueda,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                            </label>
                        </div>
                        <div class="table-responsive">
                            
                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Cliente</th>
                                    <th>Usuario</th>
                                    <th>Tipo Comprobante</th>
                                    <th>Serie Comprobante</th>
                                    <th>Numero Comprobante</th>
                                    <th>Fecha Hora</th>
                                    <th>Impuesto</th>
                                    <th>Total</th>
                                    <th>Estado</th>
                                    <th>Accion</th>
                                    
                                </tr>
                                </thead>


                                <tbody>
                                <tr v-for="venta in arrayVenta" :key="venta.id">
                                    <td v-text="venta.cliente.nombre"></td>
                                    <td v-text="venta.usuario.persona.nombre"></td>
                                    <td v-text="venta.tipo_comprobante"></td>
                                    <td v-text="venta.serie_comprobante"></td>
                                    <td v-text="venta.num_comprobante"></td>
                                    <td v-text="venta.fecha_hora"></td>
                                    <td>{{ formatNumber(venta.impuesto) }}</td>
                                    <td>{{ formatNumber(venta.total) }}</td>
                                    <td v-text="venta.estado"></td>
                                    <td>       
                                        <button type="button" class="btn btn-sm btn-info" @click="verVenta(venta)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fas fa-eye"></i></button>
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
                                            <a href="" @click.prevent="cambiarPagina(pagination.current_page-1,buscar,tipo_busqueda)"><i class="fa fa-angle-left"></i></a>
                                        </li>
                                        <li :class="[page == isActived ? 'active' : '']" v-for="page in pagesNumber" :key="page">
                                            <a href="" @click.prevent="cambiarPagina(page,buscar,tipo_busqueda)" v-text="page"></a>
                                        </li>
                                        <li v-if="pagination.current_page < pagination.last_page">
                                            <a href="" @click.prevent="cambiarPagina(pagination.current_page+1,buscar,tipo_busqueda)"><i class="fa fa-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
                <!-- fin listado ingresos -->

                <!-- ver detalles -->
                <template v-else-if="listado==2">
                    <div>
                        <form action="#" method="POST" enctype="multipart/form-data" v-on:submit.prevent>
                            <div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="control-label">Cliente</label>
                                            <input type="text" class="form-control" readonly v-model="proveedor" ></input>
                                            
            

                                    </v-select>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Impuesto</label>
                                            <input type="text" class="form-control" readonly v-model="impuesto"></input>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tipo Comprobante (*)</label>
                                            <input type="text" class="form-control" readonly v-model="tipo_comprobante" ></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Serie</label>
                                            <input type="text" class="form-control" readonly v-model="serie_comprobante"></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Numero</label>
                                            <input type="text" class="form-control" readonly v-model="num_comprobante" ></input>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table  class="table table-striped table-bordered table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Articulo</th>
                                                    <th>Precio</th>
                                                    <th class="col-md-2">Cantidad</th>
                                                    <th >Descuento</th>
                                                    <th>Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody v-if="arrayDetalle.length">
                                                <tr v-for="(detalle) in arrayDetalle" :key="detalle.id">
                                                    <td v-text="detalle.articulo.nombre"></td>
                                                    <td>{{ formatNumber(detalle.precio) }}</td>
                                                    <td v-text="detalle.cantidad"></td>
                                                    <td>{{Math.trunc(detalle.descuento) }} %</td>
                                                    <td>
                                                        {{ formatNumber((detalle.precio*detalle.cantidad)-[(detalle.precio*detalle.cantidad)*(detalle.descuento/100)]) }}
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Parcial: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ formatNumber(totalparcial=(total-totalimpuesto)) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Impuesto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ totalimpuesto=((total*impuesto)/(1+impuesto)).toFixed(2) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Neto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ formatNumber(total=calculartotal) }}</td>
                                                </tr>
                                            </tbody>
                                            <tbody v-else>
                                                <tr>
                                                    <td colspan="5">
                                                        No hay articlos agregados
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        
                                    </div>
                    
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label"></label>
                                            <button class="btn btn-danger form-control" @click="ocultarDetalle()">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                        </form>
                    </div>
                </template>
                <!-- fin detalles -->
            </div>
        </div>
    </div>
    <!-- end row -->
</div>  


</template>

<script>
    
    import vSelect from 'vue-select';
    export default {
        data(){
          return{
            venta_id:0,
            idcliente:0,
            cliente:'',
            tipo_comprobante:0,
            num_comprobante:'',
            serie_comprobante:'',
            impuesto:0,
            total:'',
            totalimpuesto:0,
            totalparcial:0,
            cantidad:1,
            precio:0,
            arrayVenta:[],
            arrayCliente: [],
            arrayDetalle : [],
            arrayArticulo:[],
            arrayArticulos:[],
            arrayDetalleVenta:[],
            listado:1,
            tipoAccion:0,
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
            tipo_busqueda:'num_comprobante',
            num_entradas:'',
            idarticulo:0,
            codigo:'',
            articulo:'',
            carga:0
          }
        },
        components: {
            vSelect
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

            },
            calculartotal:function(){
                var resultado=0;
                var precio=0;
                var descuento=0;
                for (var i = 0; i < this.arrayDetalle.length; i++) {
                    precio=this.arrayDetalle[i].precio*this.arrayDetalle[i].cantidad;
                    descuento=precio*((this.arrayDetalle[i].descuento)/100);
                    resultado=resultado+precio-descuento;
                }
                return resultado;
            }
        }
        ,
        mounted() {
            this.listarVenta(1,this.tipo_busqueda,this.buscar); 

        },
        methods: {
            listarVenta(page,tipo_busqueda,buscar){
                let me=this;
                var url= this.$api+'venta?page=' + page + '&tipo_busqueda='+tipo_busqueda +'&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayVenta = respuesta.ventas.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                    me.carga=1;
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar,tipo_busqueda){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarVenta(page,tipo_busqueda,buscar);
            },
            mostrarDetalle(){
                this.listado=0;
            },
            ocultarDetalle(){
                this.listado=1;
                this.idcliente=0;
                this.idproveedor=[];
                this.arrayDetalle=[];
                this.arrayDetalleIngreso=[]; 
                this.tipo_comprobante=0;
                this.num_comprobante='';
                this.serie_comprobante='';
                this.impuesto=0;
                this.total='';
                this.proveedor='';
                this.codigo='';
                this.articulo=0;
                this.cantidad=1;
                this.precio=0;
                this.errorIngreso=0;
                this.errorMostrarMsjCliente = [{proveedor:'',impuesto:'',comprobante:'',num_comprobante:'',articulo:''}];
            },
            verVenta(venta=[]){
                this.listado=2;
                let me=this;
                me.arrayDetalle = venta;
                me.proveedor = me.arrayDetalle.cliente.nombre;
                me.impuesto=me.arrayDetalle.impuesto;
                me.tipo_comprobante=me.arrayDetalle.tipo_comprobante;
                me.serie_comprobante=me.arrayDetalle.serie_comprobante;
                me.num_comprobante=me.arrayDetalle.num_comprobante;
                me.arrayDetalle=me.arrayDetalle.detalle_venta;
            },
            formatNumber(n){
               let formatoNumero = new Intl.NumberFormat('es-CO', {
                    style: 'currency',
                    currency: 'COP',
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 2
                }).format(n);

                // Eliminar los decimales si son 00
                formatoNumero = formatoNumero.replace(/\.00$/, '');

                // Retornar el número formateado
                return formatoNumero;
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
        color: #d57171!important;
        width: 100%;
    }
</style>

