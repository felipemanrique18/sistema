<aside class="sidebar-navigation contenct">
    <div class="scrollbar-wrapper">
        <div>
            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                <i class="fas fa-times boton-cerrar-menu"></i>
            </button>
            <!-- User Detail box -->
            <div class="user-details">
                <div class="pull-left">
                    <img src="/assets/images/users/user.png" alt="" class="thumb-md img-circle">

                </div>
                <div class="user-info">
                    <a href="javascript:void(0)">{{ $user->persona['nombre'] }}</a>
                    <p class="text-muted m-0">{{$user->rol['nombre_rol'] }}</p>
                </div>
            </div>
            <!--- End User Detail box -->

            <!-- Left Menu Start -->
            <ul class="metisMenu nav" id="side-menu">
                <li><router-link to="/dashboard" class="seleccion"><i class="fa fa-home"></i> Dashboard</router-link></li>
                
                {{-- <li @click="menu=0" class="seleccion"><a href="javascript:void(0)"><i class="fa fa-home"></i> Dashboard </a></li> --}}
                
                @if (auth()->check() && auth()->user()->hasRoles(['1','3']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"  class="prueba" id="prueba"><i class="fas fa-store"></i> Almacen <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/dashboard/categoria" class="boton-navegacion seleccion">Categoria</router-link>
                            {{-- <li @click="menu=1"><a class="seleccion" href="javascript:void(0)">Categoria</a></li> --}}
                            <router-link to="/dashboard/articulo" class="boton-navegacion seleccion">Articulos</router-link>
                            {{-- <li @click="menu=2"><a class="seleccion" href="javascript:void(0)">Articulos</a></li> --}}
                        </ul>
                    </li>
                @endif

                @if (auth()->check() && auth()->user()->hasRoles(['1','3']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-store-alt"></i> Compras <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/dashboard/ingreso" class="boton-navegacion seleccion">Ingresos</router-link>
                            <router-link to="/dashboard/proveedor" class="boton-navegacion seleccion">Proveedores</router-link>
                            {{-- <li @click="menu=3"><a class="seleccion" href="javascript:void(0)">Ingresos</a></li>
                            <li @click="menu=4"><a class="seleccion" href="javascript:void(0)">Proveedores</a></li> --}}
                        </ul>
                    </li>
                @endif

                @if (auth()->check() && auth()->user()->hasRoles(['1','2']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-cart-arrow-down"></i> Venta <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/dashboard/venta" class="boton-navegacion seleccion">Ventas</router-link>
                            <router-link to="/dashboard/cliente" class="boton-navegacion seleccion">Clientes</router-link>
                            {{-- <li @click="menu=5"><a class="seleccion" href="javascript:void(0)">Ventas</a></li>
                            <li @click="menu=6"><a class="seleccion" href="javascript:void(0)">Clientes</a></li> --}}
                        </ul>
                    </li>
                @endif
                @if (auth()->check() && auth()->user()->hasRoles(['1']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-folder"></i> Acesso <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/dashboard/usuario" class="boton-navegacion seleccion">Usuarios</router-link>
                            <router-link to="/dashboard/rol" class="boton-navegacion seleccion">Roles</router-link>
                            {{-- <li @click="menu=7"><a class="seleccion" href="javascript:void(0)">Usuarios</a></li>
                            <li @click="menu=8"><a class="seleccion" href="javascript:void(0)">Roles</a></li> --}}
                        </ul>
                    </li>
                @endif
                @if (auth()->check() && auth()->user()->hasRoles(['1','2']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-file-invoice-dollar"></i> Reportes <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/dashboard/consultaingreso" class="boton-navegacion seleccion">Reporte Ingresos</router-link>
                            <router-link to="/dashboard/consultaventa" class="boton-navegacion seleccion">Reporte Ventas</router-link>
                            {{-- <li @click="menu=9"><a class="seleccion" href="javascript:void(0)">Reporte Ingresos</a></li>
                            <li @click="menu=10"><a class="seleccion" href="javascript:void(0)">Reporte Ventas</a></li> --}}
                        </ul>
                    </li>
                @endif
                <li @click="menu=11"><a class="seleccion" href="javascript:void(0)"><i class="fas fa-info-circle"></i>Ayuda </a></li>
                <li @click="menu=12"><a class="seleccion" href="javascript:void(0)"><i class="fas fa-question-circle"></i>Acerca de.... </a></li>

            </ul>
        </div>
    </div><!--Scrollbar wrapper-->
</aside>