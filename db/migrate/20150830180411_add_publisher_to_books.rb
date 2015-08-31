class AddPublisherToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :publisher, index: true, foreign_key: true
  end
end
