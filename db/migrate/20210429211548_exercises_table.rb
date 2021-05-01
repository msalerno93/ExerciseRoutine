class ExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group
    end
  end
end
