
# api-testing-template-scalatest

This repository can be used by teams who are in need of an API test suite that verifies requests within a backend service. 

The api-testing-template-scalatest.g8 is developed and tested using:
* Java 1.8
* Scala 2.12.11
* sbt 1.3.12
* Scalafmt 2.7.1

It supports API testing using ScalaTest as the test execution framework.

## Support
This repository is supported by HMRC Digital's Test Community.  If you have a query or find an issue please drop in to the #community-testing channel in Slack.

## Contributions
If you'd like to contribute we welcome you to raise a PR or issue against the project and notify one of the core maintainers in #community-testing.

## Generating an API Test project
> Any new repository within HMRC GitHub organisation can **only** be created from a Jenkins job.
> The below instructions are only to create a repository locally.

You **DO NOT** need to clone this project to generate an API Test project from the template. You simply need to have
sbt installed, and run the `sbt new` command below.

### Generating an API Test project from main
To generate a test suite, execute the following command in the parent directory of where you'd like your API Test project created:
    
    sbt new hmrc/api-testing-template-scalatest.g8

This will prompt you for:
- **name** -> The name of the api test repository.  I.e. my-digital-service-api-tests

#### Before using the generated template
The generated template uses [sbt-auto-build](https://github.com/hmrc/sbt-auto-build) plugin which requires below additional setup in order to use the generated project.
* Add a LICENSE file to the root of the newly created repository. An example [LICENSE](https://raw.githubusercontent.com/hmrc/api-testing-template-scalatest.g8/main/LICENSE) file.
* Add a repository.yaml file to the root of the newly created repository. An example [repository.yaml](https://raw.githubusercontent.com/hmrc/api-testing-template-scalatest.g8/main/repository.yaml) file.
* Initialise the newly created repository to use Git `git init`
* Commit the changes locally. It is not required to push the changes.

To execute the example tests, follow the steps in the project README.md

> NOTE: When using Jenkins to create a repository with this template, the above steps are completed automatically by the Jenkins job.

To execute the example tests, follow the steps in the project README.md

### A Note on the ExampleSpec file
The example provided within this template demonstrates a scenario which:
* Makes a request to the `AUTH_LOGIN_STUB` stub in order to generate and obtain an auth bearer token
* Uses the auth bearer token to make a `POST` request to the `MATCHING_STUB` stub in order to set up test data
* Uses the auth bearer token to make a `GET` request to the `MATCHING_STUB` stub and assert that we can retrieve the record by its MatchId

## Development
To contribute to the api-testing-template-scalatest.g8 you'll need to test your changes locally before raising a PR (see below).

### Generating an API Test project from you local changes
To create a test project from your local changes, execute the following command from the parent directory of your local copy of the template:

    sbt new file://api-testing-template-scalatest.g8/ --name=my-test-project

This will create a new API test project in a folder named `my-test-project/`.  
 
### Running the api-testing-template-scalatest.g8 tests
A shell script is available to generate a repository from the template and run a smoke test 
from the newly created repository. Steps to run this script are documented here:
[./test-api-testing-template-scalatest.sh](test-api-testing-template-scalatest.sh)

**Note:** The script does not include any assertions to ensure that the tests are passing. You will have to consult the 
output to ensure that the tests ran successfully.

#### Testing in CI
In CI, [./test-api-testing-template-scalatest.sh](test-api-testing-template-scalatest.sh) is used to test the 
api-testing-template-scalatest.g8 template in a pipeline via a PR builder before merging changes to main. 


### Scalafmt
The generated template has already been formatted using scalafmt as well as containing a `.scalafmt.conf` configuration and sbt scalafmt plugin ready for teams to use. 

Currently, formatting the files to include in a generated project is a manual task. This involves generating a new template from this project, formatting the generated files and then updating this repository to reflect the new formatting.