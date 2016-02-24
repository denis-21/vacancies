module WaitForAjaxFinishing
  def wait_for_ajax_finishing(wait_time = 10)
    counter = 0
    while page.evaluate_script('$.active').to_i > 0
      counter += 1
      sleep(0.1)
      fail "AJAX request took longer than #{wait_time} seconds." if counter >= wait_time * 10
    end
  end
end
