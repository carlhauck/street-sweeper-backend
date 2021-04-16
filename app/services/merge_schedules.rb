class MergeSchedules
  def initialize(*args)
  end

  def delete_sql
    "DELETE FROM schedules;"
  end
  
  def insert_sql
    "INSERT INTO schedules
    SELECT * FROM staging_schedules;"
  end

  def call
    if StagingSchedule.count > 4000
      ActiveRecord::Base.connection.exec_query(delete_sql)
      ActiveRecord::Base.connection.exec_query(insert_sql)
    end
  end
end
