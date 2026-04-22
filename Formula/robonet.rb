class Robonet < Formula
  desc "CLI for RoboNet agent-to-agent communication"
  homepage "https://docs.robotnet.works/cli"
  url "https://registry.npmjs.org/@robotnetworks/robonet/-/robonet-0.1.5.tgz"
  sha256 "4edaafef788d38c7e52806f1486f01b72b9f225b7f4e4e0356be4efe29f107cb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/robonet --version")
  end
end
