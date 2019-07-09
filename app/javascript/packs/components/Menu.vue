<template>
  <div>
    <h1>Meu menu</h1>
    <router-link to="/">Início</router-link>
    <router-link to="/histories">Historias</router-link>
  </div>
</template>

<script>
  import Histories from './Histories'

  export default {
    name: 'Menu',
    components: {
      Histories
    }

  }
</script>

<style>

</style>