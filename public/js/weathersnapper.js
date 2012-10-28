
jQuery.validator.addMethod("postalcode", function(postalcode, element) {
  //return this.optional(element) || postalcodecode.match(/(^\d{5}(-\d{4})?$)$/);
  return this.optional(element) || postalcodecode.match(/(^\d{5}(-\d{4})?$)$/);
}, "Please specify a valid postal/zip code");

$(document).ready(function(){

  $("#zipform").validate({
    rules: {
      postalcode: {
        postalcode: true
      }
    }
  });

  // Not getting validator to work correcly, this is a first cut
  // which sort of works.
  $('#postalcode').keyup(function() {
    $('span.error-keyup-1').hide();
    var inputVal = $(this).val();
    var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
    if(!numericReg.test(inputVal)) {
        $(this).after('<span class="error error-keyup-1">Numeric characters only.</span>');
    }
  });

});
