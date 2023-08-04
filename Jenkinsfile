def Deploy(DeployEnv) {
    sh """
    source ../../assume_role.sh
    helm upgrade flask-app ./helm/ --atomic --wait --install --namespace $DeployEnv --set deployment.tag=$GIT_COMMIT --create-namespace --set deployment.env=$DeployEnv 
    """
}

pipeline {
    agent any
    environment {
        image_name="501533612229.dkr.ecr.us-east-1.amazonaws.com/flask"
        region="us-east-1"
    }
    stages {
        stage ("Build") {
        steps {
            sh '''
            docker build -t ${image_name}:$GIT_COMMIT" .
            '''
        }
    }
        stage ("Test") {
        steps {
            sh '''
            port=$(shuf -i 2000-10000 -n 1)
            docker run -dit -p $port:5000 ${image_name}:$GIT_COMMIT
            sleep 5
            curl http://localhost:$port
            exit_status=$?
            if [[ $exit_status == 0 ]]
            then echo "TEST OK" && docker stop $(docker ps -a -q)
            else echo "TEST FAILED" && docker stop $(docker ps -a -q) && exit 1
            fi
            '''
        }
    }
        stage ("Push") {
            steps {
                sh '''
                docker login -u AWS https://501533612229.dkr.ecr.us-east-1.amazonaws.com -p $(aws ecr get-login-password --region us-east-1)
                docker push $image_name:$GIT_COMMIT
                '''
             }
        }
        stage ("Deploy") {
            steps {
                sh '''
                aws eks update-kubeconfig --name flask-cluster
                '''
            }
        }
        stage ("Deploy_Dev") {
            when {
                expression {
                    env.BRANCH_NAME = "development"
                }
            }
            steps {
                Deploy("dev")
            }
        }
        stage ("Deploy_Stage") {
            when {
                expression {
                    env.BRANCH_NAME = "stage"
                }
            }
            steps {
                Deploy("stage")
            }
        }
            stage ("Deploy_Prod") {
            when {
                expression {
                    env.BRANCH_NAME = "main"
                }
            }
            steps {
                Deploy("prod")
            }
        }
    }
}