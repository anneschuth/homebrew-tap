class Parro < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Parro school communication platform"
  homepage "https://github.com/anneschuth/parro-cli"
  url "https://files.pythonhosted.org/packages/1a/72/a5096f0e7422f5f34324661d852eb8727e57a87f255f6141b4a895266cef/parro-1.0.1.tar.gz"
  sha256 "51fee51a40cd71718342a35681531d1b96495aeff706542ffae400b5277665f3"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources(extra_pip_args: ["--extra-index-url", "https://pypi.org/simple"])
    # Install with CLI extras
    system libexec/"bin/pip", "install", "parro[cli]==#{version}"
  end

  test do
    assert_match "parro", shell_output("#{bin}/parro --help")
  end
end
