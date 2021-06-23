class RemoveClientFromQuotation < ActiveRecord::Migration[6.1]
  def change
    remove_reference :quotations, :client, index:true, foreign_key: true
  end
end
