import type { Configuration } from 'lint-staged';

export default {
	'**/*.{js,ts,json}': 'pnpm biome:write',
	'**/*.dart': [
		'dart format',
		'dart fix --apply',
	],
} as Configuration;
