class ChangeVisitsDatetimeColumnType < ActiveRecord::Migration[6.0]
  def up
    change_column :visits, :datetime, 'timestamp USING datetime::timestamp'
  end

  def down
    change_column :visits, :datetime, :string
  end
end
