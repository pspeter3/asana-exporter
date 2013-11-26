angular.module('asana-exporter')
  .factory 'User', ($window, $localStorage) ->
    @key = false
    @headers = {}
    module =
      isAuthenticated: =>
        angular.isDefined(@key)
      getKey: =>
        @key
      getHeaders: =>
        @headers
      setKey: (key) =>
        $localStorage.key = key
        @key = key
        @headers =
          Authorization: 'Basic ' + $window.btoa(@key + ':')
      clearKey: =>
        delete $localStorage.key
        @key = undefined
        @headers = {}

    module.setKey($localStorage.key)
    
    module