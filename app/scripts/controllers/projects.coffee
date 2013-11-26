angular.module('asana-exporter')
  .controller 'ProjectsCtrl',
    class ProjectsCtrl
      constructor: (@Asana) ->
        @fields = [
          'id',
          'name',
          'notes',
          'assignee',
          'assignee_status',
          'created_at',
          'completed',
          'completed_at',
          'due_on',
          'modified_at',
          'parent']
        @Asana.getProjects().then (projects) =>
          @list = projects
      select: (project) ->
        @Asana.getTasksForProject(project.id).then (res) =>
          project.tasks = res
          project.getTasks = ->
            project.tasks