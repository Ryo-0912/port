<template>
  <div id="app">
    <span v-if="glink">
      <span @click="genrelink">{{name}}</span>
    </span>
    <i id="pen" class="fas fa-pen" @click="editgg"></i>
    <i id="trash" class="fas fa-trash" @click="deletegg"></i>
    <span class="egform">
      <form v-if="edit">
        <label for="name" hidden></label>
        <input class="edgform" type="text" v-model="name">
          <button class="cancel-btn" @click="cancel">キャンセル</button><button class="save-btn" @click.prevent="save">登録</button>
      </form>
    </span>
  </div>
</template>

<script>
import axios from 'axios';


axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

export default {
  props: ['id', 'name'],
  data: function () {
    return {
      glink: true,
      edit: false,
      counter: this.id,
      counter: this.name
    }
  },
  methods: {
    genrelink: function() {
      location.href = `/genres/${this.id}/questions`;
    },
    editgg: function() {
      this.glink = false,
      this.edit = true,
      this.name = `${this.name}`
    },
    deletegg: function() {
      axios.delete(`/genres/${this.id}`)
            .then(res => {
              document.location.reload();
            });
    },
    save: function() {
      axios.patch(`/genres/${this.id}`, { genre: { name: this.name } })
            .then(res => {
              document.location.reload();
            });
    },
    cancel: function() {
      this.glink = true,
      this.edit = false
    }
  }
}
</script>

<style>
.edgform{
  margin-left: -10px;
  border-radius: 5px;
  margin-bottom: 2px;
}
.cancel-btn{
  margin-left: 22.3px;
  border-radius: 5px;
}
.save-btn{
  margin-left: 2px;
  border-radius: 5px;
}
</style>
