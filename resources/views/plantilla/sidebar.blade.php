<aside class="sidebar-navigation contenct">
    <div class="scrollbar-wrapper">
        <div>
            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                <i class="fas fa-times boton-cerrar-menu"></i>
            </button>
            <!-- User Detail box -->
            <div class="user-details">
                <div class="pull-left">
                    <img src="assets/images/users/user.png" alt="" class="thumb-md img-circle">

                </div>
                <div class="user-info">
                    <a href="javascript:void(0)">{{ $user->persona['nombre'] }}</a>
                    <p class="text-muted m-0">{{$user->rol['nombre_rol'] }}</p>
                </div>
            </div>
            <!--- End User Detail box -->

            <!-- Left Menu Start -->
            <ul class="metisMenu nav" id="side-menu">
                <li><router-link to="/inicio"><i class="fa fa-home"></i> Dashboard</router-link></li>
                
                {{-- <li @click="menu=0" class="seleccion"><a href="javascript:void(0)"><i class="fa fa-home"></i> Dashboard </a></li> --}}
                
                @if (auth()->check() && auth()->user()->hasRoles(['1','3']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-store"></i> Almacen <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/categoria" class="boton-navegacion">Categoria</router-link>
                            {{-- <li @click="menu=1"><a class="seleccion" href="javascript:void(0)">Categoria</a></li> --}}
                            <router-link to="/articulo" class="boton-navegacion">Articulos</router-link>
                            {{-- <li @click="menu=2"><a class="seleccion" href="javascript:void(0)">Articulos</a></li> --}}
                        </ul>
                    </li>
                @endif

                @if (auth()->check() && auth()->user()->hasRoles(['1','3']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-store-alt"></i> Compras <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/ingreso" class="boton-navegacion">Ingresos</router-link>
                            <router-link to="/proveedor" class="boton-navegacion">Proveedores</router-link>
                            {{-- <li @click="menu=3"><a class="seleccion" href="javascript:void(0)">Ingresos</a></li>
                            <li @click="menu=4"><a class="seleccion" href="javascript:void(0)">Proveedores</a></li> --}}
                        </ul>
                    </li>
                @endif

                @if (auth()->check() && auth()->user()->hasRoles(['1','2']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-cart-arrow-down"></i> Venta <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/venta" class="boton-navegacion">Ventas</router-link>
                            <router-link to="/cliente" class="boton-navegacion">Clientes</router-link>
                            {{-- <li @click="menu=5"><a class="seleccion" href="javascript:void(0)">Ventas</a></li>
                            <li @click="menu=6"><a class="seleccion" href="javascript:void(0)">Clientes</a></li> --}}
                        </ul>
                    </li>
                @endif
                @if (auth()->check() && auth()->user()->hasRoles(['1']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-folder"></i> Acesso <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/usuario" class="boton-navegacion">Usuarios</router-link>
                            <router-link to="/rol" class="boton-navegacion">Roles</router-link>
                            {{-- <li @click="menu=7"><a class="seleccion" href="javascript:void(0)">Usuarios</a></li>
                            <li @click="menu=8"><a class="seleccion" href="javascript:void(0)">Roles</a></li> --}}
                        </ul>
                    </li>
                @endif
                @if (auth()->check() && auth()->user()->hasRoles(['1','2']))
                    <li>
                        <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-file-invoice-dollar"></i> Reportes <span class="fa arrow"></span></a>
                        <ul class="nav-second-level nav" aria-expanded="true">
                            <router-link to="/consultaingreso" class="boton-navegacion">Reporte Ingresos</router-link>
                            <router-link to="/consultaventa" class="boton-navegacion">Reporte Ventas</router-link>
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