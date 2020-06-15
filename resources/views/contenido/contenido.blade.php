@extends('index')


@section('contenido')
	<template v-if="menu==0">
		<transition name="component-fade" mode="out-in">
		  <dashboard></dashboard>
		</transition>		
	</template>

	<template v-if="menu==1">
		<transition name="component-fade" mode="out-in">
		  <categoria></categoria>
		</transition>	
	</template>

	<template v-if="menu==2">
		<transition name="component-fade" mode="out-in">
		  <articulo></articulo>
		</transition>
		
	</template>

	<template v-if="menu==3">
		<transition name="component-fade" mode="out-in">
		  <ingreso></ingreso>
		</transition>
	</template>

	<template v-if="menu==4">
		<transition name="component-fade" mode="out-in">
		  <proveedor></proveedor>
		</transition>
	</template>

	<template v-if="menu==5">
		<transition name="component-fade" mode="out-in">
		  <venta2></venta2>
		</transition>
	</template>

	<template v-if="menu==6">
		<transition name="component-fade" mode="out-in">
		  <cliente></cliente>
		</transition>
		
	</template>

	<template v-if="menu==7">
		<transition name="component-fade" mode="out-in">
		  <usuario></usuario>
		</transition>
	</template>

	<template v-if="menu==8">
		<transition name="component-fade" mode="out-in">
		  <rol></rol>
		</transition>
	</template>

	<template v-if="menu==9">
		<transition name="component-fade" mode="out-in">
		  <consultaingreso></consultaingreso>
		</transition>
	</template>

	<template v-if="menu==10">
		<transition name="component-fade" mode="out-in">
		  <consultaventa></consultaventa>
		</transition>
	</template>

	<template v-if="menu==11">
		<h1>contenido menu 11</h1>
	</template>

	<template v-if="menu==12">
		<h1>contenido menu 12</h1>
	</template>

	<template v-if="menu==13">
		<transition name="component-fade" mode="out-in">
		  <perfil></perfil>
		</transition>
	</template>

  
@stop




