node {
	dir('code'){
		checkout scmGit(branches: [[name: '*/test-pipeline']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Lonestar137/jenkins-test.git']])

		def test = readYaml(file: 'test.yaml')
		echo test
	}
}
