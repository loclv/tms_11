$(document).ready(function(){
  $('.finish').click(function(){
    var user_subject_id = $(this).data('id');

    $.ajax({type: "PUT",
      url: "/user_subjects/" + user_subject_id,
      data: {"user_subject[status]": 1},
      success:function(result){
        $('.finish').remove();
        $('.new_subject_info').text('subject is finished');
      }
    });
  });
})