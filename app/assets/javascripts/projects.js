// Place all the behaviors and hooks related to the matching controller here.
  $(function() {

      $( "#sortable" ).sortable();
      $( "#sortable" ).disableSelection();
      
      $("#draggable").draggable({
                 connectToSortable: 'ul#myList',
                 helper:'clone'
             });

             $("#myList").sortable({
                 stop: function(event, ui){
                     //put your AJAX call here
                     
                 }
             });
 
});


