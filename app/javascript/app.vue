<template>
  <div id="app">
    {{id}}
    <i id="pen" class="fas fa-pen" @click="editgg"></i>
    <form v-if="edit">
      <input type="text" v-model="name">
      <button @click="save">登録</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: ['id'],
  data: function () {
    return {
      edit: false,
      name: ''
    }
  },
  mounted(){
    console.log('aaaaa')
  },
  methods: {
    editgg: function() {
      this.edit = true
      axios.get('/genres')
            .then(res => console.log(res))
    },
    save: function() {
      axios.patch(`/genres/${id}`)
            .then(res => {
              console.log("ジャンルを登録しました")
              this.name = res.data;
            });
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
