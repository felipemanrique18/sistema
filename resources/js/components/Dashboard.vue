<template>
    <div class="container">
      <div class="row">
            <div class="col-sm-12">
              <div class="card-box widget-inline">
                <div class="row">
                  <div class="col-lg-4 col-sm-4">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="fas fa-luggage-cart"></i> <b data-plugin="counterup">{{ formatNumber(total_ingresos) }}</b></h3>
                      <p class="text-muted">Total Ingreso {{ ultimo_mes }}</p>
                    </div>
                  </div>

                  <div class="col-lg-4 col-sm-4">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="fas fa-chart-line"></i> <b data-plugin="counterup">{{ formatNumber(total_ventas) }}</b></h3>
                      <p class="text-muted">Total Ventas {{ ultimo_mes }}</p>
                    </div>
                  </div>

                  <div class="col-lg-4 col-sm-4">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">{{ formatNumber(total_ventas_dia) }}</b></h3>
                      <p class="text-muted">Ventas Hoy</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      <!--end row -->
      <div class="row">
          <div class="col-lg-6">
              <div class="card-box">
                  <h4 class="m-t-0">Ingresos</h4>
                  <div class="text-center">
                      <!-- <ul class="list-inline chart-detail-list">
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-primary"></i>Series A</h5>
                          </li>
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-muted"></i>Series B</h5>
                          </li>
                      </ul> -->
                  </div>
                  <div id="dashboard-bar-stacked" style="height: 300px;">
                     <canvas id="ingresos">                                                
                      </canvas>
                  </div>
                  
              </div>
          </div> <!-- end col -->

          <div class="col-lg-6">
              <div class="card-box">
                  <h4 class="m-t-0">Ventas</h4>
                  <div class="text-center">
                      <!-- <ul class="list-inline chart-detail-list">
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-primary"></i>Mobiles</h5>
                          </li>
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-info"></i>Tablets</h5>
                          </li>
                      </ul> -->
                  </div>
                  <div id="dashboard-line-chart" style="height: 300px;">
                    <div class="ct-chart">
                      <canvas id="ventas">                                                
                      </canvas>
                    </div>
                  </div>
              </div>
          </div> <!-- end col -->
      </div> <!-- end row -->
  </div>
</template>

<script>
     export default {
        data (){
            return {
                varIngreso:null,
                charIngreso:null,
                ingresos:[],
                varTotalIngreso:[],
                varMesIngreso:[], 
                ventas_dia:[],
                total_ventas_dia:0,
                total_ingresos:0,
                total_ventas:0,
                varVenta:null,
                charVenta:null,
                ventas:[],
                varTotalVenta:[],
                varMesVenta:[],
                meses:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
                ultimo_mes:'',
            }
        },
        computed:{
          
        },

        methods : {
            getIngresos(){
                let me=this;
                var url= '/api/dashboard';
                let data = {
                'X-CSRF-TOKEN': window.$('meta[name="csrf-token"]').attr('content')
                }

                console.log(data);
                axios.get(url,data).then(function (response) {
                    var respuesta= response.data;
                    me.ingresos = respuesta.ingresos;
                    me.ventas = respuesta.ventas;
                    me.ventas_dia = respuesta.ventas_dia;
                    //cargamos los datos del chart
                    
                    me.loadIngresos();
                    me.loadVentas();
                    me.totales();
                })
                .catch(function (error) {
                    // me.mostrarerror(error);
                    console.log(error);
                });
            },
            // getVentas(){
            //     let me=this;
            //     var url= '/dashboard';
            //     axios.get(url).then(function (response) {
            //         var respuesta= response.data;
            //         me.ventas = respuesta.ventas;
            //         //cargamos los datos del chart
            //         me.loadVentas();
            //     })
            //     .catch(function (error) {
            //         console.log(error);
            //     });
            // },
            totales(){
              if (this.ventas_dia[0]) {
                this.total_ventas_dia=this.ventas_dia[0].total_dia;
              }
              // for (var i = 0; i < varTotalIngreso.length; i++) {
              //     this.total_ingresos=this.total_ingresos+varTotalIngreso[i];
              // }
              this.ultimo_mes=this.meses[this.ventas[this.ventas.length - 1].mes-1];
              this.total_ventas=this.ventas[this.ventas.length - 1].total;
              this.total_ingresos=this.ingresos[this.ingresos.length - 1].total;

            },
            loadIngresos(){
                let me=this;
                me.ingresos.map(function(x){
                    let mes,total;
                    mes=me.meses[x.mes-1];
                    total=x.total;
                    me.varMesIngreso.push(mes);
                    me.varTotalIngreso.push(total);
                    
                });
                me.varIngreso=document.getElementById('ingresos').getContext('2d');

                me.charIngreso = new Chart(me.varIngreso, {
                    type: 'bar',
                    data: {
                        labels: me.varMesIngreso,
                        datasets: [{
                            label: 'Ingresos',
                            data: me.varTotalIngreso,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 0.2)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
            },
            loadVentas(){
                let me=this;
                me.ventas.map(function(x){
                    let mes;
                    mes=me.meses[x.mes-1];
                    me.varMesVenta.push(mes);
                    me.varTotalVenta.push(x.total);
                });
                me.varVenta=document.getElementById('ventas').getContext('2d');

                me.charVenta = new Chart(me.varVenta, {
                    type: 'bar',
                    data: {
                        labels: me.varMesVenta,
                        datasets: [{
                            label: 'Ventas',
                            data: me.varTotalVenta,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 0.2)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
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
        },
        mounted() {
            this.getIngresos();
            // this.getVentas();
        }
    }
</script>
