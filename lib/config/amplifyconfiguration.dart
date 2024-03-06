const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "us-east-2:dc592a2c-24e7-44a5-9e93-08924ab9914b",
                          "Region": "us-east-2"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "us-east-2_2HH2gj2F9",
                      "AppClientId": "7u5nrlvb0mq2445ltifq1dk2s5",
                      "AppClientSecret": "b01bncrpbfcqs37ua98u76dmhdmvdcq3kagirjbjs79nf96e96d",
                      "Region": "us-east-2"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "USER_SRP_AUTH"
                  }
              }
          }
      }
  }
}''';
