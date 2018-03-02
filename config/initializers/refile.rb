require "refile/s3"

aws = {
  access_key_id: 'AKIAIIJT5UZ57M455ERQ',
  secret_access_key: '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',
  region: "eu-west-1",
  bucket: 'ilnar',
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)