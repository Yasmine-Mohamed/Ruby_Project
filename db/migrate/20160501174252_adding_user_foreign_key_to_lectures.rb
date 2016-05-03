class AddingUserForeignKeyToLectures < ActiveRecord::Migration
  def change
    add_reference :lectures, :user, index: true

  end
end
