Sequel.migration do
  change do
    create_table(:families) do
      primary_key :id
      String :primary_user_id, null: false
    end
  end
end