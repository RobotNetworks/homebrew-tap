class RobotNet < Formula
  desc "CLI for RobotNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robotnet/-/robotnet-0.1.12.tgz"
  sha256 "79b54537b5b70a89a75b69e9acaecd37d9f6bf905a0c4f5948505133811d9b24"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robotnet --version")
  end
end
