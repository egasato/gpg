# Copies the pre-commit hook to the ".git" directory
.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@
