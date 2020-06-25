
coverage:
	chmod +x scripts/test-with-coverage.sh
	./scripts/test-with-coverage.sh 10

check-tidy:
	go mod tidy && git --no-pager diff HEAD && test -z "$$(git status --porcelain)"

common-deps: depend-aws-cli copy-ssh-public-key

depend-aws-cli:
	@echo "Installing aws-cli"
	pip install --user awscli
	aws configure set aws_access_key_id "$(AWS_ACCESS_KEY_ID)" --profile AWS_STEVE
	aws configure set aws_secret_access_key "$(AWS_SECRET_ACCESS_KEY)" --profile AWS_STEVE

copy-ssh-public-key:
	mv ssh-key/stevejc-ec2-test-key-pair.pub ~/.ssh/stevejc-ec2-test-key-pair.pub