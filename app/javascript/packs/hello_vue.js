Vue.config.devtools = true;
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#edit-btn2',
    render: h => h(App, { props: $('#edit-btn2').data() })
  })
})