class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://github.com/debanjanbasu/grr-cli"
  url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.2.0/grr-v0.2.0-macos-aarch64.tar.gz"
  sha256 "23f3c19e2e6abc6bdf64293a6f484efbc8c721ed633b3d8def9be0fcaa340a17"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.2.0/grr-v0.2.0-linux-x86_64.tar.gz"
    sha256 "b9f0e36c3b745dce3df6206c5c0deb9e07dcb40d691c310589d11ac2ed726f55"
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end
