class RemoveClientFromQuotation < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :quotations, :clients
  end
end
