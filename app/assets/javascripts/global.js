var buildLineGraph = function(data){
  $('#stock-chart').highcharts('StockChart', {
     rangeSelector : {
       selected : 1
     },
     
     series : [{
       name : 'Pomodoros',
       data : data,
       tooltip: {
         valueDecimals: 0
       }
     }]
   });
};

var buildCalHeatMap = function(data){
  var cal = new CalHeatMap();
  cal.init({
    itemSelector: "#cal-chart",
    domain: "month",
    subDomain: "x_day",
    start: new Date(),
    cellSize: 30,
    cellPadding: 5,
    data: data,
    domainGutter: 20,
    range: 3,
    domainDynamicDimension: false,
    previousSelector: "#PreviousDomain-selector",
    nextSelector: "#NextDomain-selector",
    domainLabelFormat: function(date) {
      moment.lang("en");
      return moment(date).format("MMMM").toUpperCase();
    },
    subDomainTextFormat: "%d",
    legend: [20, 40, 60, 80]
  });
}




$(document).ready(function(){
  $.getJSON('/pomodoros/group/day/data', function(data) {
    var cal_data = {};
    var line_data = [];
    $.map(data, function(value, index) {
      var time_in_mil = new Date(index).getTime();
      var inner = [];       
      inner.push(time_in_mil);
      inner.push(value);

      var time_in_sec = time_in_mil / 1000;
      cal_data[time_in_sec] = value;
      line_data.push(inner);
    });

    console.log(cal_data);
    console.log(line_data);

    line_data = _.sortBy(line_data, function(e){
      return e[0];
    });

    

    buildLineGraph(line_data);
    buildCalHeatMap(cal_data);
   
  });

  
});