pipeline {
    agent any // Выбираем Jenkins агента, на котором будет происходить сборка: нам нужен любой

	environment {
	MY_TOKEN = credentials('my-token')
}
    triggers {
        pollSCM('H/5 * * * *') // Запускать будем автоматически по крону примерно раз в 5 минут
    }

    tools {
        maven 'Maven install' // Для сборки бэкенда нужен Maven
        jdk 'JDK16' // И Java Developer Kit нужной версии
        nodejs 'NodeJS-installation' // А NodeJS нужен для фронта
    }

    stages {
        stage('Build & Test backend') {
            steps {
                dir("backend") { // Переходим в папку backend
                    sh 'mvn package' // Собираем мавеном бэкенд
                }
            }

            post {
                success {
                    junit 'backend/target/surefire-reports/**/*.xml' // Передадим результаты тестов в Jenkins
                }
            }
        }

        stage('Build frontend') {
            steps {
                dir("frontend") {
                    sh 'npm install' // Для фронта сначала загрузим все сторонние зависимости
                    sh 'npm run build' // Запустим сборку
                }
            }
        }
        
        stage('Save artifacts') {
            steps {
                archiveArtifacts(artifacts: 'backend/target/sausage-store-0.0.1-SNAPSHOT.jar')
                archiveArtifacts(artifacts: 'frontend/dist/frontend/*')
            }
        }
        
        stage("Post stage") {
	    steps {
               sh '''curl -X POST -H \'Content-type: application/json\' --data \'{"text":"Pavel Parshin собрал приложение."}\' \
https://hooks.slack.com/services/TPV9DP0N4/B02PSECK8JF/\$MY_TOKEN'''
            }
        }
        
    }
}
