const buttons = document.querySelectorAll(".button2");
buttons.forEach(button=>{
  button.addEventListener("click", function(e){
  e.preventDefault();
  const card = e.target.closest(".card");

  const name1 = card.querySelector("h5").textContent;
  const priceText = card.querySelector("span").textContent;
  const price = Number(priceText.replace(" TL", ""));
  const img = card.querySelector("card-img-top").src;
  const category1 = card.dataset.category;
  const id = Number(card.dataset.id);

  const product = {
    id: id,
    name: name1,
    price: price,
    image: img,
    category: category1,
    quantity:1
  }

  console.log(product)
  })
})