@extends('index')


@section('contenido')
	<template v-if="menu==0">
		<example-component></example-component>		
	</template>

	<template v-if="menu==1">
		<categoria></categoria>
		

	</template>

	<template v-if="menu==2">
		<articulo></articulo>
	</template>

	<template v-if="menu==3">
		<h1>contenido menu 3</h1>
	</template>

	<template v-if="menu==4">
		<h1>contenido menu 4</h1>
	</template>

	<template v-if="menu==5">
		<h1>contenido menu 5</h1>
	</template>

	<template v-if="menu==6">
		<h1>contenido menu 6</h1>
	</template>

	<template v-if="menu==7">
		<h1>contenido menu 7</h1>
	</template>

	<template v-if="menu==8">
		<h1>contenido menu 8</h1>
	</template>

	<template v-if="menu==9">
		<h1>contenido menu 9</h1>
	</template>

	<template v-if="menu==10">
		<h1>contenido menu 10</h1>
	</template>

	<template v-if="menu==11">
		<h1>contenido menu 11</h1>
	</template>

	<template v-if="menu==12">
		<h1>contenido menu 12</h1>
	</template>

  
@stop




