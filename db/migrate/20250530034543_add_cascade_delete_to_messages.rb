class AddCascadeDeleteToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :chats, on_delete: :cascade
  end
end
