class Chore < Formula
  desc "Task runner for repetitive daily chores"
  homepage "https://github.com/zlliang/chore"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_arm64.tar.gz"
      sha256 "608d58b7e7304de6d5fbc54fa4e6c3899e8d607dd491eace40f581f5c0b7e5ce"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_amd64.tar.gz"
      sha256 "a043025ed690278e64f2a230e7fcaa2bd2f01c50cacae937715bdc047595bc61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_arm64.tar.gz"
      sha256 "4c855280c3b82be66721ce3e8397461abe93b8890066f98be05eedcfdbed76c9"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_amd64.tar.gz"
      sha256 "79038e892bc8e19aa9d9affd1a53f9861462da20deb3e1f9497ce559329380fa"
    end
  end

  def install
    bin.install "chore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chore --version")
  end
end
