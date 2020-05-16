<template>
    <div class="container">
      <div class="row">
            <div class="col-sm-12">
              <div class="card-box widget-inline">
                <div class="row">
                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="text-primary mdi mdi-access-point-network"></i> <b data-plugin="counterup">8954</b></h3>
                      <p class="text-muted">Lifetime total sales</p>
                    </div>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="text-custom mdi mdi-airplay"></i> <b data-plugin="counterup">7841</b></h3>
                      <p class="text-muted">Income amounts</p>
                    </div>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                    <div class="widget-inline-box text-center">
                      <h3 class="m-t-10"><i class="text-info mdi mdi-black-mesa"></i> <b data-plugin="counterup">6521</b></h3>
                      <p class="text-muted">Total users</p>
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
                  <h4 class="m-t-0">Total Revenue</h4>
                  <div class="text-center">
                      <ul class="list-inline chart-detail-list">
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-primary"></i>Series A</h5>
                          </li>
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-muted"></i>Series B</h5>
                          </li>
                      </ul>
                  </div>
                  <div id="dashboard-bar-stacked" style="height: 300px;"></div>
              </div>
          </div> <!-- end col -->

          <div class="col-lg-6">
              <div class="card-box">
                  <h4 class="m-t-0">Sales Analytics</h4>
                  <div class="text-center">
                      <ul class="list-inline chart-detail-list">
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-primary"></i>Mobiles</h5>
                          </li>
                          <li>
                              <h5 class="font-normal"><i class="fa fa-circle m-r-10 text-info"></i>Tablets</h5>
                          </li>
                      </ul>
                  </div>
                  <div id="dashboard-line-chart" style="height: 300px;"></div>
              </div>
          </div> <!-- end col -->
      </div> <!-- end row -->


      <div class="row">
          <div class="col-sm-12">
              <div class="card-box">
                  <h4 class="m-t-0">Contacts</h4>
                  <div class="table-responsive">
                      <table class="table table-hover mails m-0 table table-actions-bar">
                          <thead>
                              <tr>
                                  <th style="min-width: 95px;">
                                      <div class="checkbox checkbox-primary checkbox-single m-r-15">
                                          <input id="action-checkbox" type="checkbox">
                                          <label for="action-checkbox"></label>
                                      </div>
                                      <!--<div class="btn-group dropdown">-->
                                          <!--<button type="button" class="btn btn-default btn-xs dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"><i class="caret"></i></button>-->
                                          <!--<ul class="dropdown-menu" role="menu">-->
                                              <!--<li><a href="#">Action</a></li>-->
                                              <!--<li><a href="#">Another action</a></li>-->
                                              <!--<li><a href="#">Something else here</a></li>-->
                                              <!--<li class="divider"></li>-->
                                              <!--<li><a href="#">Separated link</a></li>-->
                                          <!--</ul>-->
                                      <!--</div>-->
                                  </th>
                                  <th>Name</th>
                                  <th>Email</th>
                                  <th>Products</th>
                                  <th>Start Date</th>
                              </tr>
                          </thead>

                          <tbody>
                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox2" type="checkbox">
                                          <label for="checkbox2"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-2.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Tomaslau
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">tomaslau@dummy.com</a>
                                  </td>

                                  <td>
                                      <b><a href="" class="text-dark"><b>356</b></a> </b>
                                  </td>

                                  <td>
                                      01/11/2003
                                  </td>

                              </tr>

                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox1" type="checkbox">
                                          <label for="checkbox1"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-1.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Chadengle
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">chadengle@dummy.com</a>
                                  </td>

                                  <td>
                                      <b><a href="" class="text-dark"><b>568</b></a> </b>
                                  </td>

                                  <td>
                                      01/11/2003
                                  </td>

                              </tr>

                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox3" type="checkbox">
                                          <label for="checkbox3"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-3.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Stillnotdavid
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">stillnotdavid@dummy.com</a>
                                  </td>
                                  <td>
                                      <b><a href="" class="text-dark"><b>201</b></a> </b>
                                  </td>

                                  <td>
                                      12/11/2003
                                  </td>

                              </tr>

                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox4" type="checkbox">
                                          <label for="checkbox4"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-4.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Kurafire
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">kurafire@dummy.com</a>
                                  </td>

                                  <td>
                                      <b><a href="" class="text-dark"><b>56</b></a> </b>
                                  </td>

                                  <td>
                                      14/11/2003
                                  </td>

                              </tr>

                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox5" type="checkbox">
                                          <label for="checkbox5"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-5.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Shahedk
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">shahedk@dummy.com</a>
                                  </td>

                                  <td>
                                      <b><a href="" class="text-dark"><b>356</b></a> </b>
                                  </td>

                                  <td>
                                      20/11/2003
                                  </td>

                              </tr>

                              <tr>
                                  <td>
                                      <div class="checkbox checkbox-primary m-r-15">
                                          <input id="checkbox6" type="checkbox">
                                          <label for="checkbox6"></label>
                                      </div>

                                      <img src="assets/images/users/avatar-6.jpg" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                  </td>

                                  <td>
                                      Adhamdannaway
                                  </td>

                                  <td>
                                      <a href="#" class="text-muted">adhamdannaway@dummy.com</a>
                                  </td>

                                  <td>
                                      <b><a href="" class="text-dark"><b>956</b></a> </b>
                                  </td>

                                  <td>
                                      24/11/2003
                                  </td>

                              </tr>


                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>


  </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.');
            let initScript = document.createElement('script');
            initScript.setAttribute('src', 'assets/pages/jquery.dashboard.js');
            document.head.appendChild(initScript);
        }
    }
</script>
