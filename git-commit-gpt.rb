class GitCommitGpt < Formula
	desc "A tool for creating better Git commit messages using OpenAI's GPT"
	homepage "https://github.com/jackbackes/happycommit"
	version "0.2.1"
	url "https://github.com/jackbackes/happycommit/archive/refs/tags/v0.2.1.tar.gz"
	sha256 "008e826be59cef14b0616ee44bd9e1620fbdd920b3f997c02713802b90d426e7"
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
  