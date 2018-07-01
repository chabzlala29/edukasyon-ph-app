App.Modal = {
  /* Note that if $form is null the link
   * should be defined in routes as POST, otherwise GET
   */

  openModal: function(target, link, backdrop, keyboard, $form = null) {
    $modal = $(target || "#modal");
    if ($form == null) {
      data = "";
    } else {
      data = $form.serializeArray().reduce(function(map, item){
        map[item.name] = item.value;
        return map;
      });
    }
    $modal.load(link, data, function(){
      options = {
        backdrop: backdrop,
        keyboard: keyboard
      }

      if(!options["backdrop"]) delete options["backdrop"]
      if(!options["keyboard"]) delete options["keyboard"]

      $modal.modal(options);
    })
  },

  hideModal: function(){
    $(".modal-link").removeData("modal");
    $(".modal-link").html("");
  },

  initModal: function(){
    $("body").on("hidden", ".modal-link", function(){
      App.Modal.hideModal();
    });

    $("body").on("click", ".modal-link", function(e){
      e.preventDefault();
      $link = $(this);
      App.Modal.openModal($link.data("target"), $link.attr("href"), $link.data("backdrop"), $link.data("keyboard"))
    });
  }
};

jQuery(function(){
  App.Modal.initModal();
});
