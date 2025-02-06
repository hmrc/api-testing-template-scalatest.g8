#!/bin/bash -e

# This script tests the api-testing-template-scalatest.g8 in the local environment
#
# What does the script do?
# - Creates a sandbox folder under target
# - Generates a template from api-testing-template-scalatest.g8
# - Initialises newly created test repository for sbtAutoBuildPlugin with repository.yaml, LICENSE, and an initial git commit
# - Runs sclafmt against the newly created test repository to ensure it is formatted correctly

log_message() {
  echo
  echo "-----------------------------------------------------------------------------------------------------------------"
  echo "$1"
  echo "-----------------------------------------------------------------------------------------------------------------"
  echo
}

log_message "INFO: Testing api-testing-template-scalatest.g8 in local"

setup_sandbox() {
  log_message "INFO: Running 'SBT clean' command to clean the target folder"
  sbt clean || exit 1

  TEMPLATE_DIRECTORY=$(pwd)
  SANDBOX="$TEMPLATE_DIRECTORY/target/sandbox"

  log_message "INFO: Creating folder: $SANDBOX"
  mkdir -p "$SANDBOX"
}

generate_repo_from_template() {
  log_message "INFO: Using api-testing-template-scalatest.g8 to generate new test repository: test-repo."

  TEMPLATE_PATH="file://$TEMPLATE_DIRECTORY"
  REPO_NAME="test-repo"

  log_message "INFO: Changing directory to sandbox: $SANDBOX"
  cd "$SANDBOX" || exit 1

  log_message "INFO: Generating new test repository from Giter8 template..."
  sbt new "$TEMPLATE_PATH" --name="$REPO_NAME"

  log_message "INFO: Test repository created successfully!"
  ls -l "$REPO_NAME"
}

initialise_repo() {
  log_message "INFO: Initialising repository for sbtAutoBuildPlugin with repository.yaml, LICENSE, and an initial git commit"

  cd "$SANDBOX/$REPO_NAME" || exit 1
  cp "$TEMPLATE_DIRECTORY/repository.yaml" .
  cp "$TEMPLATE_DIRECTORY/LICENSE" .

  git init || exit 1
  git add . || exit 1
  git commit -m "Initial commit" || exit 1

  log_message "INFO: Repository successfully initialised."
}

test_compilation() {
  log_message "INFO: Changing Directory to $SANDBOX/$REPO_NAME"
  cd "$SANDBOX/$REPO_NAME" || exit 1

  log_message "INFO: Checking repository compilation and code formatting on :: $REPO_NAME"
  sbt clean -Denvironment="${ENVIRONMENT:=local}" -Dsecurity.assessment=false "testOnly uk.gov.hmrc.api.specs.*" || exit 1

  log_message "INFO: Test 1 :: COMPLETED: $REPO_NAME compilation"
}

setup_sandbox
generate_repo_from_template
initialise_repo
test_compilation