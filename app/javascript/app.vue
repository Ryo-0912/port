<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: ['to_edit_genre_id'],
  created() {
    let to_edit_genre_id = this.to_edit_genre_id;
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
