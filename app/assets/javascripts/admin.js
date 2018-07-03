App.Admin = {};
App.Admin.Courses = {
  teachers: [],

  renderTeachers: function(){
    var that = this;
    $(".course-form").find("#teachers").find("option").each(function(){
      if (that.teachers.includes({ id: $(this).val(), name: $(this).text() })) {
        $(this).hide();
       } else {
         $(this).show();
       }
    });

   var teachersListHTML = that.teachers.map(function(item){
     return `<span class='badge badge-secondary ml-2' data-teacher-id='${item.id}' data-name='${item.name}'>${item.name} <span class="remove-instructor">&times</span></span>`
   }).join("");

   $(".course-form").find(".teachers").html(teachersListHTML);
  },

  initializeEvents: function(){
    var that = this;

    $(".course-form").find(".save-course").on("click", function(){
      $(".course-form").find("form").find("input[type='submit']").click();
    });

   $(".course-form").on("click", "button.add-instructor", function(){
     var $teachersSelect = $(".course-form").find("#teachers");
     var selectedTeacher = { id: $teachersSelect.val(), name: $teachersSelect.find("option:selected").text() };

     if(!that.teachers.includes(selectedTeacher)) that.teachers.push(selectedTeacher);

     that.renderTeachers();

     $(".course-form").on("click", ".remove-instructor", function(){
       var teacherId = $(this).parent().data("teacher-id");
       var teacherName = $(this).parent().data("name");
       that.teachers.splice(that.teachers.indexOf({id: teacherId, name: teacherName}));

       that.renderTeachers();
     });
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
