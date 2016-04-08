$(function() {
  $(".mask_two_decimals").maskMoney({decimal:",", thousands:".", allowZero:true});
  $(".mask_cpf").mask("999.999.999-99")
  $(".mask_cnpj").mask("99.999.999/9999-99")
  $(".mask_state_registration").mask("999.999.999.999")
  $(".mask_postal_code").mask("99999-999")
  $(".mask_telephone").mask("(99) 99999999?9")
  $(".mask_plate").mask("aaa-9999")
  $(".mask_access_key").mask("9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999");
  $(".mask_date").mask("99/99/9999")
  $(".mask_time").mask("99:99:99")
});