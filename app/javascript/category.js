function category(){
  const categoryAll = document.querySelector(".category");
  const categoryTrigger = document.querySelector(".category-list");
  const categoryList = document.querySelector(".category-parent");

  categoryAll.addEventListener("mouseover", () => {
    categoryTrigger.classList.add("open");
    categoryList.classList.add("open");
  });

  categoryAll.addEventListener("mouseleave", () => {
    categoryTrigger.classList.remove("open");
    categoryList.classList.remove("open");
  });
}

window.addEventListener("load", category);