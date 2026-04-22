class Chore < Formula
  desc "Task runner for repetitive daily chores"
  homepage "https://github.com/zlliang/chore"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_arm64.tar.gz"
      sha256 "2bf66e2296a7fc98706190a21c3c16ee041e033728272506a5ad84d2fe57846a"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_darwin_amd64.tar.gz"
      sha256 "f540a8f6910d44a24e92fd8edfd73d4150d15d2e775a37fd6b9b2c58956f95d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_arm64.tar.gz"
      sha256 "42f2206b171bdfd9b3d218c6491ce45bc0f195b757a9ea1bdd12ad64e5ac40dd"
    elsif Hardware::CPU.intel?
      url "https://github.com/zlliang/chore/releases/download/v#{version}/chore_#{version}_linux_amd64.tar.gz"
      sha256 "ef5e3b5f4b57e1ee0fbee29650fdb178ae160fe008d83f9eac34a8dac896d9a1"
    end
  end

  def install
    bin.install "chore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chore --version")
  end
end
