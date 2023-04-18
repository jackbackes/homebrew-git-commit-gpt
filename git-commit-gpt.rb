class GitCommitGpt < Formula
	desc "A tool for creating better Git commit messages using OpenAI's GPT"
	homepage "https://github.com/jackbackes/happycommit"
	url "https://github.com/jackbackes/happycommit/archive/refs/tags/v0.2.0.tar.gz"
	sha256 "74d80c5254194a758d110e128c7e1fce715e5668c7de6d2b94cd4e7714fd3a19"
	license "Apache-2.0"
  
	depends_on "rust" => :build
	depends_on "just" => :build
  
	def install
	  system "just", "install"
	  bin.install "git-commit-gpt"
	end
  
	test do
		system "git-commit-gpt", "--help"
		system "git-commit-gpt", "--version"
	end

	def caveats
		<<~EOS
		  To add your OPENAI_API_KEY to the git-commit-gpt configuration, run the following command:

			printf "Enter your OPENAI_API_KEY: " && read -rs api_key && mkdir ~/.happycommit >> /dev/null && echo "OPENAI_API_KEY = \\\"$api_key\\\"" >> ~/.happycommit/config.toml

		  This command will prompt you to enter your API key and then add it to the ~/.happycommit/config.toml file.
		EOS
	  end
  end
  