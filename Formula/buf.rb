class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-Darwin-arm64"
  sha256 "${DARWIN_SHA256}"
  version "${VERSION}"

  checksums = {
    "darwin-arm64" => "",
    "darwin-x86_64" => "",
    "linux-arm64" => "",
    "linux-x86_64" => "",
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

