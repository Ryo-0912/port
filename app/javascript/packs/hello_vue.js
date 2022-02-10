import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#pen',
    data: {
      message: "聞こえますか？これはvue.jsなのです。htmlの書き込みではありません"
    },
    methods: {
      editg: function() {
        
      }
    }
  })
})