Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA9606A32C
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inN7msYY;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BGdo49j+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=; b=inN7msYYJeQDGq
	3dnOlfi+Kcpr4o5EvUrlEduWLpxUZeR2+fauYq4i1WvTEvSkItBakcxY5EU2nW5uosyP3IFeNNaw7
	W3qLtR7xntLlT9eK+nR3ERHvF0nJbpcweJjz7tBBKSwXd8sX0hHMst7W0+ZyWM8qMe5vea+mHj3EC
	ogtwet4/g/h2aWOcJcYztiFlHdD/IfFHKeJO/0xfqGhTW6bUvloWjjrbRPpAcUIndm8/qn/gWaW1X
	CIFqIYm5jSPqRU35ymUBTFcKd9IVHZUkB89u2VJidUd7nF78RIno3RsJIP8eWkFEffkN4L8Var3Z7
	9sJVquoa0LgQLcXES0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM88-0000000118i-2lGb;
	Sat, 28 Nov 2026 17:22:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM82-000000010ug-1pB9
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c51d158acc6so296179866b.0
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886544; x=1796491344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=BGdo49j+byzMEGyQBEyyQU8Kh98x6aiQJCWIwL3Z5rzU/H8LcM0I4DRXUc85esBgDQ
         Twn42KVmj2RiQrmiuG6p6sgWTVtIXFpT0nxfuF7J2WMm6ojYzWDSKRYAgpzjN/mIOg+W
         6ixbTVBxhGEhd2Rij4rZEV80D/+3d44zv6BXu+zC7wgU6M2YfBGpickHx8GmRF6KVlG3
         QSwCqD5VMir7ZjkZwXxcXJfZ+TmauHFLJhxBeHRkVAq1BReJcMnOvuiS3I9V4vQ0WN6z
         Ab+rBt//GgYnyEt4sZaYqq1fDlBlNg4KeypmdwPxZYh7VCNp8xmxXubDlAf0D4f6RtaS
         eV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886544; x=1796491344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=jrT+Q9YwdsxcVI2KhKMupM2dAOTNDAzFb2ORG8cDEHr+aVSsDkNJ0Abqh8CVOfZ+64
         aoLwz2700V1e6pnpCopbJf/PKOt2zKaWlGWWX/Ei4bXGFhGbLq23/Iouiu3xMu8pDGWT
         RSyIDUy6GJRmiC09y0R8A7OY4lH/h6H3+Ht2JA/kdAOzTdjSDMVm+2915HUxR6gBUyIK
         ++QvcZ/1MwTzJfM/Qs0UMeVKei4kPI56CCLJuFOCdIVXmHYQVHqk9zoS8uba85yZlEMc
         Ny8jHJI3kae3IwPvtCpKve1Voxg2dOJTMLTyDfJw2tGQ3NOFWMqUHNijnyUEEPoN8854
         ZjMg==
X-Forwarded-Encrypted: i=1; AL+hErEsRGudA0WALmu/jDLme5O3DcpI5zwubtbjM0L8htitl7vRNxydL/l4PC9NkgOB2u+DK+3L5dY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+w1wknMfTreKbfcudpmVfV0JHOLifXtYDnJX0ABsRX6y4o82dT
	BOBZB+d9AosjnSiD6QRy6O+R1NK7cPS0TCdb5WYpOJ/s9nHU1JM6oxEdC++V7n14yg==
X-Gm-Gg: AZFdTZdh3DZEVmMJK7/xSTPV2tWwO60iU5xFlsRtcZM7ACH3FyAFuBT9L+UipUCBt0l
	W4873cQ8rqOZx7PSmXCN/+lPuGULYXAsfmemla3cMqRjKQAeREOHXURT5CRZB0A3N/75kdphgft
	4l6SwA3CFid6fgQLsHm3KJosNdlem1Qi70CRdXRKbHwEev7VNMysG6SFvMQn2Jypavt7JygoUZE
	P+l4hlxxLO83sIytzcfDcIicBUaUnFCAkKMkc5WQiS67JV3muJ4WRXFVP9LB5Lba3WFMjYvy0ND
	8w4dRiX1eUtKff7Qpgf8LRCznjGq6rD3YTt38jpRbIBSUBQ+aspphezUlTajSg+gOPDvdy2mLp0
	kTZkNSBBnFuDjXXfQNi9aZXaGmfmkSZKLa3G6f0//2qGMhtUZ8AhNcEyZRSzUWATFW8c7bNZgiA
	Vdh0beLf01ejB3AJW+jNKiqG+2yzSivONSN57U5moo0SdhnxBaRF67wghjaZ3CS80oxV5QFq1sW
	wlxhejuxWHZhsIn4su2GkPr9MdU9MfJlUtp+W6cBX0yjZkownSFpT8d0IM7lXzWVdhfIGgQ8rib
	SYLmOPJEFm31FgK3eaH2dpVcTuu9Pnq3LsPbcDWvxDpPWDF+uPbhPMKx3P/s9EbK1Ik6Lh0syyT
	RZklzNLjCQS7OS0nDleeYV0KFM3UermLl8OMsmrmLlhvB/wLO0fMbrm8Kps3ql9pQ+RZbPZNW18
	Kf50OfVH6RYShB3XRT93UIr/C8Mvb2JzE3hQO0r0m2cgM37lFVlgbmmf4Gsdo5+1o/M7hTJBg2T
	EKPSroEt64SRcC89u1J8nsyQV8/kDhux3jQzDNzqtfktBjtbdibUkZZVmoeaJinHlYE3beMyncl
	4Ij8tq/TZGUmqQ==
X-Received: by 2002:a17:906:eb56:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c513aab5575mr1784407366b.40.1795886544488;
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
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
Subject: [PATCH ath-next v2 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:19 +0100
Message-ID: <20261128172220.922376-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092226_555567_1DC9C82D 
X-CRM114-Status: GOOD (  10.66  )
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

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fa591a03ecef..e37353445749 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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


