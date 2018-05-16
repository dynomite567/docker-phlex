node("armhf") {
    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
    
        git url: "https://github.com/dynomite567/docker-phlex-armhf.git", credentialsId: 'GitHub'
    
        stage "Build image"
        def app = docker.build "dynomitecentral/phlex-armhf"
    
        stage "Publish image"
        app.push 'weekly'
        app.push "${env.BUILD_NUMBER}"
    }
}
