angular.module('asana-exporter')
  .controller 'ProjectsCtrl',
    class ProjectsCtrl
      constructor: (@Asana, @ngProgress) ->
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
        @ngProgress.height('5px')
        @ngProgress.color('#008CBA')
        @ngProgress.start()
        @Asana.getProjects().then (projects) =>
          @ngProgress.complete()
          @list = projects
      select: (project) ->
        @ngProgress.start()
        @Asana.getTasksForProject(project.id).then (res) =>
          @ngProgress.complete()
          project.tasks = res
          project.getTasks = ->
            project.tasks