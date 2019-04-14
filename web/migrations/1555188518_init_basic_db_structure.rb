Sequel.migration do
  change do
    alter_table :users do
      drop_column :name
      add_column :email, String
      add_column :password, String
      add_column :first_name, String
      add_column :last_name, String
      add_column :nick_name, String
      add_column :type, String
      add_foreign_key :family_id, :families
      add_column :birth_date, Date
      add_column :created_at, DateTime
      add_column :updated_at, DateTime
    end

    alter_table :families do
      drop_column :primary_user_id
      add_foreign_key :primary_user_id, :users
      add_column :name, String
      add_column :address, String, :text => true
      add_column :created_at, DateTime
      add_column :updated_at, DateTime
    end

    create_table :courses do
      primary_key :id
      String :name, :null => false
      Text :description
      foreign_key :teacher_id, :users
      DateTime :created_at
      DateTime :updated_at
    end

    create_table :course_prices do
      primary_key :id
      foreign_key :course_id, :courses
      Float :price, :null => false
      Date :start_from
      Date :end_at
      DateTime :created_at
    end

    create_table :classes do
      primary_key :id
      foreign_key :student_id, :users
      foreign_key :course_id, :courses
      foreign_key :teacher_id, :users
      Float :price, :null => false
      DateTime :created_at
    end

    create_table :sessions do
      primary_key :id
      foreign_key :class_id, :classes
      Float :cost, :null => false
      Date :time_stamp
      Integer :course_duration_in_min
    end

    create_table :session_comments do
      primary_key :id
      Text :content
      foreign_key :session_id, :sessions
      foreign_key :teacher_id, :users
      foreign_key :student_id, :users
      DateTime :created_at
    end

    create_table :student_progresses do
      primary_key :id
      Integer :level
      foreign_key :student_id, :users
      foreign_key :teacher_id, :users
      DateTime :created_at
    end

    create_table :homeworks do
      primary_key :id
      Text :description
      DateTime :due_date
      foreign_key :student_id, :users
      foreign_key :session_id, :users
      foreign_key :class_id, :classes
      String :status
      DateTime :created_at
    end

    create_table :accounts do
      primary_key :id
      foreign_key :family_id, :families
      Float :balance
      Float :credit_limit
      DateTime :created_at
      DateTime :updated_at
    end

    create_table :transactions do
      primary_key :id
      foreign_key :account_id, :accounts
      Float :amount
      String :type
      DateTime :created_at
      DateTime :updated_at
    end

    create_table :music_files do
      primary_key :id
      foreign_key :student_id, :users
      Text :original_path
      Text :mp4_path
      DateTime :created_at
      DateTime :updated_at
    end

    create_table :awards do
      primary_key :id
      foreign_key :student_id, :users
      Text :description
      DateTime :created_at
      DateTime :updated_at
    end

    create_table :activities do
      primary_key :id
      foreign_key :student_id, :users
      Text :description
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
