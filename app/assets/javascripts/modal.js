App.Modal = {
  /* Note that if $form is null the link
   * should be defined in routes as POST, otherwise GET
   */

  setupAjaxError: function(){
    $.fn.clearFormErrors = function(){
      this.find('.control-group, .form-group').removeClass('error');
      this.find('span.help-inline').remove();
    }

    $.fn.clearFormFields = function(){
      this.find(':input', '.simple_form')
        .not(':button, :submit, :reset, :hidden')
        .val('')
        .removeAttr('checked')
        .removeAttr('selected')
    }

    $.fn.renderFormErrors = function(model_name, errors){
      var form = this;
      this.clearFormErrors();

      $.each(errors, function(field, messages){
        var input = form.find('input, select, textarea').filter(function(){
          var name = $(this).attr('name')
          if (name) {
            return name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
          } else {
            return false;
          }
        })
        input.closest('.control-group, .form-group').addClass('error');
        input.parent().append('<span class="help-inline">' + $.map(messages, function(m){ return m.charAt(0).toUpperCase() + m.slice(1) }).join('<br />') + '</span>');
      })
    }
  },

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
  App.Modal.setupAjaxError();
});
