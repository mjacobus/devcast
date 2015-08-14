Lotus::Model.migration do
  change do
    create_table :devcasts do
      primary_key :id
      column :title, String,  null: false
      column :url, String,  null: false
      column :description, :text,  null: false
      column :published, :boolean,  default: false, null: false
      column :created_at, :datetime
      column :updated_at, :datetime
    end
  end
end
