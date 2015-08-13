#!/usr/bin/env ruby

require 'octokit'

repo = 'cockroachdb/cockroach'

client = Octokit::Client.new(:access_token => 'c981fcbe55b69ac611dc6e5b29865951e255a36f')
client.auto_paginate = true

%w(
  stargazers
  watchers
).each do |type|
  File.open(type, 'w') do |file|
    client.public_send(type, repo).map(&:login).each do |login|
      file << login << "\n"
    end
  end
end
