class Tix < Formula
    desc "A command line utility for generating jira, etc tickets from a markdown document."
    url  "https://github.com/ncipollo/tix",
        :tag => "0.0.2"

    depends_on "go" => :build
    depends_on "make" => :build

    def install
        ENV["GOPATH"] = buildpath
        system "ls",  buildpath
        dir = buildpath/"src/github.com/ncipollo/tix"
        cd dir do
            system "pwd"
            system "make build"
        end
    end
end