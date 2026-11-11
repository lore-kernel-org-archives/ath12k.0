Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171C60A3804
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/GBo0yn;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=QLch8zTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=; b=Y/GBo0yn0klJj7
	pRM+m0c4fpYQShcgkorNaGgFs4o/RSw5zSQxdrvmmgTcWxhVnxrPfJDpTogTZIkkGMlUecFtLQ7PR
	X1zLdzIKMMiEm+4riEM2PZT5eyj2TJ0J/NkhGO/+mcLOqwd+eNzWASKqOdXJO6SFAbKia8/IWGP8I
	L0Nq54JYnk+RxK6EM3NUwtkW+4LqTSxEOQl2BO3zqdc1NyOOF/MoWSh4HLONXOetGYOqndtxCUl6w
	LWJ1uN2CRcvwOQP+wzftTC2ExepPT/UTddYfp9W9Vi1jC7hPV6Hyk/ueVHNYsnrGsuQ42Sssoc/eU
	8I2AAOfWzbbFhAQ6cElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Li-00000005zGi-1twB;
	Wed, 11 Nov 2026 08:06:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lg-00000005zEU-0NOu
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c5060a48ba9so152356866b.2
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384386; x=1794989186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=QLch8zTm/63OFq2IDuwr4ykEg0MEUK/8vd4xH5Qn4gK3aRqf/6Qi85+I3816owsoiz
         p9i57FIfoGEKs1Y/kKnTlbMuX3TimSK2CzFy40C5K0Ks77K7HCmmEj3lsDchkkdan+0J
         1KadHAUMw9VNijKkW9KRqj6mkepEh18t+y/slSCpwkWTMoNMO928zkxpQOloj23rsgKD
         9mauoRCvXZLeHj2QmXQPYaJ+FtIcWsjxkDCRgfTtNb+nUBE9eTcXzqnZzsANUCsGzyaS
         0khLC9zhWZQuWZTDPu3aBzCeWiPaNWc1IN6V8z/bOwtGLZXqspUofujcwv+cVpiJ/fOB
         29iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384386; x=1794989186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=f9j01Uj1svvHDqoTwbKl4R8qntlzYYpe2jshhBK6TQhkzdIyqghhjoyC5j5yesYLuw
         lPXTFShI8LhIID3t8UCr3PSvOwJaJWukP9xaKtHrRqIAY3Ga62YUvEms4n70RUJka4pO
         zvR7PFN7qW7dSv7AvC/iQuZvLrItS2WLzAasyaoUHI9scB0Mg47/Zm+7fjMl05m4a/Dr
         pbMGjwigwyt09153R3iKuWwaDniuLq8LjeExhYx7YOG8lB1fQtxnQ235Qr7O34293k44
         0RlZpGZZYdzK43yAe/jPL+H/HMW0pXplB6Ka5sFUHwXqO/OqWKzH/iFOaE0mLJe8eOtB
         i6pA==
X-Forwarded-Encrypted: i=1; AL+hErEDhgXkIBCdTUwdWJEWpivcigrSIJ+JyR36SaJI1z3wuQDzjrY7wMSrijakuz/N69/cIOad5fo=@lists.infradead.org
X-Gm-Message-State: APuU4Z81zp5BrpC1svJ7BUct0Lz+jH/tr4Gkn50ZKia0nAriMcm5W9jy
	8iHmVXnvt55xuAZE1G2wFfvoRSvER6BKwFMSWrxmm2K2yXFDEl4wTdi9h9ZmqQUSwg==
X-Gm-Gg: AYBFou1H7F/Po2oppwcz8dEyTbUxeT7yxvhhnLAhc0pjYxEiCcO66JMmav63+e48sZ/
	MdapKrTFb5wTQlWpPZNU0bVK3yc32SaCaqmT02i1HTRaA9qdS9U5Oo4ksCeptqCIlPyuFAzcYJP
	QdK55v7K87aJ881236aL0SKbaZgZYWsDR3Zsa1a3n8DpaCLdsMLMZqELltcl8rgTsgfc2TEFdiX
	CxVy1APPCGKiKGtYxdt3ZXy0jP9eXcc4EdQxyhfyh7whPVnJNzr2oPUMyPQ3qD4TxtGHkYN9plJ
	xLM1tJGmlHFCfSmShVcn4vsBKB+dJH5HGVrEYHjg0gfDm3VX+jalJ6ulNyuYgLd9bg+OhMpsj6y
	jUxuEDxGWVG1oqnvrP2w0mu4OKdweRqjmXbk4VifO2+jQKpx7rHG8+r43C+l6OTJ0sqhoj35jNh
	bIiFJma6nMMTsiWblkPOPyyeDumN5u5TGSCKsq8UYJ477tgCvRi7hIfDp6EOzQ6iuVL+XVNOYY2
	y6BePDxb6XEjc09P7p1TeMZJZebWHUwjWW9+s79DNEP4KAYzS04kfnL7dqwHYFd0NdeG0/CrJJo
	jqbHWXKcfHEVd+TT3bTCxGpPdwRNnA3/UKp27yLUAWP3iQuMCriQwKQoLjBK6tQeZFXXH8ZNHO8
	hNSpZxqxwotsyqNPGXI7XNGmDYTPVcyHLsrlhVZKWcfA3VpDgvBDcoDteHvTP2xyMHq0B+S5J6V
	nj/Xu6gmvBj5J/dFSBBDOYRze4Wr1hcB50MpPDjQ/Hb4MCuhFvGhvTubhmNyrDGDbrmbf7QyPMM
	GpjB6DdryaYDhy+jRxQZWLMvJLh92u6QVo7OVnd2lCzDn0ymkSzli7BXdiYudRGxqpORJXdwsxi
	aZ/Yb/bLX3lZXHU4LFc=
X-Received: by 2002:a17:907:3e0f:b0:c50:5275:fb97 with SMTP id a640c23a62f3a-c5066d70b41mr112406166b.47.1794384386217;
        Wed, 11 Nov 2026 00:06:26 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:25 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 2/2] wifi: ath11k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:20 +0100
Message-ID: <20261111080620.244164-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
References: <20261111080620.244164-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000628_173959_615B128F 
X-CRM114-Status: GOOD (  10.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..f77a45b7bf84a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3270,6 +3270,11 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
 	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
 	else
-- 
2.53.0


