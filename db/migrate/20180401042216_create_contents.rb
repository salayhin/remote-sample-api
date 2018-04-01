class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :page_link
      t.text :h1_tag
      t.text :h2_tag
      t.text :h3_tag

      t.timestamps
    end
  end
end
