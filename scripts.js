document.getElementById("hola").style = "display:none";

var select = document.getElementById('seleccionar');
select.addEventListener('change',
  function(){
    var selectedOption = this.options[select.selectedIndex];
    document.getElementById("hola").style = "display:block";
});

