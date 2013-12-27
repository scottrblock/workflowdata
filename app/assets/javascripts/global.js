$(function() {

  $.getJSON('/pomodoros/group/day/data', function(data) {
    var result = [];
    $.map(data, function(value, index) {
      var inner = [];       
      inner.push(new Date(index).getTime());
      inner.push(value);

      result.push(inner);
    });

   $('#container').highcharts('StockChart', {
      rangeSelector : {
        selected : 1
      },

      title : {
        text : 'Scott\'s Pomodoros Over Time'
      },
      
      series : [{
        name : 'Pomodoros',
        data : result,
        tooltip: {
          valueDecimals: 0
        }
      }]
    });
  });

});