pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Cloning repo. . .'
                git branch: 'main', url: 'https://github.com/Lonestar137/jenkins-test.git'
            }
        }

        stage('Hello world'){
          steps {
            echo 'Hello world'
          }
        }
        
        stage('Run Python Script') {
            steps {
                echo 'Starting Python build . . .'
                // Set up Python environment (if necessary)
                // . . .
                // Run the Python script
                sh 'python3 ./src/main.py'
            }
        }
        
        stage('Create Tar Archive') {
            steps {
                // Create the tar archive
                sh 'tar cf repository.tar .'
            }
        }

        stage('Publish to GitHub') {
            steps {
                script {
                    echo 'Checking if commit is release build. . .'

                    // Check if the commit is tagged as a release
                    def isRelease = sh(script: 'git describe --exact-match --tags HEAD', returnStatus: true) == 0
                    
                    // Publish the archive folder if it's a release
                    if (isRelease) {
                        echo 'Commit is release build, publishing artifact to Github.'
                        withCredentials([usernamePassword(credentialsId: 'github-credentials', passwordVariable: 'GITHUB_TOKEN', usernameVariable: 'GITHUB_USERNAME')]) {
                            sh '''
                                curl -X POST -H "Authorization: token ${GITHUB_TOKEN}" \
                                -H "Content-Type: application/octet-stream" \
                                --data-binary "@repository.tar" \
                                "https://uploads.github.com/repos/your/repository/releases/${env.GIT_TAG}/assets?name=repository.tar"
                            '''
                        }
                    } else {
                      echo 'Not a release build not publishing to Github. . .'
                    }
                }
            }
        }
    }

    
    post {
        always {
            // Archive the tar file as an artifact
            archiveArtifacts 'repository.tar'
        }
    }
}
