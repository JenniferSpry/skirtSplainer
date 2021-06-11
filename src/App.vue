<template>
  <div id="app">
    <v-app>
      <v-main>
        <v-container fluid>
          <HomePage/>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import HomePage from './components/HomePage.vue';

export default {
  name: 'App',
  components: {
    HomePage,
  },
};
</script>
