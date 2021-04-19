class InsertZones
  def initialize(*args)
  end

  def delete_sql
    "DELETE FROM zones;"
  end
  
  def insert_sql
    "INSERT INTO zones
    SELECT * FROM staging_zones;"
  end

  def call
    if StagingSchedule.count > 800
      ActiveRecord::Base.connection.exec_query(delete_sql)
      ActiveRecord::Base.connection.exec_query(insert_sql)
    end
  end
end
