S3DirectUpload.config do |c|
  c.access_key_id = ""
  c.secret_access_key = ""
  c.bucket = "eu-petrescue-dev"
  c.region = nil             # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = "http://eu-petrescue-dev.s3.amazonaws.com/"
end
