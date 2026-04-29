development:
	flutter run \
		--dart-define=USE_HTTPS=false \
		--dart-define=API_DOMAIN=localhost:3001

production:
	flutter build apk --release \
		--dart-define=USE_HTTPS=true \
		--dart-define=API_DOMAIN=izpiexchange.fancystudio.xyz
