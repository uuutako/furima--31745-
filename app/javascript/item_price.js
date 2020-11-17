window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.1
    addTaxDom.innerHTML = tax

    const  profit = document.getElementById("profit");
    const sales_profit = inputValue * 0.9
    profit.innerHTML = sales_profit
  })
  
})
