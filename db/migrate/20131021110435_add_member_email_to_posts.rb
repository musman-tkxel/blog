class AddMemberEmailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :member_email, :string
  end
end
