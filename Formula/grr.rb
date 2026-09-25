class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://github.com/debanjanbasu/grr-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.4.0/grr-v0.4.0-macos-aarch64.tar.gz"
    sha256 "485f44995d484acdababde50ca8aab48c91dc9478108a932454f37ac916ab4a5"
  end

  on_linux do
    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.4.0/grr-v0.4.0-linux-x86_64.tar.gz"
    sha256 "5e2aaea5df87363dd5c8b01032927c09c8ae417e85578e2b67ec7ad0c18c4cc0"
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end