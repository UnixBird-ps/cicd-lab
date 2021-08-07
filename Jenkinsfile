pipeline {
  agent {
    kubernetes {
      label 'simple-httpd'      // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 1             // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yml'   // path to the pod definition relative to the root of our project 
      defaultContainer 'golang'   // define a default container if more than a few stages use it, will default to jnlp container
    }
  }
  stages {
    stage( 'Build' ) {
      steps {
        container( 'golang' ) {
          sh "go build"
        }
      }
    }
    stage( 'Build Docker Image' ) {
      steps {
        container( 'docker' ) {  
          sh "docker build -t ps74/cicd-lab:simple-httpd ."  // when we run docker in this step, we're running it via a shell on the docker build-pod container,
          //sh "docker push ps74/cicd-lab:simple-httpd"        // which is just connecting to the host docker deaemon
        }
      }
    }
  }
}
