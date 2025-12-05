pipeline {
    agent { label 'AGENT-1'}
    environment { 
        PROJECT = 'expense'
        COMPONENT = 'backend'
        appVersion = ''
        ACC_ID = '396913711219'
    }
    options { 
        disableConcurrentBuilds()
        timeout(time: 32, unit: 'MINUTES') 
    }
    
    stages {
        stage('read version') {
            steps {
                script{
                    def packageJson = readJSON file: 'package.json'
                    appVersion = packageJson.version
                    echo "version is: $appVersion"

                }
                
            }
        }
        stage('install dependencies') {
            steps {
                script{
                    sh """
                       npm install
                    """   

                }
                
            }
        }
        stage('docker build') {
            steps {
                script{
                    sh """
                       aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ACC_ID.dkr.ecr.us-east-1.amazonaws.com

                    """   

                }
                
            }
        }
        
    }
    
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        failure { 
            echo 'I will run when pipeline is failed'
        }
        success { 
            echo 'I will run when pipeline is success'
        }
    }
}
