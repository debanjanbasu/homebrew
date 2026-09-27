class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://grr-cli.pages.dev"
  version "0.5.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.5.0/grr-v0.5.0-macos-aarch64.tar.zst"
    sha256 "ce81c95095c7f4a7d6e029371478e999261b612485c97488105ee13ced975798"
  end

  on_linux do
    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.5.0/grr-v0.5.0-linux-x86_64.tar.zst"
    sha256 "6862cef5ae0701220e8d64a561977e1fc3dc99da35a9d687eb496d8c4fb438c4"
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end