class Asp < Formula
  desc "Run and inspect local Agent Session Protocol networks"
  homepage "https://github.com/RobotNetworks/asp/tree/main/cli"
  url "https://registry.npmjs.org/@robotnetworks/asp/-/asp-0.1.1.tgz"
  sha256 "2e19b809dbf558d7c9f70f5858ab3442bbdb8d54199c965f349f53c9393c15f9"
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
