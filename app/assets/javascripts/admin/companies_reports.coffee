@admin = companies: build_chart: (data) ->
  return unless data?
  $(".canvas-wrapper").html("").html('<canvas id="canvas"></canvas>');
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


jQuery ->
  company_report_start_end_day = $("input[name='company_report_start_day'], input[name='company_report_end_day']")

  company_report_start_end_day.inputmask("d.m.y",{ "placeholder": "dd.mm.yyyy" });
  data = $('#canvas').data('report')
  admin.companies.build_chart(data)
  $(document).on 'change', 'input[value="month_year"]', ->
    company_report_start_end_day.attr("disabled", true)

  $(document).on 'change', 'input[value="period"]', ->
    company_report_start_end_day.attr("disabled", false)


