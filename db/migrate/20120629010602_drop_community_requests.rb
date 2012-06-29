class DropCommunityRequests < ActiveRecord::Migration
  drop_table :topic_requests
    drop_table :community_requests
        drop_table :versions
end
