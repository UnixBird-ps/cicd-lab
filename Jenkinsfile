pipeline {
  agent {
    kubernetes {
      label 'simple-httpd'      // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 1             // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yml'   // path to the pod definition relative to the root of our project 
      defaultContainer 'jnlp'   // define a default container if more than a few stages use it, will default to jnlp container
    }
  }
  stages {
    stage( 'Build' ) {
      steps {
        container( 'golang' ) {
          echo 'Compiling and building'
          sh "go build simple-httpd.go"
        }
      }
    }
    stage( 'Build Docker Image' ) {
      steps {
        container( 'docker' ) {  
          sh "pwd ; ls -AlF"
          sh "mkdir myapp && mv simple-httpd myapp/"
          sh "ls -AlF myapp/"
          sh "docker build -t cicd-lab:simple-httpd-$BUILD_NUMBER -f ./Dockerfile myapp/"  // when we run docker in this step, we're running it via a shell on the docker build-pod container,
        }
      }
    }
  }
}
