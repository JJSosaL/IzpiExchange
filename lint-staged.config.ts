import type { Configuration } from 'lint-staged';

export default {
	'**/*.dart': [
		'dart format',
		'dart fix --apply',
	],
} as Configuration;
