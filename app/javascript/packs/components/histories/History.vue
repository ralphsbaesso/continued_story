<template>
  <main>

    <div @click="showEntity ? showEntity=false : showEntity=true">show</div>
    <div v-if="showEntity">
      <h1>id {{ history}}</h1>
      <h3>{{ $store.state.currentHistory }}</h3>
    </div>

    <b-modal ref="modal-register" title="Nova Historia" @hide="closeModal()">

      <b-form>
        <b-form-group label="Título" label-for="input-title">
          <b-form-input id="input-title" v-model="history.title"/>
        </b-form-group>

        <b-form-group label="Descrição" label-for="input-description">
          <b-form-input id="input-description" v-model="history.description"/>
        </b-form-group>

      </b-form>

      <div slot="modal-footer">
        <b-button v-if="!history.id" variant="outline-info" @click="closeModal()">Cancelar</b-button>
        <b-button variant="outline-success" @click="salve()">Salvar</b-button>
      </div>
    </b-modal>

    <div v-if="history.id" class="history head">
      <input class="title" placeholder="Digite o título aqui" v-model="history.title" :readonly="!editable">
      <input class="description" placeholder="Digite a descrição aqui" v-model="history.description">

      <div v-if="hasChapter">
        <div v-for="id in history.chapter_ids">
          <Chapter :id="id" :history_id="history.id"/>
        </div>
      </div>
      <div v-else>
        Nenhum Capítulo Escrito
      </div>
    </div>

    <div class="new-chapter">
      <h3 @click="addChapter">Novo Capítulo</h3>
    </div>


    <div class="menu">
      <div>
        <button @click="">Salvar</button>
        <button @click="addChapter">Novo Capítulo</button>
        <button v-if="history.id" @click="excluir(history.id)">Excluir</button>
        <button>mais outra coisa</button>
      </div>
    </div>

    <transition name="load">
      <Load :load="load" message="Aguarde carregar!!!"></Load>
    </transition>
  </main>
</template>

<script>
  import Load from '../../components/Load'
  import Chapter from './Chapter'

  export default {
    props: ['id'],
    components: { Load, Chapter },
    data() {
      return {
        history: {
          chapter_ids: []
        },
        edit: true,
        load: false,
        showEntity: false
      }
    },
    mounted() {
      this.loadHistory(this.id)
    },
    computed: {
      hasChapter() {
        return this.history.chapter_ids && this.history.chapter_ids.length > 0
      }
    },
    watch: {
      $route(to, from) {
        if(this.history.id && this.history.id !== to.params.id) {
          this.loadHistory(to.params.id)
          this.history.chapter_ids = []
        }
      },
      history(to, from) {
        // console.log('mudando history', to)
        this.$store.state.currentHistory = to
      }
    },
    methods: {
      editable() {
        return this.$store.state.user || !this.history.id
      },
      addChapter() {
        this.history.chapter_ids.push(null)
      },
      salve(){
        let id = this.history.id
        let url = id ? `histories/${id}.js` :'histories.js'
        let method = id ? 'put' : 'post'

        this.$http[method](url, { history: this.history })
          .then((resp) => this.history = resp.data)
          .then(() => this.$router.replace(`${this.history.id}`))
          .then(() => this.closeModal())
      },
      excluir(id) {
        this.$http.delete(`/histories/${id}.js`)
          .then(() => this.toPageHistories())
      },
      closeModal(){
        if(!this.history.id)
          this.toPageHistories()

        this.$refs['modal-register'].hide()
      },
      toPageHistories() {
        this.$router.push('/histories')
      },
      loadHistory(id) {
        if(!id)
          id = this.id

        if (id === 'new') {
          this.$refs['modal-register'].show()
          this.history = { history: { chapters: [] } }
        } else {
        this.load = true
        this.$http.get(`histories/${id}`)
          .then(resp => this.history = resp.data)
          .then(() => this.load = false)
          .catch(e => console.log(e))
        }
      }
    }
  }
</script>

<style scoped>

  main {
    /*position: relative;*/
  }

  main input, textarea {
    background-color: transparent;
    border: none;
    text-align: center;
    outline: none;
    display: block;
    width: 100%;
  }

  .menu {
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    bottom: 70px;
    width: calc(100% - 150px);
    left: 150px;
  }

  .menu div {
    background-color: whitesmoke;
    box-shadow: 5px 5px #888888;
    display: flex;
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
    padding-bottom: 100px;
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



</style>
