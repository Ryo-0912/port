<template>
  <div id="app">
    {{id}}
    <i id="pen" class="fas fa-pen" @click="editgg"></i>
    <form v-if="edit">
      <label for="name" hidden></label>
      <input type="text" v-model="name" name="genre[name]" value="">
      <button @click="save">登録</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

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
    },
    save: function() {
      axios.patch(`/genres/${this.id}`)
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
