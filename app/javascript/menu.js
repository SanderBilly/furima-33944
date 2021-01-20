function menu(){
  const menuTrigger = document.querySelector(".menu-trigger");
  const nav = document.querySelector(".sp-nav");
  const overlay = document.querySelector(".overlay");
  
  const spNavItem = document.querySelectorAll(".sp-nav-item");
  const spNavParent = document.querySelectorAll(".sp-nav-parent");

  menuTrigger.addEventListener("click", () => {
    if(menuTrigger.classList.contains("active")){
      menuTrigger.classList.remove("active");
      nav.classList.remove("open");
      overlay.classList.remove("open");
      for(let i = 0; i < spNavParent.length; i++) {
        spNavItem[i].classList.remove("open");
        spNavParent[i].classList.remove("open");
      }
    } else {
      menuTrigger.classList.add("active");
      nav.classList.add("open");
      overlay.classList.add("open");
    }
  });

  overlay.addEventListener("click", () =>{
    if(overlay.classList.contains("open")){
      menuTrigger.classList.remove("active");
      nav.classList.remove("open");
      overlay.classList.remove("open");
      for(let i = 0; i < spNavParent.length; i++) {
        spNavItem[i].classList.remove("open");
        spNavParent[i].classList.remove("open");
      }
    }
  });

  for (let i = 0; i < spNavParent.length; i++) {
    spNavItem[i].addEventListener('click', () => {
      if(spNavParent[i].classList.contains("open")){
        spNavItem[i].classList.remove("open");
        spNavParent[i].classList.remove("open");
      } else {
        spNavItem.forEach((item) => {
          item.classList.remove("open");
        });
        spNavParent.forEach((parent) => {
          parent.classList.remove("open");
        });
        spNavItem[i].classList.add("open");
        spNavParent[i].classList.add("open");
      }
    });
  }
}

window.addEventListener("load", menu);