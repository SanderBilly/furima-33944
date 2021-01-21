function comment(){
  const firstShow = 3;

  const comments = document.querySelectorAll(".comments-list");
  const more = document.querySelector(".comments-more-btn");

  for(let i = firstShow; i < comments.length; i++){
    comments[i].classList.add("hidden");
  }

  more.addEventListener("click", () => {
    if(more.classList.contains("open")){
      for(let i = firstShow; i < comments.length; i++){
        comments[i].classList.add("hidden");
      }
      more.innerHTML = `コメントを全て表示する（${comments.length}）`;
      more.classList.remove("open");
    } else {  
      for(let i = firstShow; i < comments.length; i++){
        comments[i].classList.remove("hidden");
      }
      more.innerHTML = "コメントを一部表示する";
      more.classList.add("open");
    }
  });
}

window.addEventListener("load", comment);