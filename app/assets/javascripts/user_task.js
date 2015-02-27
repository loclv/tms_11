$(document).ready(function(){
  $('.done_button').click(function(){
    var user_task_id = $(this).data('id');
    $.ajax({type: "PUT",
      url: "/user_task/" + user_task_id,
      data: {"user_task[status]": 1},
      success:function(result){
        alert('This task is finished ');
        $('.done_button').remove();
        $('.task_info').text('task is done');
      }
    });
  });
})