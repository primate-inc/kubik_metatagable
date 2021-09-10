class CreateKubikMetaTagDefaults < ActiveRecord::Migration[6.1]
  def self.up
    create_table :kubik_meta_tag_defaults do |t|
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :kubik_meta_tag_defaults, %i(var), unique: true
  end

  def self.down
    drop_table :kubik_meta_tag_defaults
  end
end
