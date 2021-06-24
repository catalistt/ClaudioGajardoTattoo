class AddUserToQuotation < ActiveRecord::Migration[6.1]
  def change
    add_reference :quotations, :user, foreign_key: true
  end
end
