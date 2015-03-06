### chef-server-images

This repository contains a Packer config to allow building of Chef Server images in various providers. Currently it has support for EC2, GCE, and Azure. 

## Dependencies

*	[chef-server-ingredient](https://github.com/opscode-cookbooks/chef-server-ingredient)
*	[chef-server-cluster](https://github.com/opscode-cookbooks/chef-server-cluster)
*	[packer-azuer plugin](https://github.com/MSOpenTech/packer-azure)
*	[Packer](http://packer.io)

## Setup

Various environment variable should be set to configure the credentials used for each provider:

*	AWS_ACCESS_KEY_ID - Your AWS Access Key
*	AWS_SECRET_ACCESS_KEY - Your AWS Secret Key
*	GCE_ACCOUNT_FILE - The JSON file downloaded from GCE when creating a service account
*	AZURE_PUBLISH_SETTINGS - Your Azure publish settings file

## Running

The config assumes you are using a Chef Server to store the required content. You need to update the `server_url`, `validation_client_name`, and `validation_key_path` for your Chef configuration.

To start a build, run:

```
packer build chef-server.json
```
To build only for certain providers, run:

```
packer build -only=<platform> chef-server.json
```

Where `<platform>` equals one of `googlecompute`, `amazon-ebs`, or `azure`.