env_file:="./.env"
gen-pass:
	@echo "generating passwords into env file"
	@echo "password=`openssl rand -base64 12 | tr --delete =`" > $(env_file)
	@echo 


