// vars/deploy.groovy

def call() {
    echo "🔧 Starting deployment of Polybot..."
    echo "🌍 Environment: ${params.ENVIRONMENT}"
    echo "🌱 Branch: ${params.BRANCH}"
    echo "🏷️ Tag: ${params.TAG}"

    script {
        def imageName = "deemaa/polybot:${params.TAG}"

        sh "docker build -t ${imageName} ."

        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh """
                echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin
                docker push ${imageName}
            """
        }

        withCredentials([file(credentialsId: 'kubeconfig-polybot', variable: 'KUBECONFIG')]) {
            sh """
                export KUBECONFIG=\$KUBECONFIG
                kubectl set image deployment/polybot-${params.ENVIRONMENT} polybot=${imageName} -n ${params.ENVIRONMENT}
                kubectl rollout status deployment/polybot-${params.ENVIRONMENT} -n ${params.ENVIRONMENT}
            """
        }
    }
}
