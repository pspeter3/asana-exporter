angular.module('asana-exporter')
  .controller 'AuthCtrl',
    class Authtrl
      constructor: (@$location, @User) ->
        @key = @User.getKey()
      login: ->
        if (angular.isDefined(@key))
          @User.setKey(@key)
          @$location.path('/')
      logout: ->
        @User.clearKey()
        @$location.path('/login')