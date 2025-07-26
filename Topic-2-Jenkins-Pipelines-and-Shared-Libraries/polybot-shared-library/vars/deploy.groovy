// Shared library function to deploy updated image by modifying the YAML manifest
def call(String serviceName, String imageName) {

    stage('Git setup') {
        sh '''
            git checkout -b main || git checkout main
        '''
    }

    stage('Update YAML manifest') {
        // Navigate to the service folder and update the deployment.yaml with the new image name
        sh """
            echo 'Updating deployment YAML for service: ${serviceName}'
            cd ${serviceName}

            sed -i "s|image: .*|image: ${imageName}|" deployment.yaml

            # Stage and commit the change
            git add deployment.yaml
            git commit -m "Updated image for ${serviceName} to ${imageName}"
        """
    }

    stage('Git push') {
        // Push the changes back to GitHub using credentials securely
        withCredentials([usernamePassword(credentialsId: 'github', usernameVariable: 'GITHUB_USERNAME', passwordVariable: 'GITHUB_TOKEN')]) {
            sh '''
                # Configure Git user for commit
                git config user.name "$GITHUB_USERNAME"
                git config user.email "$GITHUB_USERNAME@users.noreply.github.com"

                # Push the changes to the GitHub repository using the token
                git push https://$GITHUB_TOKEN@github.com/DeemaAbuHwaij/PolybotInfra.git main
            '''
        }
    }
}
