Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C4FC19776
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3QrVW6TwH9xFwBZFv/DZmk93f0848KDMZG173d60qw=; b=1w2LREo6bFHT64i1wm1I3u0gGN
	7N6mSecExLM8tnp3Y1vo/PUhTdF9KL+cieUB3e/pFT7EQPgKCfGXMYmQ7+cwbxS1aJPiQVmZ1i/Ne
	Y6D9XXHN0hUzKl9ghmTkuYhnS6e+cAbdPeCLLkKXEQr/1o34PdwafuWggo2ePSFmAGWHlYDaGgLYb
	ZKrevWw4nq/B5aICphCHASDZ2IpIdAKiq8leWVXsjOCd2h2XW6u9lDxcDnblN0iRD/plvKKR/gEfG
	1HWVLenBCJYo88joWoQp9sE4j0e1k5k4YfnTRvfTWIvBzZw05QGwInRJTXTLV8flX82fZgN0lJTAc
	8q04B8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzbe-0000000AvoT-0OK8
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 12:36:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzba-0000000Avmz-3AUI
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 12:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=a3QrVW6TwH9xFwBZFv/DZmk93f0848KDMZG173d60qw=;
	t=1740746198; x=1741955798; b=MFjHsmIQWLxzaEM6z6NCzFMYqzzjdyvofUThSWO/hH5Rn9j
	bTetdYFF+pX9W2t29IU/mEjkIA6FXKOUYtxZ7Pcd5vDZt98Pg2mHsicTb6iOlnuKSdol8a0MERBk1
	lpKzSC17BPnq+sAta7q4ibXHYuMumPdBOss+62ODNXpShzEtLOpS1wlmiDRcSp3/Dy66Mi202+/kU
	dy76LhTvj9dgXr3j4062baOSHZBMR6uAVpE68eMjGYJfIf1LoLVOCzAhAyHzmotkgU0QfE/kLnwNO
	XhKMIFzQHDX+zVUYzOH42kqFDB6uSUxc3j7H/heUnTs4yuTJ14MIBMSczWUoF6eg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tnzbX-0000000DjCM-1oji;
	Fri, 28 Feb 2025 13:36:35 +0100
Message-ID: <cb41175353348bbc56791c3bb0c38a42ac4fc6d8.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: update EMLSR capabilities of ML
 Station
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, Ramasamy
 Kaliappan <quic_rkaliapp@quicinc.com>
Date: Fri, 28 Feb 2025 13:36:34 +0100
In-Reply-To: <20250117170416.2907530-4-quic_ramess@quicinc.com>
References: <20250117170416.2907530-1-quic_ramess@quicinc.com>
	 <20250117170416.2907530-4-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043638_790296_0BC8D5B6 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Fri, 2025-01-17 at 22:34 +0530, Rameshkumar Sundaram wrote:
>=20
> +static u32 ath12k_wmi_get_emlsr_pad_delay_us(u16 eml_cap)
> +{
> +	/* IEEE Std 802.11be-2024 Table 9-417i=E2=80=94Encoding of the EMLSR
> +	 * Padding Delay subfield.
> +	 */
> +	u32 pad_delay =3D u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_PADDING=
_DELAY);
> +	static const u32 pad_delay_us[EMLSR_PAD_DELAY_MAX] =3D {0, 32, 64, 128,=
 256};
> +
> +	if (pad_delay >=3D EMLSR_PAD_DELAY_MAX)
> +		return 0;
> +
> +	return pad_delay_us[pad_delay];
> +}
> +
> +static u32 ath12k_wmi_get_emlsr_trans_delay_us(u16 eml_cap)
> +{
> +	/* IEEE Std 802.11be-2024 Table 9-417j=E2=80=94Encoding of the EMLSR
> +	 * Transition Delay subfield.
> +	 */
> +	u32 trans_delay =3D u16_get_bits(eml_cap,
> +				       IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);
> +	static const u32 trans_delay_us[EMLSR_TRANS_DELAY_MAX] =3D {
> +		0, 16, 32, 64, 128, 256
> +	};
> +
> +	if (trans_delay >=3D EMLSR_TRANS_DELAY_MAX)
> +		return 0;
> +
> +	return trans_delay_us[trans_delay];
> +}
> +
> +static u32 ath12k_wmi_get_emlsr_trans_timeout_us(u16 eml_cap)
> +{
> +	/* IEEE Std 802.11be-2024 Table 9-417m=E2=80=94Encoding of the
> +	 * Transition Timeout subfield.
> +	 */
> +	u8 timeout =3D u16_get_bits(eml_cap, IEEE80211_EML_CAP_TRANSITION_TIMEO=
UT);
> +	static const u32 trans_timeout_us[EML_TRANS_TIMEOUT_MAX] =3D {
> +		0, 128, 256, 512,
> +		TU_TO_USEC(1),
> +		TU_TO_USEC((1U << 1)),
> +		TU_TO_USEC((1U << 2)),
> +		TU_TO_USEC((1U << 3)),
> +		TU_TO_USEC((1U << 4)),
> +		TU_TO_USEC((1U << 5)),
> +		TU_TO_USEC((1U << 6)),
> +	};
> +
> +	if (timeout >=3D EML_TRANS_TIMEOUT_MAX)
> +		return 0;
> +
> +	return trans_timeout_us[timeout];
> +}
>=20

Some of these should probably be in ieee80211.h, and also - making a
table of shifted values? That seems ... awkward at best?

static inline u32 ieee80211_emlsr_delay_in_us(u16 eml_cap)
{
	/* IEEE Std 802.11be-2024 Table 9-417j=E2=80=94Encoding of the EMLSR
	 * Transition Delay subfield.
	 */
	u32 trans_delay =3D u16_get_bits(eml_cap,
				       IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);


	/* invalid values also just use 0 */
	if (!trans_delay ||
	    trans_delay > IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
		return 0;

	return 16 * (1 << (trans_delay - 1));
}

seems a lot more effective?

johannes

