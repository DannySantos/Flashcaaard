$(document).ready(function() {
  $('.flip-container').on('click', function(){
    $(this).toggleClass('nohover');
    this.classList.toggle('hover');
  });
});