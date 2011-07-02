module TasksHelper
	def task_version(task)
		link_to(task.version.name, task.version) if task.version
	end

	def task_iteration(task)
		link_to(task.iteration.name, task.iteration) if task.iteration
	end	
end
