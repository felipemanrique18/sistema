<aside class="sidebar-navigation contenct">
    <div class="scrollbar-wrapper">
        <div>
            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                <i class="fas fa-times"></i>
            </button>
            <!-- User Detail box -->
            <div class="user-details">
                <div class="pull-left">
                    <img src="assets/images/users/avatar-1.jpg" alt="" class="thumb-md img-circle">
                </div>
                <div class="user-info">
                    <a href="#">Stanley Jones</a>
                    <p class="text-muted m-0">Administrator</p>
                </div>
            </div>
            <!--- End User Detail box -->

            <!-- Left Menu Start -->
            <ul class="metisMenu nav" id="side-menu">
                <li @click="menu=0"><a href="#"><i class="fa fa-home"></i> Dashboard </a></li>

                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-store"></i> Almacen <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li @click="menu=1" ><a href="#">Categoria</a></li>
                        <li @click="menu=2"><a href="#">Articulos</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-store-alt"></i> Compras <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li @click="menu=3"><a href="#">Ingresos</a></li>
                        <li @click="menu=4"><a href="#">Proveedores</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-cart-arrow-down"></i> Venta <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li @click="menu=5"><a href="#">Ventas</a></li>
                        <li @click="menu=6"><a href="#">Clientes</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-folder"></i> Acesso <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li @click="menu=7"><a href="#">Usuarios</a></li>
                        <li @click="menu=8"><a href="#">Roles</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="fas fa-file-invoice-dollar"></i> Reportes <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li @click="menu=9"><a href="#">Reporte Ingresos</a></li>
                        <li @click="menu=10"><a href="#">Reporte Ventas</a></li>
                    </ul>
                </li>
                <li @click="menu=11"><a href="#"><i class="fas fa-info-circle"></i>Ayuda </a></li>
                <li @click="menu=12"><a href="#"><i class="fas fa-question-circle"></i>Acerca de.... </a></li>

            </ul>
        </div>
    </div><!--Scrollbar wrapper-->
</aside>