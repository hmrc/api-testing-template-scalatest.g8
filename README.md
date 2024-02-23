# api-testing-template-scalatest.g8

Giter8 template for API tests at HMRC.

Service teams should **NOT** use this template. Please use the [create-a-test-repository](https://build.tax.service.gov.uk/job/PlatOps/job/Tools/job/create-a-test-repository/) build job instead.

## Usage

Generate a new API test repository from the template as follows:

* Argument <name> must be desired repository name.

```bash
sbt new file://api-testing-template-scalatest.g8 --name=<name>-api-tests
```

## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
