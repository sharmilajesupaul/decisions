$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Int roducing_$(document).ready()

  $('#new_post').on('submit', function (e) {
    e.preventDefault();
    // var url = $('#new_post').attr('action');
    // console.log(url);
    partial = $('#new_post');
    console.log(partial);
    data = $(this).serialize();
    console.log(data);
    $.ajax({url: '/posts/new',
      type: 'post',
      data: data,
      success: function (serverData) {
        console.log(serverData);


        var title = $('#table_title').text(serverData.title);
        var content = $('#table_content').text(serverData.content);
        var timeline_body = '<div class="timeline-body">';
        var glyph_arrow = '<i class="glyphicon glyphicon-chevron-left"></i>';
        var glyph_clock = '<i class="glyphicon glyphicon-time"></i>';
        var title_a = '<a href="/users/<%= post.user_id %>/posts/<%= post.id %>" style="display: none">';
        var outter_div = '<div class="timeline-badge table">';
        var div_close = '</div>';

        $('#table_item').append(outter_div + glyph_arrow + div_close + title_a + title.text() + '</a>' + div_close + div_close + div_close);
      },
      error: function () {
        alert('faaaailz');
      }
    });
  });

// $('#new_pros').on('submit', function (e) {
//   e.preventDefault();

//   data = $(this).serialize();
//   console.log(e);
//   $.ajax({url: '/weights/new',
//     type: 'post',
//     data: data,
//     success: function (serverData) {
//       console.log(serverData);
//       // // var title = $('#table_title').text(serverData.title);
//       //   var content = $('#weight_content').text(serverData.content);
//       //   var timeline_body = '<div class="timeline-body">';
//       //   var glyph_thumb = '<i class="glyphicon glyphicon-thumbs-up"></i>';
//       //   var glyph_clock = '<i class="glyphicon glyphicon-time"></i>';
//       //   var title_a = '<a href="/users/<%= post.user_id %>/posts/<%= post.id %>" style="display: none">';
//       //   var badge_div = '<div class="timeline-badge table">';
//       //   var div_close = '</div>';

//         var pro_content = $('#pro_content').append(serverData.content);

//         $('#pro_item').append('<div class="timeline-badge pro"><i class="glyphicon glyphicon-thumbs-up"></i></div><div class="timeline-panel"><div class="timeline-heading"><h4 class="timeline-title">' + Mrs. Maverick Haag + '</h4><h6>' + whatever + ' </h6><p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>' + whatever o clock + '</small></p></div><div class="timeline-body" id="pro_body">' + pro_content + '</div></div>');
//     },
//     error: function () {
//       alert('faaaaailz');
//     }
//   });
// });


});
