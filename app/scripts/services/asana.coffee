angular.module('asana-exporter')
  .factory 'Asana', ($http, User) ->
    @ROOT = 'https://app.asana.com/api/1.0'

    @request = (path, options = {}) =>
      params =
        method: 'GET'
        url: @ROOT + path
        headers: User.getHeaders()

      $http(angular.extend(params, options)).then (res) ->
        res.data

    @PROJECTION = [
      'assignee',
      'assignee_status',
      'created_at',
      'completed',
      'completed_at',
      'due_on',
      'modified_at',
      'name',
      'notes',
      'parent'].join(',')

    module =
      getProjects: =>
        @request('/projects').then (res) ->
          res.data

      getTasksForProject: (id) =>
        @request('/projects/' + id + '/tasks',
          params:
            opt_fields: @PROJECTION
        ).then (res) ->
          res.data

    module