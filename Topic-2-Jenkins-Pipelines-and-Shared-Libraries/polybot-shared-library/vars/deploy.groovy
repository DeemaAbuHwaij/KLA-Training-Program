/**
 * Deploys a service by updating the Docker image in its deployment.yaml and pushing to GitHub.
 *
 * @param serviceName Name of the service directory (e.g., polybot)
 * @param imageName Full Docker image name with tag (e.g., deemaa/polybot:latest)
 */
def call(String serviceName, String imageName) {

    stage('Git setup') {
        sh '''
            git checkout -b main || git checkout main
        '''
    }

    stage('Update YAML manifest') {
        sh """
            echo 🛠️ Updating deployment YAML for service: ${serviceName}
            cd ${serviceName}

            # Replace image line in deployment.yaml
            sed -i 's|image: .*|image: ${imageName}|' deployment.yaml

            # Commit change
            git add deployment.yaml
            git commit -m "Updated image for ${serviceName} to ${imageName}"
        """
    }

    stage('Git push') {
        withCredentials([usernamePassword(
            credentialsId: 'github',
            usernameVariable: 'GITHUB_USERNAME',
            passwordVariable: 'GITHUB_TOKEN'
        )]) {
            sh """
                git config user.name "${GITHUB_USERNAME}"
                git config user.email "${GITHUB_USERNAME}@users.noreply.github.com"

                git push https://${GITHUB_TOKEN}@github.com/DeemaAbuHwaij/PolybotInfra.git main
            """
        }
    }
}
