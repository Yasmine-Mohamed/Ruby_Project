class AddingLectureForeignKeyToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :lecture, index: true

  end
end
