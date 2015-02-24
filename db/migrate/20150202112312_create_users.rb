# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.date :date_of_birth
      t.integer :actual_weight
      t.integer :ideal_weight
      t.integer :size
      t.boolean :in_diet
      t.boolean :like_diet
      t.string :cv

      t.timestamps null: false
    end
  end
end
