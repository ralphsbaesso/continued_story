<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">
      <b-navbar-brand href="#">A HISTÓRIA CONTINUA</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-item-dropdown v-if="user" right>
            <!-- Using 'button-content' slot -->
            <template slot="button-content">
              <em>{{ user.email }}</em>
            </template>
            <b-dropdown-item href="#">Perfil</b-dropdown-item>
            <b-dropdown-item data-method="DELETE" href="users/sign_out">Sair</b-dropdown-item>
          </b-nav-item-dropdown>

          <b-navbar-nav v-else right>
            <b-nav-item href="users/sign_in">Entrar</b-nav-item>
            <b-nav-item href="users/sign_up">Registrar</b-nav-item>
          </b-navbar-nav>

        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>

  export default {
    data: function () {
      return {
        title: "Meu NNNNNNNNNNN Título"
      }
    },
    computed: {
      user() { return this.$store.state.user }
    }
  }
</script>

<style>

</style>
