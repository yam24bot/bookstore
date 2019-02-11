class DropTable < ActiveRecord::Migration[5.2]
  def change
        drop_table :book_files
  end
end
