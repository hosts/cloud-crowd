class InitialSchema < ActiveRecord::Migration
  def self.up
    
    create_table(:jobs) do |t|
      t.column :status,       :integer, :null => false
      t.column :inputs,       :text,    :null => false
      t.column :action,       :string,  :null => false
      t.column :options,      :text,    :null => false
      t.column :callback_url, :string
      t.column :owner_email,  :string
      t.timestamps
    end
    
    create_table(:work_units) do |t|
      t.column :status,       :integer, :null => false
      t.column :job_id,       :integer, :null => false
      t.column :input,        :string,  :null => false
      t.column :output,       :text
      t.timestamps
    end
    add_index :work_units, :job_id
    
  end

  def self.down
    drop_table :jobs
    drop_table :work_units
  end
end
