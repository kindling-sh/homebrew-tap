# typed: false
# frozen_string_literal: true

class Kindling < Formula
  desc "Local Kubernetes dev environments powered by Kind — push code, your laptop builds & runs it"
  homepage "https://github.com/kindling-sh/kindling"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kindling-sh/kindling/releases/download/v#{version}/kindling_#{version}_darwin_arm64.tar.gz"
      sha256 "a5accf5ab87856c49be0d6b47b85d4b1b0987cebaa65aa86e30b7a8f156433fa"
    end

    on_intel do
      url "https://github.com/kindling-sh/kindling/releases/download/v#{version}/kindling_#{version}_darwin_amd64.tar.gz"
      sha256 "d6484e311012799751bfb69a3c458ed263d509df6e5b4197f044278a3c71a629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kindling-sh/kindling/releases/download/v#{version}/kindling_#{version}_linux_arm64.tar.gz"
      sha256 "3082ca6d0fb2e1af26766f90d468f33ffddcb37f7370ed2ea1725a57d08e839b"
    end

    on_intel do
      url "https://github.com/kindling-sh/kindling/releases/download/v#{version}/kindling_#{version}_linux_amd64.tar.gz"
      sha256 "7e8c90f88d5a5238473d69b42a304fcc70cfa5f37b2368dbb527421f1aa2d4bf"
    end
  end

  depends_on "kind"
  depends_on "kubectl"

  def install
    bin.install "kindling"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kindling version")
  end
end
