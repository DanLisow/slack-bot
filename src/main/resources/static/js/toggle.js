var buttons = document.querySelectorAll(".role-buttons input");

for (var button of buttons) {
   button.addEventListener('click', function () {
     buttons.forEach(i => i.classList.remove('button-active'));
     this.classList.toggle('button-active');
   });
};