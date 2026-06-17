Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADFFCD98E4
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSak0jodye9DT19wcndZhT/vwP96YD4tBwkMu/o3Guc=; b=3OtGkmiHREyNE+eYe4Bt7b7cQJ
	QY6sc+i43JaEsESI+gelTu75JGBay59FfbQuLIHXtZFJaeoOqo4p4yVbs0UsgMmy0+dKyCD5Mfc27
	pPFdRfdeInsWxOb7dBQrg3VESmIfQSShnkrU+BEigAFo+Jf4bpI14KKOTbRV5d6VWqqS1oh94o0eh
	G7jjsKGHiFGjT9ih8mySnmn45FPQDUYwSRDXdfY9UBzFhDHaDSo9NKrilSE6siyKMADNoFRvrguJB
	3MjwO5C8JBCfIJs0sQvo2+kTIj6C/zxqaF6mCghs9fZj4WyVMjl74NsKD0MPOpkALuwbg+wyiNESb
	EbVU5gYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnME-0000000H2Uj-0jUm;
	Wed, 17 Jun 2026 10:18:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnMA-0000000H2U2-1kc2
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 10:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781691526;
	bh=XSftta7fHJx6mk6tjJNVdt7VHB+luyNdyoyg1fMlXv8=;
	h=From:Date:Subject:To:Cc:From;
	b=RMA3OLw+Ru5OHQu+2Gt3MOJiYo5zvfY9pYKkYP3HnuvwmD5sLVKi31uffhvZyhMUN
	 PV/fz2csGhlfqXEnuqio1uNU66cCbmQrIvVo6Z/++gXDnzA1C/rWVIewpcHTkigmBI
	 w2JXxhrXEqps7reEINS9wDVu6eq9FveT0HQ95c/Qbg2/rTSu9P7wC14gMir8i1zNCo
	 Yp0++WNtLV215Uh9r4zDJuhtiRAn/QuIENz4q3ww83Qr4UhqsoHkR0t1YJ50a4QS9D
	 zWlw97IU9D4DNd3HNskF9/T797oECBOQc2/c3hpVtZx7SQ6zaibZ9k2LOWpuWml63g
	 JS0a74Bys8T/w==
Received: from [192.168.1.156] (unknown [100.64.1.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FD6617E0920;
	Wed, 17 Jun 2026 12:18:45 +0200 (CEST)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Wed, 17 Jun 2026 11:18:39 +0100
Subject: [PATCH] wifi: ath12k: fix survey indexing across bands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ath12-survey-band-fix-v1-1-e7d9555bb478@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6DMAxF0a0gj2uJhE9Kt4IYJGDAHaRVHBAIs
 femMDxPevcAocAk8MoOCLSy8McnqEcG/Wz9RMhDMuhc13mtDNo4K42yhJV2dNYPOPKGpavIPCv
 TFKaB9P0GSvPVbbvbsrg39fEfg/P8AbAFAG55AAAA
X-Change-ID: 20260617-ath12-survey-band-fix-4b5e78579379
To: Jeff Johnson <jjohnson@kernel.org>, 
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, 
 Baochen Qiang <quic_bqiang@quicinc.com>, 
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 P Praneesh <quic_ppranees@quicinc.com>, 
 Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_031850_622452_9D206770 
X-CRM114-Status: UNSURE (   8.61  )
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

When running 'iw dev wlan0 survey dump' the values for the channel busy
time have the same sequence across bands. This is caused by indexing
into the ath12k survey array using a band-local index rather than the
global index passed by mac80211. This results in surveys for 5 GHz and 6
GHz channels returning values from 2.4 GHz slots, making the survey
unusable on those bands.

Fix by indexing into ar->survey[] using the original index passed by
mac80211.

Band busy-times Before this fix:

2.4 GHz: 9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
5 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
6 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5

After this fix, times are independent:

2.4 GHz: 23, 5,  5,  12, 2,   12,  26,  5,   3,  1,  27
5 GHz:   30, 40, 29, 27, 118, 118, 112, 120, 11, 11, 11
6 GHz:   1,  0,  0,  0,  0,   0,   0,   0,   0,  0,  1

Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2cff9485c95a..9474d7e70823 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13351,6 +13351,7 @@ int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	struct ath12k *ar;
 	struct ieee80211_supported_band *sband;
 	struct survey_info *ar_survey;
+	int survey_index = idx;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
@@ -13385,7 +13386,7 @@ int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 		return -ENOENT;
 	}
 
-	ar_survey = &ar->survey[idx];
+	ar_survey = &ar->survey[survey_index];
 
 	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
 

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260617-ath12-survey-band-fix-4b5e78579379

Best regards,
--  
Matt


