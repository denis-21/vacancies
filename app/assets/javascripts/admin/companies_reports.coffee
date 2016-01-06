jQuery ->
  data = $('#canvas').data('report')
  if data?
    data_chart = {
        labels : data.labels,
        datasets : [
          {
            fillColor : "rgba(220,220,220,0.5)",
            strokeColor : "rgba(220,220,220,1)",
            pointColor : "rgba(220,220,220,1)",
            pointStrokeColor : "#fff",
            data : data.values
          }
        ]
      }
    myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Line(data_chart)


