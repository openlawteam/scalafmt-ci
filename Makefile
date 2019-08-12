IMAGE = openlaw/scalafmt-ci
WORKDIR = /github/workspace
TESTDATA = .github/testdata

.PHONY: image test testfail testdata clean

image:
	docker build -t $(IMAGE) .

test:
	docker run --rm -it \
		-v "$$(pwd)/.github/testdata":$(WORKDIR) \
		-w=$(WORKDIR) \
		$(IMAGE) --exclude Bad.scala

testfail: ## expected failure, to see output
	docker run --rm -it \
		-v "$$(pwd)/.github/testdata":$(WORKDIR) \
		-w=$(WORKDIR) \
		$(IMAGE)

# generate the "good" version of the sample file
$(TESTDATA)/Good.scala: $(TESTDATA)/Bad.scala $(TESTDATA)/.scalafmt.conf
	docker run --rm -i \
		mrothy/scalafmt-native \
			--config $(TESTDATA)/.scalafmt.conf \
			--stdin --stdout \
	< $< > $@

testdata: $(TESTDATA)/Good.scala

clean:
	rm -rf $(TESTDATA)/Good.scala
