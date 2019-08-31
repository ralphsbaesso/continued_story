<template>
  <div>

    <div @click="showEntity ? showEntity=false : showEntity=true">show</div>
    <div v-if="showEntity">
      <h1>{{ chapter }}</h1>
    </div>

    <div class="page">
      <div class="chapter">
        <input class="title head" placeholder="Digite o título aqui" v-model="chapter.title"
          @focusout="update()"
        >
        <input class="description head" v-model="chapter.description" placeholder="Digite descrição aqui"
          @focusout="update()"
        >
        <textarea class="content" ref="el" @keyup="AutoGrow()" placeholder="Digite o conteúdo aqui"
                  v-model="chapter.content"
                  @focusout="update()"
        ></textarea>
      </div>

    </div>

  </div>
</template>

<script>
  export default {
    name: "Chapter",
    props: ['id', 'history_id'],
    data() {
      return {
        chapter: {},
        showEntity: false
      }
    },
    mounted() {
      if(this.id) {
        this.$http.get(`chapters/${this.id}`)
          .then((resp) => this.chapter = resp.data)
      } else {
        this.chapter.history_id = this.history_id
        this.$http.post('chapters', { chapter: this.chapter })
          .then((resp) => this.chapter = resp.data)
          .then(() => {
            let chapterIds = this.$store.state.currentHistory.chapter_ids
            let index = chapterIds.length - 1
            chapterIds[index] = this.chapter.id
          })
      }
    },
    methods: {
      AutoGrow() {
        let element = this.$refs.el
        element.style.height = (element.scrollHeight)+"px"
      },
      update() {
        if (!this.chapter.id)
          return

        this.$http.put(`chapters/${this.chapter.id}`, { chapter: this.chapter })
          .then((resp) => console.log(resp.data))
      }
    }
  }
</script>

<style scoped>

  .page {
    color: #2f2f2f;
    background-color: #f9f7f1;
    margin: 40px 40px 40px 40px;
    padding: 20px 20px 20px 20px;
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

  .chapter input, textarea {
    background-color: transparent;
    border: none;
    text-align: center;
    outline: none;
  }

  textarea {
    resize: none;
    overflow: hidden;
  }


</style>