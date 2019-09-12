<template>
  <main>

<!--    <div @click="showEntity ? showEntity=false : showEntity=true">show</div>-->
<!--    <div v-if="!showEntity">-->
<!--      <h4>id {{ history}}</h4>-->
<!--      <hr>-->
<!--&lt;!&ndash;      <h4>{{ $store.state.currentHistory }}</h4>&ndash;&gt;-->
<!--    </div>-->

    <b-modal ref="modal-register" title="Nova Historia" @hide="closeModal()">

      <b-form>
        <b-form-group label="Título" label-for="input-title">
          <b-form-input id="input-title" v-model="history.title"/>
        </b-form-group>

        <b-form-group label="Descrição" label-for="input-description">
          <b-form-input id="input-description" v-model="history.description"/>
        </b-form-group>

        <b-form-group label="Privado?">
          <b-form-radio-group
            id="btn-radios-1"
            v-model="history.private || false"
            :options="options"
            buttons
            name="radios-btn-default"
          ></b-form-radio-group>
        </b-form-group>

      </b-form>

      <div slot="modal-footer">
        <b-button v-if="!history.id" variant="outline-info" @click="closeModal()">Cancelar</b-button>
        <b-button variant="outline-success" @click="salve()">Salvar</b-button>
      </div>
    </b-modal>

    <AllowedFor>
      <div class="options">
        <div @click="$refs['modal-register'].show()">
          <i class="fa fa-edit"></i>
          <span>Editar</span>
        </div>

        <div @click="destroy()">
          <i class="fa fa-trash"></i>
          <span>Excluir</span>
        </div>
      </div>
    </AllowedFor>

    <div v-if="history.id" class="history head">
      <div class="title">{{ history.title }}</div>
      <div class="description">{{ history.description }}</div>

      <template v-if="hasChapter">
        <Chapter v-for="(chapter, index) in history.chapters" :key="chapter.id"
                  :chapter="chapter"
                 @updateChapter="updateChapter($event, index)"
                 @deleteChapter="deleteChapter(index)"
        />

      </template>
      <div v-else>
        Nenhum Capítulo Escrito
      </div>
    </div>

    <div class="new-chapter">
      <h2 @click="addChapter">Novo Capítulo</h2>
    </div>

    <transition name="load">
      <Load :load="load" message="Aguarde carregar!!!"></Load>
    </transition>
  </main>
</template>

<script>
  import Load from '../../components/Load'
  import Chapter from './Chapter'
  import AllowedFor from '../../components/AllowedFor'

  export default {
    props: ['id'],
    components: { Load, Chapter, AllowedFor },
    data() {
      return {
        history: {},
        options: [
          { text: 'Privado', value: true }, { text: 'Público', value: false },
        ],
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
        return this.history.chapters && this.history.chapters.length > 0
      },
    },
    watch: {
      $route(to, from) {
        if(this.history.id && this.history.id !== to.params.id) {
          this.loadHistory(to.params.id)
        }
      },
      history(to, from) {
        this.$store.state.currentHistory = to
      },
    },
    methods: {
      loadHistory(id) {
        if(!id)
          id = this.id

        if (id === 'new') {
          this.$refs['modal-register'].show()
          this.history = { history: { chapters: [], private: false } }
        } else {
        this.load = true
        this.$http.get(`histories/${id}`)
          .then(resp => this.history = resp.data)
          .then(() => this.load = false)
          .catch(e => console.log(e))
        }
      },
      salve(){
        let id = this.history.id
        let url = id ? `histories/${id}.js` :'histories.js'
        let method = id ? 'put' : 'post'

        this.$http[method](url, { history: this.history })
          .then((resp) => this.history = resp.data)
          .then(() => this.$router.replace(`${this.history.id}`))
          .then(() => this.closeModal())
          .catch((e) => console.log(e))
      },
      destroy() {
        if(!confirm('Tem certeza?'))
          return

        let id = this.history.id
        this.$http.delete(`/histories/${id}.js`)
          .then(() => this.toPageHistories())
          .catch((e) => console.log(e))
      },
      editable() {
        return this.$store.state.user || !this.history.id
      },
      addChapter() {
        let chapter = { history_id: this.history.id }
        this.$http.post('chapters', { chapter: chapter })
          .then((resp) => this.history.chapters.push(resp.data))
          .catch((e) => console.log(e))
      },
      updateChapter(chapter, index){
        this.$http.put(`chapters/${chapter.id}`, { chapter: chapter })
          .then((resp) => chapter = resp.data )
          .catch((e) => console.log(e))
      },
      deleteChapter(index){
        let chapter = this.history.chapters[index]
        this.$http.delete(`/chapters/${chapter.id}.js`)
          .then(() => this.history.chapters.splice(index, 1))
          .catch((e) => console.log(e))
      },
      closeModal(){
        if(!this.history.id)
          this.toPageHistories()

        this.$refs['modal-register'].hide()
      },
      toPageHistories() {
        this.$router.push('/histories')
      },
    }
  }
</script>

<style scoped>

  main {
    position: relative;
  }

  .options {
    position: absolute;
    right: 30px;
    top: 30px;
    z-index: 100;
  }

  main input, textarea {
    background-color: transparent;
    border: none;
    text-align: center;
    outline: none;
    display: block;
    width: 100%;
  }

  .new-chapter {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
  }

  .new-chapter h2 {
    background-color: #a0522d;
    box-shadow: 5px 5px #888888;
    display: flex;
    cursor: pointer;
    color: black;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    margin: 10px;
    border-radius: 5px;
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
