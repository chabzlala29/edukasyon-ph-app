App.Admin = {};
App.Admin.Courses = {
  teachers: [],

  renderTeachers: function(){
    var that = this;

    $(".course-form").find("#teachers").find("option").each(function(){
      $that = $(this)
      if (that.teachers.filter(function(item){ return $that.val() == item.id }).length == 0) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });

   var teachersListHTML = that.teachers.map(function(item){
     return `<span class='badge badge-secondary ml-2' data-teacher-id='${item.id}' data-name='${item.name}'>${item.name} <span class="remove-instructor">&times</span></span>`
   }).join("");

   var teachersHiddenHTML = that.teachers.map(function(item){
     return `<input type="hidden" multiple="true" name="course[teachers_ids][]" value="${item.id}"></input>`
   }).join("");

   $(".course-form").find(".teachers").html(teachersListHTML);
   $(".course-form").find(".teachers-list").html(teachersHiddenHTML);
  },

  removeInstructorEvent: function(){
    var that = this;

    $(".course-form").on("click", ".remove-instructor", function(){
      var teacherId = $(this).parent().data("teacher-id");
      var teacherName = $(this).parent().data("name");
      that.teachers.splice(that.teachers.indexOf({id: teacherId, name: teacherName}));

      that.renderTeachers();
    });
  },
  initializeEvents: function(){
    var that = this;

    $.each($(".course-form").find(".teachers").find("span.badge"), function(){
      that.teachers.push({
        id: `${$(this).data("teacher-id")}`,
        name: $(this).data("name")
      });
    });

    this.renderTeachers();
    this.removeInstructorEvent();

    $(".course-form").find(".save-course").on("click", function(){
      $(".course-form").find("form").find("input[type='submit']").click();
    });

   $(".course-form").on("click", "button.add-instructor", function(){
     var $teachersSelect = $(".course-form").find("#teachers");
     var selectedTeacher = { id: $teachersSelect.val(), name: $teachersSelect.find("option:selected").text() };

     if(that.teachers.filter(function(item){ return selectedTeacher.id == item.id }).length == 0) {
       that.teachers.push(selectedTeacher);
     }

     that.renderTeachers();
     that.removeInstructorEvent();
   });
  }
}

App.Admin.Teachers = {
  initializeEvents: function(){
    $(".teacher-form").find(".save-teacher").on("click", function(){
      $(".teacher-form").find("form").find("input[type='submit']").click();
    });
  }
}
