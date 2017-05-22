#!/usr/bin/env ruby

require 'html-proofer'

HTMLProofer.check_directory('./_site', {
	:parallel => {
		:in_processes => 4,
	},
	:check_html => false,
	:cache => {
		:timeframe => '365d',
	},
	:url_ignore => [/scholar.google.com/, /www.linkedin.com/, /ng.2330.html/],
	:typhoeus => {
		:timeout => 60, # seconds
	},
	:verbose => true,
}).run
