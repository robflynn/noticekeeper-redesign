NoticekeeperSettings = {
	credentials: {
		secret_key: Rails.application.credentials.dig(:noticekeeper, :credentials_secret_key),
		salt: Rails.application.credentials.dig(:noticekeeper, :credentials_salt)
	}
}
