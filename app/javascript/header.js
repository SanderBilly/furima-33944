function header(){
  let headerHeight = document.querySelector(".top-page-header").clientHeight;
  const main = document.querySelector(".main");

  main.style.paddingTop = (headerHeight + "px");
}

window.addEventListener("load", header);
window.addEventListener("resize", header);
