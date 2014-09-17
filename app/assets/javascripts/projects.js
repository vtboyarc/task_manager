// Place all the behaviors and hooks related to the matching controller here.
  $(function() {
  
    $( ".draggable" ).draggable({ snap: true, grid: [ 10,10 ] });
  
});

// to force it to drop in a certain place
// $(function() {
//     $("#draggable").draggable({
//         revert : function(event, ui) {
//
//             $(this).data("uiDraggable").originalPosition = {
//                 top : 0,
//                 left : 0
//             };
//             // return boolean
//             return !event;
//
//         }
//     });
//     $("#droppable").droppable();
// });
//
// need this for droppable to work, in hmtml, under the last <%end%>
// <div id="droppable">
//     <p>Drop me here</p>
// </div>
//
