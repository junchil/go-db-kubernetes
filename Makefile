COMMON_FOLDERS		= util

coverage:
	chmod +x scripts/test-with-coverage.sh
	./scripts/test-with-coverage.sh 10

check-tidy:
	go mod tidy && git --no-pager diff HEAD && test -z "$$(git status --porcelain)"

common-deps: depend-aws-cli

depend-aws-cli:
	@echo "Installing aws-cli"
	pip install --user awscli
	aws configure set aws_access_key_id "$(AWS_ACCESS_KEY_ID)" --profile AWS_STEVE
	aws configure set aws_secret_access_key "$(AWS_SECRET_ACCESS_KEY)" --profile AWS_STEVE

common-depend:
	@GO111MODULE=on; \
	set -e ; \
	for folder in $(COMMON_FOLDERS); do \
		cd $$folder; \
		go get ./...; \
		cd ..; \
	done

common-test:
	@GO111MODULE=on; \
	set -e ; \
	for folder in $(COMMON_FOLDERS); do \
		cd $$folder; \
		go test .; \
		cd ..; \
	done	