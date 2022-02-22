Vue.config.devtools = true;
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

let els = document.querySelectorAll('.edit_btn');
console.log(els);
els.forEach((el) => {
  console.log(el);
  new Vue({
    el: '.edit_btn',
    render: h => h(App, { props: $('.edit_btn').data() })
  })
});