package com.task.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.task.Enum.TaskStatus;
import com.task.Model.Tasks;

@Repository
public interface TaskRepository  extends JpaRepository<Tasks, Long> {
	
	@Query( value="SELECT count(task_id) FROM tasks ",nativeQuery=true)
	public Integer getcount();

	@Query(value="SELECT count(task_id) FROM tasks where status='COMPLETED' ",nativeQuery=true)
	public Integer getCompletedtasks();
	@Query(value="SELECT count(task_id) FROM tasks where deadline<?1", nativeQuery=true)
	public Integer getOverduetasks( String  date);
	
	
	
	

}
