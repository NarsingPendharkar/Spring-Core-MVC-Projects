package com.task.Model;

import java.sql.Date;
import org.springframework.data.web.JsonPath;
import com.task.Enum.Priority;
import com.task.Enum.TaskStatus;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
public class Tasks {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long task_id;
	@NotNull
	private String title;
	@NotNull
	private String description;
	@Temporal(TemporalType.DATE)
	private Date deadline;
	@Enumerated(EnumType.STRING)
	private Priority priority;
	@Enumerated(EnumType.STRING)
	private TaskStatus status;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User assignedUser;

	public Long getTask_id() {
		return task_id;
	}

	public void setTask_id(Long task_id) {
		this.task_id = task_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Priority getPriority() {
		return priority;
	}

	public void setPriority(Priority priority) {
		this.priority = priority;
	}

	public TaskStatus getStatus() {
		return status;
	}

	public void setStatus(TaskStatus status) {
		this.status = status;
	}

	public User getAssignedUser() {
		return assignedUser;
	}

	public void setAssignedUser(User assignedUser) {
		this.assignedUser = assignedUser;
	}

	public Tasks(Long task_id, String title, String description, Date deadline, Priority priority, TaskStatus status,
			User assignedUser) {
		super();
		this.task_id = task_id;
		this.title = title;
		this.description = description;
		this.deadline = deadline;
		this.priority = priority;
		this.status = status;
		this.assignedUser = assignedUser;
	}

	public Tasks() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Tasks [task_id=" + task_id + ", title=" + title + ", description=" + description + ", deadline="
				+ deadline + ", priority=" + priority + ", status=" + status + ", assignedUser=" + assignedUser + "]";
	}
}
