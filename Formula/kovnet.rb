class Kovnet < Formula
  include Language::Python::Virtualenv

  desc "CLI for the KovNet childcare (kinderopvang) platform"
  homepage "https://github.com/anneschuth/kovnet-cli"
  url "https://files.pythonhosted.org/packages/source/k/kovnet/kovnet-1.1.2.tar.gz"
  sha256 ""
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources(extra_pip_args: ["--extra-index-url", "https://pypi.org/simple"])
    system libexec/"bin/pip", "install", "kovnet[cli]==#{version}"
  end

  test do
    assert_match "kovnet", shell_output("#{bin}/kovnet --help")
  end
end
