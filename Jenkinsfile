//http://127.0.0.1:8085/env-vars.html/, this will list all the environmet varialble directly supported by Jenkins
//We can write a groovy script to check like below.
//CODE_CHANGES = get_code_changes()
pipeline {
  agent any
  environment {
    //This will be available for all the stages
    NEW_VERSION = '1.3.0'
    //Use the credentials id here
    SERVER_CREDENTIALS = credentials('mura28info')
  }

  //tools
  //{
    //Accress build tools for your project, Only 3 build tools available from Jenkins: gradle, maven and jdk.
    //if you want to use anything else, that has to be handled in different ways
    //maven 'Maven'
    //echo 'executing tools'
  //}

  parameters{
    //Types of parameter:
    //string(name, defaultValue, description)
    //choice(name, choices, description)
    string(name: 'VERSION', defaultValue: '', description: 'The version to deploy on production')
    choice(name: 'VERSION', choices: ['1.0.0', '2.0.0', '3.0.0'], description: 'The version to deploy on production')
    booleanParam(name:'executeTests', defaultValue:true, description:'Skip the stage based on the condition')
  }


    stages
    {
        stage("build")
        {
          steps
          {
            //If you want to use variables use double coutes instead of single coutes in groovy
            echo "building version ${NEW_VERSION}"
            echo 'build the application'
            //sh "mvn install"
          }
        }
        stage("Test")
        {
          when{
            expression {
              // This stage will be executed only if this expression is matches
              BRANCH_NAME == 'dev' || BRANCH_NAME == 'master' && params.executeTests == true
            }
          }
          steps
          {
            echo 'Test is completed for the application'
          }
        }
        stage("Deploy")
        {
          steps
          {
            echo "Deploying with ${SERVER_CREDENTIALS}"
            echo 'deploying the application'
            //to run shell script
            //sh "${SERVER_CREDENTIALS}"
            echo 'Server credentials are executed'

            //If you want to use credentials to be used any one of the stage, you could follow like below
            //Use shell script for below to configure
            //withCredentials([
            //usernamePassword(credentials: 'mura28info', usernameVariable: USER, passwordVariable: PWD)])
            //{
              //sh "Some Artifact script that if u want to execute ${USER} ${PWD}"
            //}

            echo "deploying version is ${params.VERSION}"
          }
        }
     }
  post
    {
       //Executes some logic AFTER all stages are executed.
      always
      {
        //Always this step is executed
        echo 'Executing post condition always'
      }
      success
      {
        //Only if success
        echo 'Executing post condition on success'
      }
      failure
      {
        //Only failed
        echo 'Executing post condition on failure'
      }
    }
}
