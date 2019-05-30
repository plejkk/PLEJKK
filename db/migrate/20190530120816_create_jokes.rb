class CreateJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.text :e_body
      t.text :j_body
      t.text :e_caption
      t.text :j_caption
      t.text :e_speak
      t.text :j_speak

      t.timestamps
    end
  end
end
