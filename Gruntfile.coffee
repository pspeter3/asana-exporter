module.exports = (grunt) ->
  # Tasks
  grunt.registerTask('dev', [
    'clean:dev',
    'copy:dev',
    'coffeelint',
    'coffee:dev',
    'jade:dev',
    'sass:dev',
    'connect:dev',
    'watch'
  ])

  # Configuration
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean:
      dev: ['.tmp']
    copy:
      dev:
        expand: true
        cwd: 'app/bower_components'
        src: ['**']
        dest: '.tmp/bower_components'
    coffeelint:
      options:
        arrow_spacing:
          level: 'error'
        indentation:
          level: 'warn'
        no_empty_param_list:
          level: 'error'
        no_stand_alone_at:
          level: 'error'
      app: ['Gruntfile.coffee', 'app/scripts/**/*.coffee', 'test/**/*.coffee']
    coffee:
      dev:
        options:
          sourceMap: true
        expand: true
        cwd: 'app/scripts'
        src: ['**/*.coffee']
        dest: '.tmp/js'
        ext: '.js'
    jade:
      dev:
        options:
          pretty: true
        expand: true
        cwd: 'app'
        src: ['*.jade', 'views/**/*.jade']
        dest: '.tmp'
        ext: '.html'
    sass:
      options:
        includePaths: ['app/bower_components/foundation/scss']
      dev:
        files:
          '.tmp/css/app.css': ['app/styles/app.scss']
    connect:
      options:
        port: 3000
      dev:
        options:
          livereload: true
          open: true
          middleware: (connect) ->
            [connect.static('.tmp')]
    watch:
      coffee:
        files: ['app/scripts/**/*.coffee']
        tasks: ['coffeelint', 'coffee:dev']
      jade:
        files: ['app/*.jade', 'app/views/**/*.jade']
        tasks: ['jade:dev']
      sass:
        files: ['app/styles/**/*.scss']
        tasks: ['sass:dev']
      livereload:
        options:
          livereload: true
        files: [
          '.tmp/*.html',
          '.tmp/views/**/*.html',
          '.tmp/js/**/*.js',
          '.tmp/css/*.css'
        ]

  # NPM Tasks
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-sass')