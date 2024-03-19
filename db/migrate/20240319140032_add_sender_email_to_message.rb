class AddSenderEmailToMessage < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :sender_email, :string
  end
end
