<template>
    <div class="container">
      <div class="row">
            <div class="col-sm-12">
              <div class="card-box widget-inline">
                <div class="row">
                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="fas fa-luggage-cart"></i> <b data-plugin="counterup">{{ formatNumber(varTotalIngreso[0]) }}</b></h3>
                      <p class="text-muted">Total Ingreso</p>
                    </div>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="fas fa-chart-line"></i> <b data-plugin="counterup">{{ formatNumber(varTotalVenta[0]) }}</b></h3>
                      <p class="text-muted">Total Ventas</p>
                    </div>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">6521</b></h3>
                      <p class="text-muted">Ventas Hoy</p>
                    </div>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center b-0">
                      <h3 class="m-t-10"><i class="text-danger mdi mdi-cellphone-link"></i> <b data-plugin="counterup">325</b></h3>
                      <p class="text-muted">Total visits</p>
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
                
                varVenta:null,
                charVenta:null,
                ventas:[],
                varTotalVenta:[],
                varMesVenta:[],
            }
        },
        methods : {
            getIngresos(){
                let me=this;
                var url= '/dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.ingresos = respuesta.ingresos;
                    //cargamos los datos del chart
                    me.loadIngresos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getVentas(){
                let me=this;
                var url= '/dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.ventas = respuesta.ventas;
                    //cargamos los datos del chart
                    me.loadVentas();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            loadIngresos(){
                let me=this;
                me.ingresos.map(function(x){
                    me.varMesIngreso.push(x.mes);
                    me.varTotalIngreso.push(x.total);
                    
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
                    me.varMesVenta.push(x.mes);
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
                n = Math.trunc(n);
                n = String(n).replace(/\D/g, "");
                return (n === '' ? n : Number(n).toLocaleString())
                // return n === '' ? n : Number(n).toLocaleString();
            }
        },
        mounted() {
            this.getIngresos();
            this.getVentas();
        }
    }
</script>
