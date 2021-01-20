function header(){
  let headerHeight = document.querySelector(".top-page-header").clientHeight;
  const main = document.querySelector(".main");

  main.style.paddingTop = (headerHeight + "px");
}

function showHeader(){
  let headerHeight = document.querySelector(".top-page-header").clientHeight;
  const show = document.querySelector(".item-show");
  
  show.style.paddingTop = (headerHeight + "px");
}

window.addEventListener("load", header);
window.addEventListener("resize", header);
window.addEventListener("load", showHeader);
window.addEventListener("resize", showHeader);