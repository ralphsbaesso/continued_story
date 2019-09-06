<template>
  <div>
    <div class="ch-box">
      <router-link to="/">Início</router-link>
    </div>
    <div class="ch-box">
      <router-link to="/histories">Historias</router-link>
    </div>
    <AllowedFor>
      <div class="ch-box">
        <router-link to="/histories/new">Nova História</router-link>
      </div>
    </AllowedFor>
  </div>
</template>

<script>
  import Histories from './Histories'
  import AllowedFor from './AllowedFor'

  export default {
    name: 'Menu',
    components: { Histories, AllowedFor }
  }
</script>

<style scoped>

  .ch-box {
    margin: 5px 10px 5px 10px;
    border: 1px solid;
    padding: 10px;
    box-shadow: 3px 3px #888888;
    background-color: #f7eeee47;
    text-align: center;
    border-radius: 1px;
  }

</style>