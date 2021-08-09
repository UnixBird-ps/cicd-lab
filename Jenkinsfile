pipeline {
  agent {
    kubernetes {
      label 'simple-httpd'      // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 1             // how long the pod will live after no jobs have run on it
      yamlFile 'build-pod.yml'   // path to the pod definition relative to the root of our project 
      defaultContainer 'jnlp'   // define a default container if more than a few stages use it, will default to jnlp container
    }
  }
  //tools {
  //  go 'go1.16.7'
  //}
  //environment {
  //  GO114MODULE = 'on'
  //  CGO_ENABLED = 0 
  //  GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
  //}
  stages {
    //stage( 'Pre Test' ) {
    //  steps {
    //    echo 'Installing dependencies'
    //    sh 'go version'
    //    // sh 'go get -u golang.org/x/lint/golint'
    //  }
    //}
    stage( 'Build' ) {
      steps {
        container( 'golang' ) {
          echo 'Compiling and building'
          sh "go build simple-httpd.go"
          sh "ls -AlpN"
        }
      }
    }
    stage( 'Build Docker Image' ) {
      steps {
        container( 'docker' ) {  
          sh "docker build -t ps74/cicd-lab:simple-httpd-$BUILD_NUMBER ."  // when we run docker in this step, we're running it via a shell on the docker build-pod container,
          //sh "docker push ps74/cicd-lab:simple-httpd"        // which is just connecting to the host docker deaemon
        }
      }
    }
  }
}
