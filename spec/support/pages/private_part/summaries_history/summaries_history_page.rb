require_relative 'summmaries_section'

class SummariesHistoryPage < SitePrism::Page
  set_url '/manage/summaries_history'

  sections :summaries, SummariesSection, 'table tbody tr'

  def summary(id)
    summaries.find { |summary| summary.root_element['data-id'].to_i == id }
  end
end
