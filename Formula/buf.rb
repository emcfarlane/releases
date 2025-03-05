class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-Darwin-arm64"
  sha256 "6a091a88cf44317c36d3752011c36e64a4bb62448a50d7e984a8e507fddc2946"
  version "1.49.0"

  checksums = {
    "darwin-arm64" => "6a091a88cf44317c36d3752011c36e64a4bb62448a50d7e984a8e507fddc2946",
    "darwin-x86_64" => "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5",
    "linux-arm64"  => "",
    "linux-x86_64"  => "",
  }

  on_macos do
    on_intel do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-x86_64"
      sha256 checksums["darwin-x86_64"]
    end
    on_arm do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-arm64"
      sha256 checksums["darwin-arm64"]
    end
  end

  # Linux architecture-specific downloads
  on_linux do
    on_intel do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Linux-x86_64"
      sha256 checksums["linux-x86_64"]
    end
    on_arm do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Linux-aarch64"
      sha256 checksums["linux-arm64"]
    end
  end

  def install
    bin.install "buf-#{OS.kernel_name}-#{Hardware::CPU.arch}" => "buf"
  end

  test do
    system "#{bin}/buf --version"
  end
end

