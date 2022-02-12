import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#edform',
    data: {
      edit_form: false
    }
  })
})