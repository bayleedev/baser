module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      compile:
        files: 'public/javascripts/main.js': 'assets/javascripts/main.coffee'
    less:
      compile:
        files: 'public/stylesheets/layout.css': 'assets/stylesheets/layout.less'
    watch:
      scripts:
         files: 'assets/*/*'
         tasks: ['coffee', 'less']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.registerTask 'default', ['coffee', 'less']
