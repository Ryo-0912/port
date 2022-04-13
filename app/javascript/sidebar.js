const Gebtn = document.getElementById('gbtn');
const Geform = document.getElementById('gform');
Gebtn.addEventListener('click', () => {
  if (Geform.style.display === 'none'){
    Geform.style.display = 'block';
  } else {
    Geform.style.display = 'none';
  }
});