class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://github.com/debanjanbasu/grr-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.3.0/grr-v0.3.0-macos-aarch64.tar.gz"
    sha256 "ce5db162be88bd7c7a71e1f28ad4694bcc67d1c79c7854526cbb762a293d0f71"
  end

  on_linux do
    url "https://github.com/debanjanbasu/grr-cli/releases/download/v0.3.0/grr-v0.3.0-linux-x86_64.tar.gz"
    sha256 "fa3420bd809280117d60e2ff1884f3692695b27229665a36db909ec76368f44c"
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end