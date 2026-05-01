class Chore < Formula
  desc "Task runner for repetitive daily chores"
  homepage "https://github.com/zlliang/chore"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_arm64.tar.gz"
      sha256 "859c5eaedb32f8f8f055b3672c4b307f713ba74d476ee18e5164d4b150041dde"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_amd64.tar.gz"
      sha256 "72f205c53e709e2172b4fb31a4a4c8362be7fedd0560518154245bf1a9b55cf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_arm64.tar.gz"
      sha256 "a36636ffb6c25db26dc8c1eb9570453e5e942191fc88c6fda0709087e91ff979"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_amd64.tar.gz"
      sha256 "272b7a32f0cc2f3f0cb8cd06f8d74d8ea81c584a2826afdf2641c794f0375d48"
    end
  end

  def install
    bin.install "chore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chore --version")
  end
end
