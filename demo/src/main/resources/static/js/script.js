$(".toggle").on("click", function () {
  $(".container").stop().addClass("active");
});

$(".close").on("click", function () {
  $(".container").stop().removeClass("active");
});

$("#btn").click(function () {
  $.post("toLogin?",$("#loginForm").serialize(),function(res){
    if (res.flag){
      console.log(res);
      location.href = "main";
    } else {
      console.log(res);
      $("#err_msg").html(res.message);
    }
  },"json");
});