class Tix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    url  "https://github.com/ncipollo/tix.git",
        :tag => "0.0.2"

    depends_on "go" => :build
    depends_on "make" => :build

    def install
        ENV["GOPATH"] = buildpath
        src_path = buildpath/"src/github.com/ncipollo/tix"
        # Copy all files from their current location (GOPATH root)
        # to $GOPATH/src/github.com/ncipollo/tix
        src_path.install Dir["*",".??*"]
        cd src_path do
            system "make", "brew"
        end
    end
end