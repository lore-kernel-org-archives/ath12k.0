Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547260A380D
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9EJiIbS;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gM2u30iS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=; b=q9EJiIbS/Slitc
	vdS54puXStHGFUHXyDYQcMUi8m9cXjKwjGi+iL1wuNPCmvtuuvS4mkmMbIedE17HOPEFKVh8yxMWY
	oRvMXrANMglQwHHwPtvt//0//y8cNkFkD6NpAj3XWU4UjEGf6MdNYrGUROzt8mhdyhb/SaU2JI9Yz
	m7Cop/3Rnq6EUwaDZcFpRkiGbhJl+LAUFRvHFki/ikSjhbwQVgrm1ZmhX1dFqj2crz9QKNCd/15Ql
	EntWf8aT9Dx6peW8uK9VRi3G9oFcp3dgabDZtnqnbQ8+UA4jW/qWoDU3Y53RjihRmv42KzPSvtp36
	S/VA+rUy6WMWcE7E/NGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lh-00000005zFX-1Ai3;
	Wed, 11 Nov 2026 08:06:29 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Le-00000005zDZ-2Wpd
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso3201120a12.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384385; x=1794989185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=gM2u30iSAlFZ4v6yLK0PQhm6RSSFKPacNr+4QH7QHlsFtpFw01g71V58HxftWeRBKC
         TOtJQpXsI2kxrCfrARJerIQ5+XmFpkqz5Ixqe/yq34qSXotWapKJv8xTXxJ4cn7w4WPP
         Q4Fs8wC4KinK65LOMGGOotVKeKFWcEgNJGKJvtOJa19OOwjNmUT6Hw5BAO8kMx+KGm5K
         LnyPv3DG3ALa003H4/zczTeMYSh6detjyeBg9eavu6MB2hDY/cI5G35bnjhMNqzcGnsx
         PvU8NjBg60li5cx/5+aHp4o85kwbpPi4XDp5OLLx15ei0FbgI1ciClUfMcmY4gG/dIQh
         btFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384385; x=1794989185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW9QJPSFWXvk4TDdxTnmEns6NJG95v3o7EuXSqNcnZM=;
        b=hNZufXn3IUdCXSiV5AB69cFwHpZjPKQbMbPVXJVq4M544aS6g3iGAnTkf1d9zV2Ha5
         pvPeRvoclM0sWSsxeGl5N4TCBRYJ7pnwOzOsgHvzHxHJbkxZ0M8bER9RtIv00IIvYWPY
         0iZo34htO4qQww9Bt+1QKxOPGI35YUkqr+a9Ozyl0DXmcFCWd8Kjaci1twUN5SRGikKn
         S5GrdmfGGkkvlZwAYhUvVzUGpOLAWfhF9wyYuZ3qb9R6uq/MLv94Rd3TgkLDsMQ0uShE
         pPsP1aWZ9jnBYzgBBNJ5uJWvss3t/gksJce+IsUZewBw3H/giiPcBaekGUELPmp7zMAT
         bCGg==
X-Forwarded-Encrypted: i=1; AL+hErECtuUep1DXCY0I6ksofvYod5PgPqMpf6V8wCzAy4oONB5YYpn4+iLt970xZZ3CbtyKLd7ze90=@lists.infradead.org
X-Gm-Message-State: APuU4Z+zEqCQfmMxsZW7DTFkFuYj6BJDr6OzqHfu3vEll3uv5jtrx2Vi
	CGbtRWYYDrl53RDsJwbemKE+hcMWUB3C5dxbgJjFqDRT+dktLtJGNqpoZ0lZrp840g==
X-Gm-Gg: AYBFou3utGAvsSDwj4d0KLuUnfpoRTLydAzYKhNN2XD/PE/OF4oAEc/hyPrxcbZsnma
	Ut+Fo81gAmuEe7n0A6rO6FEPc3iNCvWuDqNpBwA35FsMwTMNjxi/jSpkx1kepNSeWg1mOagVeAq
	twuCHYdCiv8XMa/GctknpacysEL1PdSNZCGEOOMKX9eXGVFcP4SjK8WWyQPWnjuxgKpBZcUVUU3
	bj6OhFYtmPLJGtLvE68gkrHedlRzL6kuJSxzGx3RF1S+TxBGSmUu+JHYv9PDwyT0ZMqVnVbewN7
	prcC0lOKoA2laVdNtL/zV/y7dBVbFIT84LXFaLTk8J6pqW8uw9C+WGKeHvkz306IZrYfu/ITfaW
	0Y6Q7x1CQzAmbgHB1A+dRxHW9aCGkUg6K0mfbDkU8j9FMzmJoIG2SFBZghYSQJXH64eIpgaBoYX
	dLjEpa21g0P/axSPe+0zV28+1D7niwTHPhW+1V+LwncA+1dURxD4k2dj/PMnZ/n0IDy3xQCyT+D
	ErOAXXif+jHrSwobHQUrv+6p/rLWqbSNwp7aRXaC6lo47iRQUcTJQ0IILwzpl82LgUBkfYsJoG6
	H+YTYiCzFfN645xknP6A75Pgr/elaV1tZOWUJpBWEV41RpTS3fWknMiukI2j7RKkuDaKeyW22cj
	62I0PGIhJ+pNwaCgxqfQeTaJjMW/EFv77VtrXpH9nUvJAm5ujcFCMrP5lhbGDoyhT7iKVALTtXI
	n7LvE9PXMIJlrU5hIpq2JcS8CdZv2cFfeIsC5xoMjyk8ZLK6KPyxO/CJ7P9+3U3lzjwhRTtmoFj
	7lAfexW3vHQsOZtfVyamHGL9/6bdUjSAqrynJkB2k2G09sHLoodthgFWTkASc7Pyyy98Tk0EkSy
	96JVbYDCtrCV3gp94zc=
X-Received: by 2002:a05:6402:2b92:b0:6b3:c089:5806 with SMTP id 4fb4d7f45d1cf-6b777347cb0mr1310917a12.4.1794384384746;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
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
Subject: [PATCH ath-next 1/2] wifi: ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:19 +0100
Message-ID: <20261111080620.244164-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
References: <20261111080620.244164-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000626_659751_61CB567C 
X-CRM114-Status: GOOD (  10.65  )
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

ath12k_wifi7_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8a..56f0673d2b6d4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1030,6 +1030,11 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
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


