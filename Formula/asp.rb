class Asp < Formula
  desc "Run and inspect local Agent Session Protocol networks"
  homepage "https://github.com/RobotNetworks/asp/tree/main/cli"
  url "https://registry.npmjs.org/@robotnetworks/asp/-/asp-0.1.3.tgz"
  sha256 "7d6c746cac0761a8d661da6dbb8e9bd5ad63905d0bed5bcebddc8c78ccddf9a3"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asp --version")
  end
end
