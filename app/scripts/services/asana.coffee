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

    module =
      getProjects: =>
        @request('/projects').then (res) ->
          res.data

    module