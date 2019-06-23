<template>
  <div id="app">
    <main class="tag">Conteúdo</main>
    <header class="tag">

      <header></header>
    </header>
    <footer class="tag">Rodapé</footer>
    <nav class="tag">Navegação</nav>

  </div>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.css'
  import 'bootstrap-vue/dist/bootstrap-vue.css'

  import Header from './components/Header'

  export default {
    components: { Header },
    data: function () {
      return {
        message: "Hello Vue!!!!!!!!!!!!!!"
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

  header {
    grid-area: grid-header;
  }

  nav {
    grid-area: grid-nav;
    background: #999999;
  }

  main {
    grid-area: grid-main;
    background: rgb(2,0,36);
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,108,121,0.9262079831932774) 22%, rgba(0,212,255,1) 100%);
  }

  footer {
    grid-area: grid-footer;
  }

  #app {
    display: grid;
    min-height: 100vh;
    grid-template-columns: 200px 1fr;
    grid-template-rows: 100px 1fr 100px;
    grid-template-areas:
            'grid-header grid-header'
            'grid-nav grid-main'
            'grid-nav grid-footer';
  }
</style>
