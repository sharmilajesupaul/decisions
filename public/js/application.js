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
//<div class="timeline-badge table"><i class="glyphicon glyphicon-chevron-left"></i></div>
//  <div class="timeline-panel">
//   <div class="timeline-heading">
//     <h4 id='table_title' class="timeline-title"><a href="/users/<%= post.user_id %>/posts/<%= post.id %>"><%= post.title %></a></h4>
//     <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> <%= post.created_at %></small></p>
//   </div>
//   <div class="timeline-body">
//     <p id="table_content"><%= post.content %></p>
//   </div>
// </div>



              var title = $('#table_title').text(serverData.title);
              var content = $('#table_content').text(serverData.content);
              var timeline_body = '<div class="timeline-body">';
              var glyph_arrow = '<i class="glyphicon glyphicon-chevron-left"></i>';
              var glyph_clock = '<i class="glyphicon glyphicon-time"></i>';
              var title_a = '<a href="/users/<%= post.user_id %>/posts/<%= post.id %>" style="display: none">';
              var outter_div = '<div class="timeline-badge table">';
              var div_close = '</div>';

              // var long_string = $('#table_item').append(outter_div + glyph_arrow + div_close + title_a + title.text() + '</a>' + timeline_body +  content.text()  + div_close + div_close + div_close + div_close);

              var long_string = $('#table_item').append(outter_div + glyph_arrow + div_close + title_a + title.text() + '</a>' + div_close + div_close + div_close);
              console.log(long_string);

              // location.reload();
            },
            error: function () {
              alert('faaaailz');
            }
          });

  });
});
