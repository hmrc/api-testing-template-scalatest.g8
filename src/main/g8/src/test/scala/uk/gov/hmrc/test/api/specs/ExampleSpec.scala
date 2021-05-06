/*
 * Copyright 2020 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package uk.gov.hmrc.test.api.specs

class ExampleSpec extends BaseSpec {

  Feature("Example") {

    Scenario("Retrieve customers contact information") {

      When("a request is made to get customer contact information")
      val response = exampleService.getInformation(validRegime, validIdType, validId)

      Then("the response code should be 200")
      response.status should be(200)
    }

    Scenario("Unable to retrieve customer contact information when providing invalid information") {

      When("an invalid request is made to get customer contact information")
      val response = exampleService.getInformation(validRegime, validIdType, invalidId)

      Then("the response code should be 400")
      response.status should be(400)

      And("I am returned an invalid VRN response")
      response.body shouldBe Some(invalidVRNResponse)
    }

  }

  val validRegime        = "VATC"
  val validIdType        = "VRN"
  val validId            = "919951000"
  val invalidId          = "<ID>"
  val invalidVRNResponse = "VRN contained a non digit character: <ID>"

}
