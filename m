Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CD606A335
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bk8JAvG1;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aABNvU3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=; b=Bk8JAvG1EFTFoS
	ieLqejkux8MWmLAgpFC5xNy0lOZZ55e8YcdsUv7BBOBecaC2XCFfJErOtEnRo30uILmCMRsxTV+bT
	uBakoxbELhwSYgiwx4aJPJ1wKNLgEB4p8YqOu8wKU8y9c6nRFcDwZj3wD0VjyjOaUvkYXYtTgiBse
	3st1Sk/iDy0AzLLd0XGwp6Vg4dH30K4v+yO9hEvVDpZ+w6udUUojIgHCkjAzWC0d9kVAOuelFLN01
	PdnP9xWgldHjcArqS4+YXckUFTZRcJCjA0/nk58aZJMsweiLoIDlf8k8XHHkRw3x9M0jCjcNxEROi
	mDg/I4iY9DX6I15Cn3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkl-00000001kxt-1x6O;
	Sun, 22 Nov 2026 21:05:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkg-00000001koV-0lYB
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c50e26763a4so486392066b.1
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381532; x=1795986332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=aABNvU3Wckla6ij77NpdGJ42uwlST+uJHY+kTA2oNGYBME80ukvmGVxj7/9ZG3tA1V
         ehShHubnLH0lRnEqW6FYeAanjQtYXZDYVJj3incLi+VTcnfiLP5vZPCbvLlglUxFq6gD
         mQ89gl3uFs0UoRoey5MwuMLsvAI5mm4/6qUviFvbv+KT8mNCyF51ClwWNt2mLrVC6scX
         lI9Lb7IF0a5InNR/EjLUXUm+4v0KeXH30LIDWX7gs3T1ZOC86D4E/HsANsXW0Q/32lkd
         RLV/s7rlEUIYFRKvgXCUZL5YHur/5v5RgppxhYnWNGrYRfEi6LyEIA0ucCBw0Zyidknn
         pk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381532; x=1795986332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=vjzgD8sf6aAlExlqAzr+FiwfxqQGkn8M5C+TLOvegA4Z706vj0o3airJ96dfaIcMIL
         vw0dYlwLTfieiQXv2HFa5xY7rJGzzVzH1GEOKORDqyapSehUfnFj1jXRcRYxjIOcTzsg
         m6Yfgh7MLq81w9cKyZZuQvhIz6kHKO1xXGeFwmrjnxMSRkEJ10cVyiNEADi3+rGa6Eck
         Gbau67jTeV9J0XrXiSuXLy+NSNHdTIsdvwM4UVpEOf4Ugk2kJ61LIgAzE3gMTIB2H+gf
         owjDTq5DAb0t/jXBYWJ2stqJ7APZ+bcBCR1wD0rhpvw1BiQwYx0Ko5z161m1zOilvxm8
         N0VA==
X-Forwarded-Encrypted: i=1; AL+hErEMLf11TIoTLux+0XEiGvrreKuAePTgl+WIl5lMaIDkSsSkMONvrjGEXaxTo++oXzgQZKXstyk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/v9aB3NFfqknXDPdfdaOGohoRpCRmmyxGySN1vhfLmCHCivq36
	Bca2oCmFh/1x4+oGvFYALaWAI7FO/IebsqnaMQN6/1ssXRBT42uMnirC9dAm3EycdQ==
X-Gm-Gg: AZFdTZf2zqrsA9Iku1mgDF9a0RPaVOsh3PD63mnH6tAxhpEmt4qraQmkryuV+4Ldcy1
	RirS3pPAdeDcRNDdZ9JAFrsTt23Nx52WtLEm2W/kdelulst08A+6IafIbl+I3hmgzf438MrIzez
	iqfZ+IoUDj9PS/4R8DnztI8DeN3bCMbDAbvbGhllmZCCZhM4y5GILHiGhVAVPKOVjcnHS46MnWi
	5l7TXmQ1DG0sQaARhsFbJq8JL6EJGRcwRFW+gDpYx9TS7H8Mv2Opj4qiReSZb5j9c5XExjYhIXN
	a6+YeRfA5q/Uyw+HvalndYE1Au+wWsqmI6t3BjzpoNxgezXVuLxvR6Q2ZrmIyjCo7wtsODN0DVe
	k+hyu74p56m5tEDc2Sm7VZjyff4/C1k9l+aLp+yvEGcD47g7aTMxSy5uU7irSOiJg9oFJN/VP+0
	RA75hVfwy+u6K+P+Vve2yAJvM+GMziiBVvwoANxtRNPAZkzEeLwODdEvc+pLUQFaz9acr129Bet
	iRdn2BKAb1Lu6F44H8QGPCg5XQa9DGqCcljHZXuHVQEkS55JeDeVMtWYmPWr9a63piB/OQpJOT/
	DEU9AIYPUxpoGCCt5lbv3jUFlk2slG7l5HHYInf4DnCqKIQVwgnRmFQSnpA16kY0RZvLuiojIME
	FrMDFKXGNedvAi9qhrJmDgTX34qDMnKZA5W1ym83YfFmZAL3mgeM3NdhEPz6Sxdq6i9T2Veit0u
	jbKjj5yMPpq1bp6gWmYDNiW5Y6k/zxcrKclhNOYGcCeQQblVn25349XXd2OAFRdT+7uAnHODeYc
	LiaMLFASjoDNGDfg4SphG0YJOTYoqYAu7gqFYlO6ShvGYymC/z2kFKsYavZ+xbgOrhoFAPrtUqW
	MyZs4hpSQ30Y9cr/gyAZ4x0w77i3QjVCG//iGeg4GCo1uPGYc6Ts2cfrNRD3WKfTxLz3urdHsw=
	=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr894924966b.4.1795381532562;
        Sun, 22 Nov 2026 13:05:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:24 +0100
Message-ID: <20261122210525.2076058-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130534_300851_FF467066 
X-CRM114-Status: GOOD (  11.08  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_wifi7_dp_rx_process_received_packets() keeps one
ieee80211_rx_status for all MSDUs that a REO reap returns, and
ath12k_wifi7_dp_rx_h_mpdu() fills it for each of them. As in ath11k, it
clears RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED
of the MSDU before, but not RX_FLAG_MIC_STRIPPED, RX_FLAG_ICV_STRIPPED
and RX_FLAG_PN_VALIDATED, which it also sets for a decrypted MSDU.

ath12k_get_dot11_hdr_from_rx_desc() drops RX_FLAG_PN_VALIDATED from a
group-addressed MSDU that was decapped to Ethernet, but a decrypted
group-addressed MSDU in native Wi-Fi decap that follows a decrypted
unicast MSDU in one reap would reach mac80211 with
RX_FLAG_PN_VALIDATED, and ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key. Whether a reap holds such a pair depends, as in ath11k, on
whether the firmware delivers group-addressed MSDUs through the REO
destination ring.

Clear the three flags with the other per-MPDU flags.

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4a57d89669ab..fac60041d3ec 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -411,7 +411,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


