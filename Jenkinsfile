node {
	dir('code'){
		checkout scmGit(branches: [[name: '*/test-pipeline']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Lonestar137/jenkins-test.git']])

		script {
			//# def test = readYaml(file: 'test.yaml')
			def test = readJSON(file: 'test.json')
			echo test
		}
	}
}
