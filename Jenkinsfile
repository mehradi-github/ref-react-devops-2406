pipeline{
    agent {
        label "agent0"
    }
    parameters {
        booleanParam (
            defaultValue: true,
            description: '',
            name: 'FETCH_BACKEND_REPO'
        )
    }
    stages{
      stage("Prepare Postgres"){
            steps{
                when {
                    expression {
                        return params.FETCH_BACKEND_REPO
                    }
                }
                echo 'Feaching Backend Repo'
                cleanWs()
                // checkout scmGit(
                //     branches: [[name: '*/feature']],
                //     extensions: [ cloneOption(shallow: true, depth: 1, timeout: 30) ],
                //     userRemoteConfigs: [[url: 'https://github.com/mehradi-github/ref-graphql-devops-2406.git']])
            checkout([
                    $class: 'GitSCM',
                    branches: [[name: "*/feature"]],
                    extensions: [[
                        $class: 'CloneOption',
                        shallow: true,
                        depth:   1,
                        timeout: 30
                    ]],
                    userRemoteConfigs: [[
                        url:           'https://github.com/mehradi-github/ref-graphql-devops-2406.git',
                        credentialsId: 'jenkins-github'
                    ]]
                    ])
            // dir('/home/developer/Documents/works/the-quran-frontend-next/') {
            //     sh 'docker compose -f ./compose.database.yml up'
            //     // sh 'docker compose -f ./compose.build.yml up'
            //     }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}