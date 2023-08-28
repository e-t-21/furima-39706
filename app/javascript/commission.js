window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");

      const itemPriceInput = priceInput.value;
      const itemPrice = parseFloat(itemPriceInput);

      const taxPrice = Math.floor(itemPrice * 0.1);
      addTaxDom.innerHTML = (itemPriceInput === "" || taxPrice <= 0) ? "0" : taxPrice;

      const addProfitDom = document.getElementById("profit");

      if (addProfitDom) {
        const profitDom = document.getElementById("profit");
        const profit = Math.floor(itemPrice - taxPrice);
        profitDom.innerHTML = (itemPriceInput === "") ? "0" : profit.toString();
      }
    });
  }
});
