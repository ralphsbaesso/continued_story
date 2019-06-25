<template>
  <div id="app">
    <main class="tag">
      <router-view />
      Conteúdo
    </main>
    <header class="tag">
      <Header/>
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
    background: black;
  }

  main {
    grid-area: grid-main;
    background: linear-gradient(to right, rgb(15, 32, 39), rgb(32, 58, 67), rgb(44, 83, 100));
    color: #FFF;
  }

  footer {
    grid-area: grid-footer;
    background: #343a40;
  }

  #app {
    display: grid;
    min-height: 100vh;
    grid-template-columns: 150px 1fr;
    grid-template-rows: 56px 1fr 56px;
    grid-template-areas:
            'grid-nav grid-header'
            'grid-nav grid-main'
            'grid-nav grid-footer';
  }
</style>
