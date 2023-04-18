class GitCommitGpt < Formula
	desc "A tool for creating better Git commit messages using OpenAI's GPT"
	homepage "https://github.com/jackbackes/happycommit"
	url "https://github.com/jackbackes/happycommit/archive/refs/tags/v0.1.0-alpha.tar.gz"
	sha256 "0b8dcf801664a7734421ef861f723a56a68c2861af185543f2586c95ea430d9f"
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
  