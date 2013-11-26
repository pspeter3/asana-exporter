angular.module('asana-exporter')
  .factory 'User', ($localStorage) ->
    @key = false
    module =
      isAuthenticated: =>
        angular.isDefined(@key)
      getKey: =>
        @key
      setKey: (key) =>
        $localStorage.key = key
        @key = key
      clearKey: =>
        delete $localStorage.key
        @key = undefined

    module.setKey($localStorage.key)
    
    module