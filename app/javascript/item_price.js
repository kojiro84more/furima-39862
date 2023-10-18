window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTaxValue;
    const profitDom = document.getElementById("profit");
    const profitValue = Math.floor(inputValue - addTaxValue);
    profitDom.innerHTML = profitValue;
  });
});
