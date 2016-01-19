@manage = vacancies: build_chart: (data) ->
  return unless data?
  $(".canvas-wrapper").html("").html('<canvas id="canvas-summaries"></canvas>');
  data_chart = {
      labels : data.labels,
      datasets : [
        {
          label: "New summaries",
          fillColor : "rgba(8, 168, 69, 0.5)",
          strokeColor : "rgba(8, 168, 69, 1)",
          pointColor : "rgba(8, 168, 69, 1)",
          pointStrokeColor : "#fff",
          data : data.values.received
        },
        {
          label: "Accepted summaries",
          fillColor : "rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          pointColor : "rgba(151,187,205,1)",
          pointStrokeColor : "#fff",
          data : data.values.accepted
        },
        {
          label: "Rejected summaries",
          fillColor : "rgba(201, 0, 23, 0.5)",
          strokeColor : "rgba(201, 0, 23, 1)",
          pointColor : "rgba(201, 0, 23, 1)",
          pointStrokeColor : "#fff",
          data : data.values.rejected
        }
      ]
    }
  chartOptions = {
    legendTemplate : '<ul class="chartjs-legend <%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span class="pill" style="background-color:<%=datasets[i].strokeColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
    responsive: true
  };
  myNewChart = new Chart($("#canvas-summaries").get(0).getContext("2d")).Bar(data_chart,chartOptions)
  $(".legendDiv").html(myNewChart.generateLegend());

jQuery ->
  data = $('#canvas-summaries').data('report')
  manage.vacancies.build_chart(data)

  $(document).on 'focus', 'input[name="start_day"], input[name="end_day"]', ->
    $('input[value="period"]').prop('checked', true);
    $(this).datepicker({
      format: 'dd.mm.yyyy',
      orientation: 'bottom top'
    });
  $(document).on 'change', 'input[value="month"]', ->
    $('input[name="start_day"], input[name="end_day"]').attr("disabled", true)

  $(document).on 'change', 'input[value="period"]', ->
    $('input[name="start_day"], input[name="end_day"]').attr("disabled", false)
