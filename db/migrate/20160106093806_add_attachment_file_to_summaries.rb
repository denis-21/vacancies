class AddAttachmentFileToSummaries < ActiveRecord::Migration
  def self.up
    change_table :summaries do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :summaries, :file
  end
end
