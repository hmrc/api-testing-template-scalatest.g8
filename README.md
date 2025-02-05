# api-testing-template-scalatest.g8

Giter8 template for API tests at HMRC.

Service teams should  **NOT** use this template. Please instead use the 'Create a repository' page via the MDTP Catalogue.

## Development
To contribute to the api-testing-template-scalatest.g8 you'll need to test your changes locally before raising a PR (see below).

### Generating an API Test project from you local changes
To create a test project from your local changes, execute the following command from the parent directory of your local copy of the template:

    sbt new file://api-testing-template-scalatest.g8 --name=my-test-project

This will create a new API test project in a folder named `my-test-project/`.

### Running the api-testing-template-scalatest.g8 tests
A shell script is available to generate a repository from the template and ensure it compiles. Steps to run this script are documented here:
[./test-api-testing-template-scalatest.sh](test-api-testing-template-scalatest.sh)

**Note:** The script does not include any assertionsas the test repository contains no tests.

### Scalafmt
The generated template has already been formatted using scalafmt as well as containing a `.scalafmt.conf` configuration and sbt scalafmt plugin ready for teams to use.

Currently, formatting the files to include in a generated project is a manual task. This involves generating a new template from this project, formatting the generated files and then updating this repository to reflect the new formatting.

## Usage

Generate a new API test repository from the template as follows:

* Argument <name> must be desired repository name.

```bash
sbt new file://api-testing-template-scalatest.g8 --name=<name>-api-tests
```

## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
