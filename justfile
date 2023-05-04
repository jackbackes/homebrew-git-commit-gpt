# Justfile for homebrew-git-commit-gpt

# command to update with version number.
# should take a version, get the tarball from github, and update the sha256
# should update url and sha256 in the formula
# class GitCommitGpt < Formula
# desc "A tool for creating better Git commit messages using OpenAI's GPT"
# homepage "https://github.com/jackbackes/happycommit"
# version "0.2.1"
# url "https://github.com/jackbackes/happycommit/archive/refs/tags/v0.2.1.tar.gz" <- update this
# sha256 "10fe25701377af42f3cfba32c3fb7040393ef42616d5f10d899c8a57ea5d5424" <- update this
# license "Apache-2.0"

# Update the Version
update version:
	@echo "Updating version to $(version)"
	# Use sed along with $(just get_sha256 version) to update the sha256 in the formula
	@sed -i '' 's/[0-9a-f]\{64\}/'"$(just get_sha256 {{version}})"'/g' git-commit-gpt.rb
	# Use sed to update the url in the formula
	@sed -i '' 's/https:\/\/github.com\/jackbackes\/happycommit\/archive\/refs\/tags\/v[0-9]\.[0-9]\.[0-9].tar.gz/https:\/\/github.com\/jackbackes\/happycommit\/archive\/refs\/tags\/v{{version}}.tar.gz/g' git-commit-gpt.rb
	# Update the version line
	@sed -i '' 's/version "[0-9]\.[0-9]\.[0-9]"/version "{{version}}"/g' git-commit-gpt.rb
	@echo "Done!"

get_url version:
	@echo "https://github.com/jackbackes/happycommit/archive/refs/tags/v{{version}}.tar.gz"

get_sha256 version:
	@curl -L -O $(just get_url {{version}})
	@echo `shasum -a 256 ./v{{version}}.tar.gz | cut -d " " -f 1`
	@rm "./v{{version}}.tar.gz"
