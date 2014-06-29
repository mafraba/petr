S3DirectUpload.config do |c|
  c.access_key_id = "AKIAIU7UWD3DBK4T4DJA"
  c.secret_access_key = "KG5sfMJzdYDyYSAYRb5mVh3HcTxD6HVheHHGwRtx"
  c.bucket = "eu-petrescue-dev"
  c.region = nil             # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = "http://eu-petrescue-dev.s3.amazonaws.com/"
end
