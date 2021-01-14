function calc(){
  const priceForm = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit")

  priceForm.addEventListener("input", (e) => {
    tax.textContent = Math.floor(e.target.value * 0.1);
    profit.textContent = (e.target.value - tax.textContent);
  });
}

setInterval(calc, 1000);