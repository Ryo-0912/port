let trash = document.getElementById('trash');
let qcard = document.querySelector('.question-card');

trash.addEventListener('click', function(){
  qcard.remove();
  setTimeout(function(){
    window.close();
  }, 1000);
});