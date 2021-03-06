App.Teacher = {
  removeRating: function(ratingId){
    $.ajax({
      url: `/api/ratings/${ratingId}?course_id=` + $(".ratings-content").data("course-id"),
      method: "DELETE",
      dataType: "script",
      data: { authenticity_token: $('[name="csrf-token"]')[0].content}
    });
  },

  initRemoveRatingEvent: function(){
   var that = this;
    $(".ratings-content").find(".remove-rating").on("click", function(){
      var $element = $(this);
      if(confirm("Are you sure?")) that.removeRating($(this).data("rating-id"))
    });
  },

  initEvents: function(){
    var that = this;

    $("#modal").on("hidden.bs.modal", function(){
      window.location.reload();
    });

    this.initRemoveRatingEvent();
    this.initRateEvent();
  },

  initRateEvent: function(){
    var that = this;
    var $rateChar = $(".ratings-content").find(".rate-char");
    var $rating = $(".ratings-content").find("#rating");
    var $rateComment = $(".ratings-content").find("#rating-comment");

    $rateChar.on("mouseover", function(){
      var currentIndex = $(this).data("index");
      var selectedRating = $(".rate-char").slice(0, currentIndex + 1);
      $(".rate-char").filter(function(){
        return parseInt($(this).data("index") || 0) > currentIndex
      }).map(function(){
        $(this).text("☆");
      });
      selectedRating.text("★");
    })

    $rateChar.on("click", function(){
      var currentIndex = $(this).data("index");
      $rating.val(currentIndex + 1);
      $rateComment.removeClass("d-none");
    });
  }
}
