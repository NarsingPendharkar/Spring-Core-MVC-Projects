package com.task.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.task.Model.Tasks;

public interface TaskService {
	Page<Tasks> alltasks(Pageable pageable);

	public void saveTask(Tasks tasks);

	public List<Tasks> getAllTasks();

	public void deleteTask(long taskId);

	public Optional<Tasks> getTaskById(Long taskId);

	public Integer getCountoftasks();

	public Integer getCompletedTasks();

	public Integer getOverdueTasks();
}
