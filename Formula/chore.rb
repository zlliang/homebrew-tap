class Chore < Formula
  desc "Task runner for repetitive daily chores"
  homepage "https://github.com/zlliang/chore"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_arm64.tar.gz"
      sha256 "3b1c952ee1f3925fddf424a0000d551005858e1c62451363a02e09dddb5c8efb"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_amd64.tar.gz"
      sha256 "7a00eae218c8acb5c32ec9da3e89d41d878536200c93985aec9456dbce1afba4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_arm64.tar.gz"
      sha256 "80a9bf46c376d775c43048f2f9e6647ccd6a9ca2b85512ea24152d9c199ba18c"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_amd64.tar.gz"
      sha256 "061b725e0a006f012f46f604afbff5ce561be433b877376f93ae1ef03e219e15"
    end
  end

  def install
    bin.install "chore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chore --version")
  end
end
