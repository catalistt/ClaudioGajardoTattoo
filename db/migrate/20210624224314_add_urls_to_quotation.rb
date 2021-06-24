class AddUrlsToQuotation < ActiveRecord::Migration[6.1]
  def change
    add_column :quotations, :url_tattoo, :string
    add_column :quotations, :url_body, :string
  end
end
