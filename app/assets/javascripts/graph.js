// Major Components of Graph Class

var Graph = function(selector, data, kind) {
  this.selector = selector;
  this.data = data;
  this.kind = kind;
};


Graph.prototype.getData = function() {

  var _this = this;

  // Create the Data Table
  var dataWithCaptions = this.data.data.map(function(element, index, array){
    return [ _this.data.x_axis.series[index], element ];
  }); // [ ["Jan 2014", 5], ["Feb 2013", 32] ]

  return google.visualization.arrayToDataTable([
    [ this.data.x_axis.legend, this.data.y_axis.legend ],
  ].concat(dataWithCaptions))

  return data;
 };

Graph.prototype.render = function(){
  // Set chart options
  var options = {'title': this.data.title,
                 'width': 400,
                 'height': 300};

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.ColumnChart($(this.selector)[0]);
  chart.draw(this.getData(), options);
};


Graph.instances = [];


