class Chore < Formula
  desc "Task runner for repetitive daily chores"
  homepage "https://github.com/zlliang/chore"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_arm64.tar.gz"
      sha256 "edfdeaa348b709c42134ed4df8b138257ddf47de6f7c1080fd6d04c2ce5bc922"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_amd64.tar.gz"
      sha256 "bd62253a96d5212ff528cd8971935adea7adfa66be0aa83c93ca050d167f20a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_arm64.tar.gz"
      sha256 "388ba0832d2f495d191bb83e1271167e2db4e40c97b685a027680deae3c7bf98"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_amd64.tar.gz"
      sha256 "e7a0405f0931509d7f5b1a3cb24e6a0c8858e946d39ee20883cf4da83945f3c7"
    end
  end

  def install
    bin.install "chore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chore --version")
  end
end
