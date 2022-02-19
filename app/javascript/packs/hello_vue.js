Vue.config.devtools = true;
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.querySelectorAll('.edit-btn').forEach((el) => { //.edit-btnの要素をすべて取得して、それを１つずつ抽出？している
  new Vue({
    el: '.edit-btn',                                       //.edit-btnの要素に対して
    render: h => h(App, { props: $('.edit-btn').data() })  //.edit-btnに付随しているデータをpropsとしてAppで適用できるようにしている
  })
})