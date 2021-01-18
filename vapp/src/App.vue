<template>
  <div v-if="isDrizzleInitialized" id="app">
    <img alt="Vue logo" src="./assets/logo.png" />

    <div class="section">
      <Crud />
    </div>
    <div class="section">
      <Toast />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import Toast from "./Toast";
import Crud from "./Crud";
import { mapGetters } from "vuex";

export default {
  name: "app",
  components: {
    Toast,
    Crud,
  },

  computed: mapGetters("drizzle", ["isDrizzleInitialized"]),
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
