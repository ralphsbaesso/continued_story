<template>
  <div id="app">
    <main class="tag">
      <router-view />
    </main>
    <header class="tag">
      <Header />
    </header>
    <footer class="tag">Rodapé</footer>
    <nav class="tag">
      <Menu />
    </nav>

  </div>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.css'
  import 'bootstrap-vue/dist/bootstrap-vue.css'
  import 'font-awesome/css/font-awesome.css'

  import Header from './components/Header'
  import Menu from './components/Menu'

  export default {
    components: { Header, Menu },
    data: function () {
      return {
        message: "Hello Vue!!!!!!!!!!!!!!",
      }
    },
    created() {
      this.$http.get('users/current').then(resp => {
        this.$store.state.user = resp.data
      })
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
    overflow-y: auto;
    padding: 0;
    height: calc(100vh - 112px);
    grid-area: grid-main;
    background: linear-gradient(to right, rgb(15, 32, 39), rgb(32, 58, 67), rgb(44, 83, 100));
    color: #FFF;
    position: relative;
  }

  footer {
    grid-area: grid-footer;
    background: #343a40;
  }

  #app {
    display: grid;
    grid-template-columns: 150px 1fr;
    grid-template-rows: 56px 1fr 56px;
    grid-template-areas:
            'grid-header grid-header'
            'grid-nav grid-main'
            'grid-nav grid-footer';
  }
</style>
