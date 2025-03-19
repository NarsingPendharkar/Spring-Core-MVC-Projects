package com.task.ServiceImpl;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.task.Dao.TaskRepository;
import com.task.Model.Tasks;
import com.task.Service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {

	
	@Autowired
	private TaskRepository taskRepository;
	@Override
	public Page<Tasks> alltasks(Pageable pageable) {
		return taskRepository.findAll(pageable);
	}
	
	public void saveTask(Tasks tasks) {
		
        taskRepository.save(tasks);
	
}

public List<Tasks> getAllTasks() {
List<Tasks> alltasks = taskRepository.findAll();
	return alltasks;
}

public void deleteTask(long taskId) {
	taskRepository.deleteById(taskId);	
}



public Optional<Tasks> getTaskById(Long taskId) {
	Optional<Tasks> tasks =taskRepository.findById(taskId);
	return tasks;
}

public Integer getCountoftasks() {
	
	return taskRepository.getcount();
}

public Integer getCompletedTasks() {
	
	return taskRepository.getCompletedtasks();
}

public Integer getOverdueTasks() {
LocalDate date = LocalDate.now();
	String d = date.toString();
	return taskRepository.getOverduetasks(d);
	}


}


