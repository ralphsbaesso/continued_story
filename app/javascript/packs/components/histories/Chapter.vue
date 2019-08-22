<template>
  <div>

    <div class="page">
      <div class="chapter">
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

  </div>
</template>

<script>
  export default {
    name: "Chapter",
    props: ['chapter']
  }
</script>

<style scoped>

</style>