import $ from 'jquery';

function calculatePrice() {
  var total = 0;
  $('.check_boxes:checked').each(function() {
    var h3 = this.nextSibling.firstChild.children[1]
    var price = $(h3).attr("price-data");
    total += parseFloat(price);
  });
  $('#total').text(total.toFixed(2));
}

$(function() {
  $(document).on("change", ".check_boxes", calculatePrice);
  calculatePrice();
});

export { calculatePrice };
