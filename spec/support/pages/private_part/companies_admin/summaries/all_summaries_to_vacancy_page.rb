require_relative 'new_summaries_section'
require_relative 'accepted_summaries_section'
require_relative 'rejected_summaries_section'

class AllSummariesToVacancyPage < SitePrism::Page
  set_url '/manage/vacancies/{id}/summaries'

  sections :new_summaries, NewSummariesSection, 'table.new_summary > tbody > tr'
  sections :accepted_summaries, AcceptedSummariesSection, 'table.accepted_summary > tbody > tr'
  sections :rejected_summaries, RejectedSummariesSection, 'table.rejected_summary > tbody > tr'

  def new_summary(id)
    new_summaries.find { |summary| summary.root_element['data-id'].to_i == id }
  end

  def accepted_summary(id)
    accepted_summaries.find { |summary| summary.root_element['data-id'].to_i == id }
  end

  def rejected_summary(id)
    rejected_summaries.find { |summary| summary.root_element['data-id'].to_i == id }
  end
end
