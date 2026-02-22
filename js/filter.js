const form = document.querySelector("#searchForm");
const searchInput = document.querySelector("#searchInput");
const cards = document.querySelectorAll(".card");
const links = document.querySelectorAll("#linkFilter a");

//filterfuncton 
function filterCards(value){
  value = value.toLowerCase();

  cards.forEach(card => {
    let category = card.dataset.category.toLowerCase();
    let title = card.querySelector("h5").textContent.toLowerCase();

    if(category.includes(value) || title===value){
      card.parentElement.style.display = "block";
    } else {
      card.parentElement.style.display = "none";
    }
  });
}

//input filter
form.addEventListener("submit", function(e){
  e.preventDefault(); //sayfa yenileme durdurulur.
  filterCards(searchInput.value)
});

//category (a_href) filter
links.forEach(link=>{
  link.addEventListener("click", function(e){
  e.preventDefault();
  filterCards(link.dataset.category)
  });
});