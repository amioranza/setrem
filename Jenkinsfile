pipeline {
	agent any
    
    parameters {
        string(
            name: 'Parametro1',
            defaultValue: '',
            description: 'Exenplo de parametro.'
        )
    }
    
    environment {
        var1 = "EXEMPLO DE VARIAVEL"
    }

    stages {
        stage('Pergunta') {
            input {
                message "Devo continuar?"
                ok "Sim, deve."
                parameters {
                    string(name: 'PERSON', defaultValue: 'Sr Jenkins', description: 'Para quem eu digo olá?')
                }
            }
            steps {
                echo "Olá, ${PERSON}, prazer em conhecê-lo."
            }
        }

        stage ("Prepare") {
		    when {
		        expression {
		            return "${params.Parametro1}" != '';
		        }
		    }
        	steps {
                sh("echo ${var1}")
                sh("ls -Rla")
                sh("hostname")
                sh("ping -c10 google.com")
                sh("[ -e /tmp/teste ] || mkdir /tmp/teste")
                sh("echo ${params.Parametro1}")
            }
        }
        stage ("Validate") {
		    when {
		    	expression {
		        	return "${params.Parametro1}" != '';
		        }
		    }
		    steps {
				sh("echo Acabou o Pipeline!!!!!")
	        }
        }
	}
}