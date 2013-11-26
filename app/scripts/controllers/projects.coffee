angular.module('asana-exporter')
  .controller 'ProjectsCtrl',
    class ProjectsCtrl
      constructor: (@Asana) ->
        @Asana.getProjects().then (projects) =>
          @list = projects