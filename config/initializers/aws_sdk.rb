# aws_secret_file: path to *.yml file with AWS_ACCESS_KEY_ID and AWS_SECRET_KEY_ID if exist
aws_secret_file = Rails.configuration.service['aws_secret_file']
aws_region = Rails.configuration.service['aws_secret_file']

if aws_secret_file.nil? 
	credentials = Aws::InstanceProfileCredentials.new
	Aws.config.update({
   region: aws_region,
   credentials: credentials
  })
else
	creds = YAML.load(File.read(aws_secret_file))
	aws_creds = Aws::Credentials.new(
	 creds['aws_access_key'],
	 creds['aws_secret_key']
	)
	Aws.config.update(region: creds['aws_region'], credentials: aws_creds)
end