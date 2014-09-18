// Place all the behaviors and hooks related to the matching controller here.
  $(function() {
  
    $('.sortable').each(function()) {
      var $table = $(this);
      var $tbody = $table.find('tbody');
      var $controls = $table.find('th');
      var rows = $tbody.find('tr').toArray();
      
      $controls.on('click', function()) {
        var $header = $(this);
        var order = $header.data('sort');
        var column;
        
        if ($header.is('.ascending') ||  $header.is('.descending')) {
          $header.toggleClass('ascending descending');
          $tbody.append(rows.reverse());
        } else {
          $header.addClass('ascending');
          
          $header.siblings().removeClass('ascending descending');
          if (compare.hasOwnProperty(order)) {
            column = $controls.index(this);
            
            rows.sort(function(a,b){ 
              a = $(a).find('td').eq(column).text();
              b = $(b).find('td').eq(column).text();
              return compare[order](a,b);
            
            });
            
            $tbody.append(rows);
            
          }
          
        }
          
        });
          
          
        });
        
      
      
      
      
      
    }
    
      
});