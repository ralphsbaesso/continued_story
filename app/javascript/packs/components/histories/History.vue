<template>
  <main>

    <div class="history head">
      <input class="title" placeholder="Digite o título aqui" v-model="history.title" :readonly="!editable">
      <input class="description" placeholder="Digite a descrição aqui" v-model="history.description">
    </div>

    <div class="page">

      <div v-if="hasChapter" class="chapter">
        <input class="title head" placeholder="Digite o título aqui" v-model="firstChapter.title">
        <input class="description head" v-model="firstChapter.description" placeholder="Digite descrição aqui"/>
        <textarea class="content" v-model="firstChapter.content" placeholder="Digite o conteúdo aqui"></textarea>
      </div>
      <div v-else class="chapter">
        <div class="title">
          Nenhum captulo escrito
        </div>
      </div>

    </div>

    <div class="menu">
      <button @click="salve">Salvar</button>
      <button @click="addChapter">Novo Capítulo</button>
      <button>Outra coisa</button>
      <button>mais outra coisa</button>
    </div>

    <transition name="load">
      <Load :load="load" message="Aguarde carregar!!!"></Load>
    </transition>
  </main>
</template>

<script>
  import Load from '../../components/Load'
  export default {
    props: ['id'],
    components: { Load },
    data() {
      return {
        history: {
          id: null,
          chapters: []
        },
        edit: true,
        hasChapter: false,
        load: false
      }
    },
    mounted() {
      if (!this.$store.state.user || this.id === 'new')
        return

      this.load = true
      this.$http.get(`histories/${this.id}`)
        .then(resp => this.history = resp.data)
        .then(() => this.load = false)
        .catch(e => console.log(e))
    },
    watch: {
      history: {
        handler(newValue) {
          this.hasChapter = newValue.chapters.length > 0
        },
        deep: true
      }
    },
    computed: {
      firstChapter() {
        if(this.history.chapters && this.history.chapters.length > 0){
          console.log(this.history.chapters[0])
          return this.history.chapters[0]}
        else{
          console.log('nada')
          return null}
      }
    },
    methods: {
      editable() {
        return this.$store.state.user || !this.history.id
      },
      addChapter() {
        if(this.history.chapters)
          this.history.chapters.push({})
        else
          this.history.chapters = [{}]
      },
      salve(){
        this.$http.post('/histories', { history: this.history })
      }
    }
  }
</script>

<style scoped>

  main {
    height: 100vh;
  }
  main input, textarea {
    background-color: transparent;
    border: none;
    text-align: center;
    outline: none;
  }

  .menu {
    display: flex;
    background-color: whitesmoke;
    align-items: center;
    justify-content: space-between;
    box-shadow: 5px 5px #888888;
    position: fixed;
    bottom: 80px;
  }

  .menu button {
    background-color: #a0522d;
    padding: 5px;
    margin: 5px;
    color: white;
    font-weight: bold;
    text-align: center;
  }
  .history {

  }

  .page {
    color: #2f2f2f;
    background-color: #f9f7f1;
    margin: 40px 40px 40px 40px;
    padding: 20px 20px 20px 20px;
  }

  .history .description{
    text-transform: uppercase;
    font-size: 30px;
    color: whitesmoke;
    padding: 0 0 0 0;
  }

  .history .title {
    font-family: 'Playfair Display', serif;
    font-weight: 900;
    font-size: 50px;
    text-transform: uppercase;
    display: inline-block;
    line-height: 72px;
    color: whitesmoke;

  }

  .head{
    text-align: center;
    position: relative;
  }

  .chapter .title{
    font-weight: 400;
    font-style: italic;
    font-size: 40px;
    box-sizing: border-box;
    text-align: center;
  }

  .chapter .description{
    font-weight: 300;
    font-style: italic;
    font-size: 30px;
    text-transform: uppercase;
    padding: 12px 0 12px 0;
    margin-left: 20px;
    margin-right: 20px;
  }

  .chapter .content{
    display: inline-block;
    line-height: 20px;
    width: 100%;
    vertical-align: top;
    transition: all .7s;
    font-size: 20px;
    margin-top: 20px;
    margin-left: 20px;
    margin-right: 20px;
    text-align: justify;
  }


</style>
