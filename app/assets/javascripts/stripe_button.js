function total_price(){
  var hash_prices = {"Bronze" : 0, "Silver" : 90, "Gold" : 230, "Platinum" : 370, "Master" : 770, "GrandMaster" : 1070, "Challenger" : 1970}
  ret = hash_prices[$("select#desired_rank").children("option:selected").text()] - hash_prices[$("select#current_rank").children("option:selected").text()]
  return ret >= 0 ? ret : 0
}

$(document).ready(function(){
  var amount
  $("select#current_rank, select#desired_rank").change(function(){
    amount = total_price()
    $("div#print_price").html(amount)
    $("div.actions").html("<script src='https://checkout.stripe.com/checkout.js' class='stripe-button' data-key='pk_test_pQdzsUTyAkBzrpfyhIDvdwn600gyLKd3yq' data-amount=" + amount * 100 + " data-name='Demo Site' data-description='Widget' data-image='https://stripe.com/img/documentation/checkout/marketplace.png' data-locale='auto' data-currency='eur' data-label='Commander' data-email=<%= current_user.email %>> </script>")
  })

  $("#bottom_boost").on("click", "button", function(e){
    console.log($("select#current_rank").children("option:selected").text());
    const Url="https://elo-boosting.herokuapp.com/boosts/"
    $.ajax({
      headers: {
        'X-Transaction': 'POST Example',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      url: Url,
      data: {boost:{current_rank: $("select#current_rank").children("option:selected").text(), desired_rank: $("select#desired_rank").children("option:selected").text(),queue: $("select#queue").children("option:selected").text(), riot_account: $("select#riot_account").children("option:selected").text()}},
      type: "POST",
      success: function(){
        console.log("success") 
      }
    })
  })
})