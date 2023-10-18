class Create3Tables < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public
      t.belongs_to :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end

    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity
      t.belongs_to :buyer, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end

    create_table :recipe_foods do |t|
      t.integer :quantity
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :food, null: false, foreign_key: true

      t.timestamps
    end

  end
end
