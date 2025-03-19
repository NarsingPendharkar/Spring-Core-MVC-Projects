package com.task.Controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.task.Model.Tasks;
import com.task.Model.User;
import com.task.Service.UserService;
import com.task.ServiceImpl.TaskServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("loggedUser")
@RequestMapping("/tasks")
public class TaskController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskServiceImpl taskserviceImpl;

	@GetMapping(value = { "/" })
	public String LandingPage(Model model,HttpSession session) {
		if(session!=null) {
			session.invalidate();
		}
		return "Dashboard";
	}
	@GetMapping("dashboard" )
	public String dashboardPage(Model model) {
		return "Dashboard";
	}

	@GetMapping("totaltask")
	@ResponseBody
	public String getTotalTask() {
		Integer total = taskserviceImpl.getCountoftasks();

		return Integer.toString(total);
	}

	@GetMapping("completedTasks")
	@ResponseBody
	public String completedTasks() {
		Integer total = taskserviceImpl.getCompletedTasks();

		return Integer.toString(total);
	}

	@GetMapping("getOverdueTasks")
	@ResponseBody
	public String getOverdueTasks() {
		Integer total = taskserviceImpl.getOverdueTasks();

		return Integer.toString(total);
	}

	// create tasks
	@PostMapping("saveTask")
	public String saveTask(@ModelAttribute Tasks tasks, BindingResult bindingResult,
			@RequestParam("assignee") int userid, Model model) throws SQLException {
		if (bindingResult.hasErrors()) {
			model.addAttribute("message", "Plese enter proper detials");
			return "redirect:/createtask";
		} else {
			User assigenedUser = userService.userbyid(userid);
			tasks.setAssignedUser(assigenedUser);
			taskserviceImpl.saveTask(tasks);
			System.out.println("saved");
			model.addAttribute("message", "Task added !");
			return "redirect:/tasks-list";
		}
	}

	@GetMapping("/tasks-list")
	public String listTasks(@RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "6") int size,
            Model model) {
	    Page<Tasks> tasksPage = taskserviceImpl.alltasks(PageRequest.of(page, size));
	   
	    model.addAttribute("tasks", tasksPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", tasksPage.getTotalPages());
	    return "task-list"; // Return the JSP page
	}

	@GetMapping("/list")
	@ResponseBody
	public ResponseEntity<List<Tasks>> totallistTasks() {
		List<Tasks> tasks = taskserviceImpl.getAllTasks();
		if (tasks.isEmpty()) {
			System.out.println(tasks);
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(tasks);
		}
		System.out.println(tasks);
		return ResponseEntity.ok(tasks);
	}

	@GetMapping("deleteTask/{id}")
	public String deleteTask(@PathVariable("id") int taskId, Model model) throws SQLException {
		taskserviceImpl.deleteTask(taskId);
		model.addAttribute("message", "Task deleted!");
		return "redirect:/tasks-list";
	}

	// Edit task page - Get task by ID
	@GetMapping("/editTask/{id}")
	public String editTask(@PathVariable("id") Long taskId, Model model) {
		Optional<Tasks> task = taskserviceImpl.getTaskById(taskId);
		if (task.isPresent()) {
			model.addAttribute("task", task.get()); // Add task details to the model
			List<User> users = userService.getAllUsers(); // Fetch all users
			model.addAttribute("users", users); // Add users to the model
			return "edit-task"; // Return the edit task page
		} else {
			model.addAttribute("message", "Task not found");
			return "error"; // Return an error page if task not found
		}
	}
	@GetMapping("/tasks")
	public String tasksPage() {
		return "task-list";
	}

	@GetMapping("/createtask")
	public String tcreatetaskPage(Model model) throws SQLException {
		List<User> users = userService.allUsers();
		model.addAttribute("users", users);
		return "Createtask";
	}
	
	@GetMapping("taskspage")
public String newpage() {
		return "tasks";
	}

    

}
