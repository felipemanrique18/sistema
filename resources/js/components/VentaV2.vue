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

                        <b>Ventas</b>
                        <template v-if="listado==1">
                            <button class="btn btn-success pull-right" type="button" @click="mostrarDetalle()">
                            <i class="fa fa-plus"></i> Nuevo
                            </button>
                        </template>
                        <template v-if="listado==0 || listado==2">
                            <button class="btn btn-default btn-icon pull-right" @click="ocultarDetalle()">
                                <i class="fas fa-times"></i>
                            </button>
                        </template>
                    </h2>
                </div>
                
                <!-- <p class="text-muted font-13 m-b-30">
                    The Buttons extension for DataTables provides a common set of options, API methods and
                    styling to display buttons on a page that will interact with a DataTable. The core
                    library provides the based framework upon which plug-ins can built.
                </p> -->
                <!-- listado ingresos -->
                <transition name="fade">
                    <template v-if="listado==1">
                        <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                            <div class="dataTables_filter">
                                <label>
                                    <select v-model="tipo_busqueda" class="form-control input-sm">
                                        <option value="num_comprobante">Numero Comprobante</option>
                                        <option value="serie_comprobante">Serie Comprobante</option>
                                        <option value="fecha_hora">fecha</option>
                                    </Select>
                                    <input type="search" v-model="buscar" @keyup="listarVenta(1,tipo_busqueda,buscar)" @keyup.delete="listarVenta(1,tipo_busqueda,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                                    <button type="submit" @click="listarVenta(1,tipo_busqueda,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                                </label>
                            </div>
                            <div class="table-responsive">
                                
                                <table id="datatable-buttons" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="padding-right:50px">Accion</th>
                                        <th style="padding-right:25px;padding-left: 25px;">Cliente</th>
                                        <th style="padding-right:25px;padding-left: 25px;">Usuario</th>
                                        <th>Tipo Comprobante</th>
                                        <th>Serie Comprobante</th>
                                        <th>Numero Comprobante</th>
                                        <th>Fecha Hora</th>
                                        <th>Impuesto</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <tr v-for="venta in arrayVenta" :key="venta.id">
                                        <td>       
                                            <button type="button" class="btn btn-sm btn-info" @click="verVenta(venta)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fas fa-eye"></i></button>
                                            <template v-if="venta.estado=='Registrado'">
                                                    <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Desactivar" @click="anularVenta(venta.id)" ><i class="fa fa-trash-alt"></i></button>
                                                </template>
                                        </td>
                                        <td v-text="venta.cliente.nombre"></td>
                                        <td v-text="venta.usuario.persona.nombre"></td>
                                        <td v-text="venta.tipo_comprobante"></td>
                                        <td v-text="venta.serie_comprobante"></td>
                                        <td v-text="venta.num_comprobante"></td>
                                        <td v-text="venta.fecha_hora"></td>
                                        <td>{{ formatNumber(venta.impuesto) }}</td>
                                        <td>{{ formatNumber(venta.total) }}</td>
                                        <td v-text="venta.estado"></td>
                                        
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
                    
                </transition>
                <!-- fin listado ingresos -->

                <!-- detalles -->
                <transition name="fade">
                    <template v-if="listado==0">
                        <div class="container-new-ingreso">
                            <form action="#" method="POST" enctype="multipart/form-data" v-on:submit.prevent>
                                <div>
                                    <div class="col-md-7 detalle-venta">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group " :class="[errorMostrarMsjCliente[0].cliente? 'has-error' : '']">
                                                    <label class="control-label">Cliente</label>
                                                    <v-select v-model="idcliente"
                                                        @search="selectCliente"
                                                        label="nombre"
                                                        :options="arrayCliente"
                                                        placeholder="Buscar Clientes..."                                    
                                                    >

                                                    </v-select>
                                                    <div v-show="errorMostrarMsjCliente[0].cliente" class="text-error">
                                                        {{ errorMostrarMsjCliente[0].cliente }}
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 col-lg-3">
                                                <div class="form-group "  :class="[errorMostrarMsjCliente[0].impuesto? 'has-error' : '']">
                                                    <label for="field-1" class="control-label">Impuesto</label>
                                                     <input type="number" v-model="impuesto" class="form-control" placeholder="Ingrese inpuesto " min="0" @blur="validarVenta('impuesto')">
                                                     <div v-show="errorMostrarMsjCliente[0].impuesto" class="text-error" >
                                                        {{ errorMostrarMsjCliente[0].impuesto }}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-9">
                                                <div class="form-group " :class="[errorMostrarMsjCliente[0].comprobante? 'has-error' : '']">
                                                    <label for="field-1" class="control-label">Tipo Comprobante (*)</label>
                                                    <select v-model="tipo_comprobante" class="form-control" @blur="validarVenta('comprobante')">
                                                        <option value="0" disabled>Seleccione...</option>
                                                        <option value="Boleta">Boleta</option>
                                                        <option value="Factura">Factura</option>
                                                        <option value="Ticket">Ticket</option>
                                                    </select>
                                                    <div v-show="errorMostrarMsjCliente[0].comprobante" class="text-error">
                                                        {{ errorMostrarMsjCliente[0].comprobante }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="field-1" class="control-label">Serie</label>
                                                     <input type="number" v-model="serie_comprobante" class="form-control" placeholder="000x" min="0">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group " :class="[errorMostrarMsjCliente[0].num_comprobante? 'has-error' : '']">
                                                    <label for="field-2" class="control-label">Numero (*)</label>
                                                    <input type="number" v-model="num_comprobante" class="form-control" placeholder="00xxx" min="0" @blur="validarVenta('num_comprobante')">
                                                    <div v-show="errorMostrarMsjCliente[0].num_comprobante" class="text-error">
                                                        {{ errorMostrarMsjCliente[0].num_comprobante }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div> -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-1" class="control-label">Articulo</label>
                                                    <div class="input-group">
                                                        <input type="text" v-model="codigo" @keyup="buscarArticulo()" @keyup.delete="buscarArticulo()" class="form-control" placeholder="Ingrese codigo de barras"></input>
                                                        <span class="input-group-btn">
                                                            <button class="btn" @click="abrirModal()"><i class="fa fa-search"></i></button>
                                                        </span>
                                                        
                                                    </div>
                                                    <input v-show="codigo" type="text" v-model="articulo" readonly class="form-control"></input>
                                                </div>
                                            </div>
                        
                                        </div>
                                        <div class="row" v-show="idarticulo!=0">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="field-2" class="totalcontrol-label">Cantidad</label>
                                                    <input type="number" value="0" v-model="cantidad" class="form-control" placeholder="Ingrese cantidad" min="1">
                                                </div>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="form-group">
                                                    <label for="field-2" class="totalcontrol-label"> </label>
                                                    <button class="btn btn-success form-control" @click="agregarDetalle()"><i class="fa fa-plus"></i> Agregar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- ventas agregadas -->
                                    <div class="col-md-5 container-ventas-agregadas">
                                        <div class="ventas-agregadas">
                                            
                                        
                                            <div class="form-group">
                                                <h3>
                                                    <b v-if="arrayDetalle.length">Productos Agregados</b>
                                                    <b v-else>No hay productos Agregados</b>
                                                </h3>
                                            </div>
                                            <div class="row" v-if="arrayDetalle.length">
                                                <div class="table-responsive form-group">
                                                    <table  class="table table-striped table-sm ventas">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>Articulo</th>
                                                                <th>Precio</th>
                                                                <th>Cantidad</th>
                                                                <th style="padding-right:25px;padding-left:25px ">Descuento</th>
                                                                <th style="padding-right:50px">Subtotal</th>
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <tr v-for="(detalle,index) in arrayDetalle" :key="detalle.id">
                                                                <td>
                                                                    <button class="btn btn-danger btn-sm" @click="eliminarDetalle(index),validarVenta('articulo')">
                                                                        <i class="fa fa-trash-alt"></i>
                                                                    </button>
                                                                </td>
                                                                <td v-text="detalle.articulo"></td>
                                                                <td>{{ formatNumber(detalle.precio) }}</td>
                                                                <td>
                                                                    <div class="" :class="[detalle.cantidad>detalle.stock? 'has-error' : '']">
                                                                        <span style="color:red" v-show="detalle.cantidad>detalle.stock">Articulos Insuficientes<br>
                                                                        Disponibles {{ detalle.stock }}
                                                                        </span>
                                                                        <input type="number" class="form-control" min="1" max="detalle.stock" v-model="detalle.cantidad" name="">
                                                                    </div>
                                                                </td>
                                                                
                                                                <td>
                                                                    <div class="input-group">
                                                                        <input type="number" class="form-control" min="0" max="100" v-model="detalle.descuento" name="">
                                                                        <span class="input-group-addon"><i class="fas fa-percentage"></i></span>
                                                                    </div>
                                                                    
                                                                </td>
                                                                <td>{{ formatNumber((detalle.precio*detalle.cantidad)-[(detalle.precio*detalle.cantidad)*(detalle.descuento/100)]) }}</td>
                                                            
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    
                                                </div>
                                                <div class="form-group" style="text-align: end">
                                                    <div class="form-group">
                                                        <strong>
                                                            Total Parcial: $ {{ formatNumber(totalparcial=(total-totalimpuesto)) }}
                                                        </strong>
                                                    </div>
                                                    <div class="form-group">
                                                        <strong>
                                                            Total Impuesto: $ {{ totalimpuesto=((total*impuesto)/(1+impuesto)).toFixed(2) }}
                                                        </strong>
                                                    </div>
                                                    <div class="form-group">
                                                        <strong>
                                                            Total: $ {{ formatNumber(total=calculartotal) }}
                                                        </strong>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="field-2" class="totalcontrol-label"></label>
                                                        <button class="btn btn-primary form-control" :disabled="estado_boton.guardar" @click="registrarVenta()">Registrar Compra</button>
                                                    </div>
                                                </div>
                                                 <!-- <div v-show="errorIngreso" class="div-error">
                                                    <div class="text-error">
                                                        <div v-for="error in errorMostrarMsjCliente" :key="error" v-text="error">

                                                        </div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- fin ventas agregadas -->
                                    
                                </div>
                            </form>
                        </div>
                    </template>
                    
                </transition>
                <!-- fin detalles -->
                <!-- ver detalles -->
                <template v-if="listado==2">
                    <div>
                        <div>
                            <div class="col-md-7 detalle-venta">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">Cliente</label>
                                            <input type="text" class="form-control" readonly v-model="proveedor" ></input>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Impuesto</label>
                                            <input type="text" class="form-control" readonly v-model="impuesto"></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tipo Comprobante (*)</label>
                                            <input type="text" class="form-control" readonly v-model="tipo_comprobante" ></input>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Serie</label>
                                            <input type="text" class="form-control" readonly v-model="serie_comprobante"></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Numero</label>
                                            <input type="text" class="form-control" readonly v-model="num_comprobante" ></input>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-md-5 container-ventas-agregadas">
                                <div class="ventas-agregadas">
                                    <div class="form-group">
                                        <h3>
                                            <b>Productos Comprados</b>
                                        </h3>
                                    </div>
                                    <div class="row" v-if="arrayDetalle.length">
                                        <div class="table-responsive form-group">
                                            <table  class="table table-striped table-sm ventas">
                                                <thead>
                                                    <tr>
                                                        <th>Articulo</th>
                                                        <th>Precio</th>
                                                        <th>Cantidad</th>
                                                        <th>Descuento</th>
                                                        <th>Subtotal</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(detalle) in arrayDetalle" :key="detalle.id">
                                                        <td v-text="detalle.articulo.nombre"></td>
                                                        <td>{{ formatNumber(detalle.precio) }}</td>
                                                        <td v-text="detalle.cantidad"></td>
                                                        <td>{{Math.trunc(detalle.descuento) }} %</td>
                                                        <td>
                                                            {{ formatNumber((detalle.precio*detalle.cantidad)-[(detalle.precio*detalle.cantidad)*(detalle.descuento/100)]) }}
                                                        </td>  
                                                    </tr>
                                                </tbody>
                                            </table>
                                            
                                        </div>
                                        <div class="form-group" style="text-align: end">
                                            <div class="form-group">
                                                <strong>
                                                    Total Parcial: $ {{ formatNumber(totalparcial=(total-totalimpuesto)) }}
                                                </strong>
                                            </div>
                                            <div class="form-group">
                                                <strong>
                                                    Total Impuesto: $ {{ totalimpuesto=((total*impuesto)/(1+impuesto)).toFixed(2) }}
                                                </strong>
                                            </div>
                                            <div class="form-group">
                                                <strong>
                                                    Total: $ {{ formatNumber(total=calculartotal) }}
                                                </strong>
                                            </div>
                                           <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-2" class="totalcontrol-label"></label>
                                                    <button class="btn btn-primary form-control" :disabled="estado_boton.guardar" @click="descargarFactura()">Descargar factura</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
                <!-- fin detalles -->
            </div>
        </div>
    </div>
    <!-- end row -->
    <div id="myModal" @blur="validarVenta('articulo')" class="modal fade in" :class="{'mostrar' : modal}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" @click="cerrarModal()" aria-hidden="true">×</button>
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                </div>
                <div class="modal-body">
                   <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                         <div class="dataTables_filter">
                            <label>
                                <input type="search" v-model="buscarA" v-on:keyup.enter="listarArticulo(buscarA)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                                <button type="submit" @click="listarArticulo(buscarA)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                            </label>
                         </div>
                           <div class="table-responsive">
                               <table id="datatable-buttons" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Nombre</th>
                                        <th>Categoría</th>
                                        <th>Precio Venta</th>
                                        <th>Stock</th>
                                        <th>Codigo</th>
                                        <th>Estado</th>
                                        
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <tr v-for="articulo in arrayArticulos" :key="articulo.id">
                                        <td>
                                            <button type="button" class="btn btn-sm btn-primary" @click="agregarDetalleModal(articulo)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-check"></i></button>
                                        </td>
                                        <td v-text="articulo.nombre"></td>
                                        <td >{{ articulo.categoria['nombre']}}</td>
                                        <td v-text="articulo.precio_venta"></td>
                                        <td v-text="articulo.stock"></td>
                                        <td v-text="articulo.codigo"></td>
                                        <td>
                                            <div v-if="articulo.condicion">
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
                    </div>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                </div>
            </div><!-- /.modal-dialog -->

        </div>
    </div>
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
            modal: 0,
            listado:1,
            tituloModal:'',
            tipoAccion:0,
            errorIngreso: 0,
            errorMostrarMsjCliente : [{cliente:'',impuesto:'',comprobante:'',num_comprobante:'',articulo:''}],
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
            tipo_busquedaA:'nombre',
            buscarA : '',
            num_entradas:'',
            idarticulo:0,
            codigo:'',
            articulo:'',
            ocultar_slider:1,
            estado_boton:{
                guardar:false,
                actualizar:false
            },
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
            this.selectCliente('');
        },
        methods: {
            listarVenta(page,tipo_busqueda,buscar){
                let me=this;
                var url= this.$api+'venta?page=' + page + '&tipo_busqueda='+tipo_busqueda +'&buscar=' + buscar;
                axios.get(url,this.$token).then(function (response) {
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
            listarArticulo(buscar){
                let me=this;
                var url= this.$api+'articulo/listarArticulo?buscar=' + buscar+'&tipo=venta';
                axios.get(url,this.$token).then(function (response) {
                    var respuesta= response.data;
                    me.arrayArticulos = respuesta.articulos.data;
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
            registrarVenta(){
                if (this.validarVenta('todos')){
                    return;
                }
                
                let me=this;
                me.estado_boton.guardar=true;
                axios.post(this.$api+'venta/registrar',{
                    'cliente_id':this.idcliente.id,
                    'tipo_comprobante':this.tipo_comprobante,
                    'num_comprobante':this.num_comprobante,
                    'serie_comprobante':this.serie_comprobante,
                    'impuesto':this.impuesto,
                    'total':this.total,
                    'data':this.arrayDetalle
                }).then(function (response){
                    me.ocultarDetalle();
                    me.listarVenta(1,'nombre','');
                    swal({
                      title: "Venta Registrada",
                      text: "Quieres descargar la factura de la venta?",
                      icon: "success",
                      buttons: ["cerrar","Descargar"],
                    })
                    .then((value) => {
                      if (value) {
                        window.open('/venta/pdf/'+response.data.id);
                      }
                    });
                }).catch(function(error){
                    me.mostrarerror(error);
                    console.log(error);
                })
            },
            anularVenta(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de desactivar este Usuario!",
                  icon: "warning",
                  buttons: ["Cancelar","Desactivar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put(this.$api+'venta/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarVenta(1,'','');
                        swal("Venta Anulada!", {
                          icon: "success",
                          buttons: false,
                          timer: 2000,
                        });
                    }).catch(function (error) {
                        me.mostrarerror(error);
                        console.log(error);
                    });
                    
                  }
                });
                
            },
            selectCliente(search,loading){
                let me=this;
                if(loading){
                    loading(true)
                }

                var url= this.$api+'cliente/selectCliente?filtro='+search.toLowerCase();
                axios.get(url,this.$token).then(function (response) {
                    let respuesta = response.data;
                    q: search
                    me.arrayCliente=respuesta.clientes;
                    if(loading){
                        loading(false)
                    }
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            buscarArticulo(){
                let me=this;
                var url= this.$api+'articulo/buscarArticulo?filtro='+me.codigo;
                axios.get(url,this.$token).then(function (response) {
                    let respuesta = response.data;

                    me.arrayArticulo=respuesta.articulos;

                    if (me.arrayArticulo.length>0) {
                        me.articulo=me.arrayArticulo[0]['nombre'];
                        me.idarticulo=me.arrayArticulo[0]['id'];
                        me.precio=me.arrayArticulo[0]['precio_venta'];
                    }else{
                        me.articulo='No existe articulo';
                        me.idarticulo=0;
                    }
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            validarVenta(tipo){
                this.errorIngreso=0;
                
                    switch (tipo) {
                        // case "cliente":
                        //     if (this.idcliente==0||!this.idcliente){
                        //         this.errorMostrarMsjCliente[0].cliente="Seleccione Cliente";
                        //     }else{
                        //         this.errorMostrarMsjCliente[0].cliente="";
                        //     }
                        //     break;
                        case "impuesto":
                           if (this.impuesto<0){
                                this.errorMostrarMsjCliente[0].impuesto="Seleccione Impuesto"
                            }else{
                                
                                this.errorMostrarMsjCliente[0].impuesto="";
                            }
                            break;
                        case "comprobante":
                            if (!this.tipo_comprobante){
                                this.errorMostrarMsjCliente[0].comprobante="Seleccione El tipo de comprobante"
                            }else{
                                
                                this.errorMostrarMsjCliente[0].comprobante="";
                            }

                            break;
                        // case "num_comprobante":
                        //     if (!this.num_comprobante){
                        //         this.errorMostrarMsjCliente[0].num_comprobante="Seleccione el numero de comprobante"
                        //     }else{
                                
                        //         this.errorMostrarMsjCliente[0].num_comprobante="";
                        //     }

                        //     break;
                        case "articulo":
                            if (this.arrayDetalle.length==0){
                                this.errorMostrarMsjCliente[0].articulo="Sin articulos"
                            }else{
                                
                                this.errorMostrarMsjCliente[0].articulo="";
                            }
                            break;
                        case "todos":
                            // if (this.idcliente==0||!this.idcliente){
                            //     this.errorMostrarMsjCliente[0].cliente="Seleccione Cliente"

                            // }else{

                            //     this.errorMostrarMsjCliente[0].cliente="";
                            // }

                            if (this.impuesto<0){
                                this.errorMostrarMsjCliente[0].impuesto="Seleccione Impuesto"
                            }else{
                                
                                this.errorMostrarMsjCliente[0].impuesto="";
                            }

                            if (!this.tipo_comprobante){
                                this.errorMostrarMsjCliente[0].comprobante="Seleccione El tipo de comprobante"
                            }else{
                                
                                this.errorMostrarMsjCliente[0].comprobante="";
                            }

                            // if (!this.num_comprobante){
                            //     this.errorMostrarMsjCliente[0].num_comprobante="Seleccione el numero de comprobante"
                            // }else{
                                
                            //     this.errorMostrarMsjCliente[0].num_comprobante="";
                            // }

                            if (this.arrayDetalle.length==0){
                                this.errorMostrarMsjCliente[0].articulo="Sin articulos"
                            }else{
                                this.errorMostrarMsjCliente[0].articulo=""
                                for (var i = 0; i < this.arrayDetalle.length; i++) {
                                    if (this.arrayDetalle[i].cantidad>this.arrayDetalle[i].stock) {
                                        this.errorMostrarMsjCliente[0].articulo="Verifique Bien los aritculos";
                                        break;
                                    }
                                }
                                
                            }
                            let error=0;
                            for (var i = 0; i < this.arrayDetalle.length; i++) {
                                if (this.arrayDetalle[i].cantidad<=0 || !this.arrayDetalle[i].cantidad || this.arrayDetalle[0].descuento<0) {
                                    error=1;
                                    break;
                                }
                            }
                            if (error==1) {
                                this.errorIngreso=1;
                                 swal("", {
                                    icon: "error",
                                    text: "La cantidad o el descuento de los productos es incorrecto!",
                                    buttons: false,
                                    timer: 3000,
                                });
                            }
                            break;
                    }

                if (this.errorMostrarMsjCliente[0].impuesto=="" && this.errorMostrarMsjCliente[0].comprobante=="" && this.errorMostrarMsjCliente[0].articulo=="" ){
                    if (this.error==0) {
                            this.errorIngreso = 1;   
                        }
                }else{
                    this.errorIngreso=1;
                }
                    
                return this.errorIngreso;
            },
            encuentra(id){
                var sw=0;
                for (var i =0;i< this.arrayDetalle.length ; i++) {
                    if (this.arrayDetalle[i].idarticulo==id) {
                        sw=true;
                    }
                }
                return sw;
            },
            agregarDetalle(){
                let me=this;
                if (me.idarticulo==0 || me.cantidad==0 || me.precio==0) {
                    
                }else{
                    if (me.encuentra(me.idarticulo)) {
                        swal("El Articulo Ya Esta Agregado!", {
                          type: 'error',
                          title:'Error',
                          icon: "error",
                        });
                    }else{
                        if (me.cantidad>me.stock) {
                            swal("No hay suficientes productos!", {
                              type: 'error',
                              title:'Error',
                              icon: "error",
                            });
                        }else{
                            me.arrayDetalle.push({
                                idarticulo:me.idarticulo,
                                articulo:me.articulo,
                                cantidad:me.cantidad,
                                precio:me.precio,
                                descuento:0,
                            });
                            me.idarticulo=0;
                            me.codigo='';
                            me.articulo=0;
                            me.cantidad=1;
                            me.precio=0;
                        }

                    }
                    
                }
                
            },
            agregarDetalleModal(data=[]){
                let me=this;
                if (me.encuentra(data['id'])) {
                        swal("El Articulo Ya Esta Agregado!", {
                          type: 'error',
                          title:'Error',
                          icon: "error",
                        });
                    }else{
                        me.arrayDetalle.push({
                            idarticulo:data['id'],
                            articulo:data['nombre'],
                            cantidad:1,
                            precio:data['precio_venta'],
                            descuento:0,
                            stock:data['stock']
                        });
                    }

            },
            eliminarDetalle(index){
                let me=this;
                me.arrayDetalle.splice(index,1);
            },
            mostrarDetalle(){
                this.listado=0;
                this.ocultar_slider=0;
                this.tipo_comprobante='Factura';
                this.estado_boton.guardar=false;
                this.estado_boton.actualizar=false;
                this.idarticulo = 0;
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
                me.venta_id=venta.id;
                me.proveedor = me.arrayDetalle.cliente.nombre;
                me.impuesto=me.arrayDetalle.impuesto;
                me.tipo_comprobante=me.arrayDetalle.tipo_comprobante;
                me.serie_comprobante=me.arrayDetalle.serie_comprobante;
                me.num_comprobante=me.arrayDetalle.num_comprobante;
                me.arrayDetalle=me.arrayDetalle.detalle_venta;
            },
            descargarFactura(){
                let me=this;
                // console.log(me.venta_id);
                window.open('/venta/pdf/'+me.venta_id);
            },
            cerrarModal(){
                $('#myModal').modal('hide');
                this.tituloModal='';
                this.buscarA='';
                this.validarVenta('articulo');
            },
            abrirModal(){
                $('#myModal').modal('show');
                this.listarArticulo('');
                this.tituloModal = 'Seleccione el articulo';
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

