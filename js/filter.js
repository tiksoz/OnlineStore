const form = document.querySelector("#searchForm");
const searchInput = document.querySelector("#searchInput");
const cards = document.querySelectorAll(".card");

form.addEventListener("submit", function(e){
  e.preventDefault(); //sayfa yenileme durdurulur.

  let value = searchInput.value.toLowerCase();

  cards.forEach(function(card){
    let category = card.dataset.category.toLowerCase();
    let title = card.querySelector("h5").textContent.toLowerCase();

    if(category.includes(value) || title===value){
      card.parentElement.style.display = "block";
    } else {
      card.parentElement.style.display = "none";
    }
  });
});