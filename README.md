
# api-testing-template-scalatest

This repository can be used by teams who are in need of an API test suite that verifies requests within a backend service. 

The api-testing-template-scalatest.g8 is developed and tested using:
* Java 1.8
* Scala 2.12.11
* sbt 1.3.12
* giter8 0.11.0-M3
* Scalafmt 2.7.1

It supports API testing using ScalaTest as the test execution framework.

## Support
This repository is supported by HMRC Digital's Test Community.  If you have a query or find an issue please drop in to the #community-testing channel in Slack.

## Contributions
If you'd like to contribute we welcome you to raise a PR or issue against the project and notify one of the core maintainers in #community-testing.

## Generating an API Test project
You **DO NOT** need to clone this project to generate an API Test project from the template.  You simply need to have giter8 installed, and run the `g8` command below.

### [Install giter8 CLI](#install-giterate) 
You will need to have giter8 installed in order to generate a test suite from the api-testing-template-scalatest.g8. Due to some limitations with the SBT giter8 plugin, unfortunately this template will not generate successfully. 

Instructions to install giter8 can be found [here](http://www.foundweekends.org/giter8/setup.html).

### Generating an API Test project from master
To generate a test suite, execute the following command in the parent directory of where you'd like your API Test project created:
    
    g8 hmrc/api-testing-template-scalatest.g8

This will prompt you for:
- **name** -> The name of the api test repository.  I.e. my-digital-service-api-tests

To execute the example tests, follow the steps in the project README.md

### A Note on the Example Feature file
The example tests provided in this template are quite limited in what they do. They make some simple requests to show 
how to quickly set up and run tests using the api testing template. These tests depend on the service `DIRECT_DEBIT_STUBS` 
being available.

## Development
To contribute to the api-testing-template-scalatest.g8 you'll need to test your changes locally before raising a PR (see below).

### Generating an API Test project from you local changes
To create a test project from your local changes, execute the following command from the parent directory of your local copy of the template:

    g8 file://api-testing-template-scalatest.g8/ --name=my-test-project

This will create a new API test project in a folder named `my-test-project/`.  
 
### Running the api-testing-template-scalatest.g8 tests
A shell script is available to generate a repository from the template and run a smoke test 
from the newly created repository. Steps to run this script are documented here:
[./test-api-testing-template-scalatest.sh](test-api-testing-template-scalatest.sh)

**Note:** The script does not include any assertions to ensure that the tests are passing. You will have to consult the 
output to ensure that the tests ran successfully.

#### Testing in CI
In CI, [./test-api-testing-template-scalatest.sh](test-api-testing-template-scalatest.sh) is used to test the 
api-testing-template-scalatest.g8 template in a pipeline via a PR builder before merging changes to master. 


### Scalafmt
The generated template has already been formatted using scalafmt as well as containing a `.scalafmt.conf` configuration and sbt scalafmt plugin ready for teams to use. 

Currently, formatting the files to include in a generated project is a manual task. This involves generating a new template from this project, formatting the generated files and then updating this repository to reflect the new formatting.