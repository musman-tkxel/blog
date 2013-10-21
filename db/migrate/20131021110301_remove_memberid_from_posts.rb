class RemoveMemberidFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :member_id, :integer
  end
end
