Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D77C5B543
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 05:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AmfveYyUzz3HLoOz48JItt7Y3x48XLDOXgz/I8EFHUE=; b=xLVePSYK7LQftQennjj96GrW3+
	3z3CCq3Gym65LBfdsg5He5DBEeNKrrekoibqVvOHE0KOOjJYxtKsOLDc1tQJlZH4KytYrLdnLs+5E
	sHYkmPMT+Hdb8P1cmTVIVQftwkRblKFH4GygkWBCatxz+9XL7hKwTPLMEEAHD+kMnvYoeYA7fmBIt
	ap4GTNIB45vB9CDIBtsx8PgMsmIoc+b8Pf3Sl88ku91k3T7CA8nAgck0xwhjvYkYQBR9HiBsV6BHO
	HidBamrmt8ZT3tkbiaclPWdS0KuvZeirvJz15UcZde6iBRpo3DC3iGP8APRSAWfdGov4Gyy2U7aKz
	F5N/wLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3Ut-0000000Eme3-38dC;
	Thu, 05 Jun 2025 05:50:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3Uq-0000000EmcB-27GD
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 05:50:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GH3k4000678
	for <ath12k@lists.infradead.org>; Thu, 5 Jun 2025 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AmfveYyUzz3HLoOz48JItt7Y3x48XLDOXgz
	/I8EFHUE=; b=H0ghIfgRsFyiq6EKileOX5SCm5lEJ46ZyRyZutjksvrJp5Q2GrR
	7liN8/fLzJpDNabJjQsaQ5a3WOZUYvl8tVUczryLyTii78HN6jBfzCuKTzp5vmgH
	jIUdDKb+9cPHVGYrVxuEXWPlsblR23SKQcozM1GNWpM7BWyUGLWmUXFeEsPgN0T2
	rcOxRFbE5bmb5c3LLa4gEEHtZnLGQS4qevtfYFU/PRRamfZI4FhW89jac9FDUlbz
	75yVkrAxdb6vETrUHL117Xp1/M5lju2yORgobwpf1bMVb7oI2g+zGRZdv6sCXyRg
	MoKfz8BUgeUY+OZPlU4J7HGIyZcDWYtB7xA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q88tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 05:50:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2354ba59eb6so9098075ad.1
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 22:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102634; x=1749707434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmfveYyUzz3HLoOz48JItt7Y3x48XLDOXgz/I8EFHUE=;
        b=F4q1JCrVibinRgN+ZwMvvjKtF8m8y3WdbdhBpLgY3+x1B38sSgQDp6BTjenx8knqFW
         a+dQsXr35H4hwBK/QlsQZpnoBhQVDoAwNPX/Ywzr9ZXKgBCw3LR2v0qurT4yJmb39m9S
         iJ7JzQ1wQz8deWonfSpSxNuHg6VVzys3jiyLRFz5KsnY6AahQnc++BX2a3gufc0wk7yS
         BXS2gszf8bOwoX/M/rfPD3Uw6aVdutOpuAjqyDJhPm9uOr/L+PD0AnNKO7REnwfSlzhL
         aIyGbmxGeCl+P9Hkl/dvWATCKyhh7YBYkF57tMq89/Akwru3tuwLFbI9Rl9hkPxJzgV8
         9WDw==
X-Gm-Message-State: AOJu0YwmGtMtYa7ZlhFzXei8SfNhfQAEqwMIswit/HTl47FlciTSAqzZ
	qp2XQBYwhRJnub5Go2ooFKf3eCkaxePPJ7zJhrQ9xvpFY0bWSMm2AoMmaXsQ+TwLAKC4SBgACGC
	B7qFb7JZ0+UFfxKx395Ct4PlCYDX1bo7Mv6PkvuZq8ru4H+/7B2WKpsMfFpYCEmZIyo1u6f3d
X-Gm-Gg: ASbGncttGI2nPtaMsfYAt5ByE0jrV2VsJy2sq0nu+0u+FKik6hADBwX1+dLbQyudQHe
	mU7juFrIMMOpZRfLRRWmCKP8rTNFxiHTA1kVLR7buzamYd63+cHes0m15RyXwfy+erLrF3X2/Xh
	o3KUK+6Xu9DAh2vYB9hIXrb8CtZa3e9Y7n3IRGtUnmr4rqsyk04vdOMnokayeSoIk6ZdrMXTRtL
	/obBx6DQHdewisouASt5lPTktjps2+GhnLFa5Ld392kiM4lnnNAUxQh0Ioa60WQjoIhF1UqDBvk
	PFbuA6z2wkz087ggJiUilzkMNBbaVkKOgx33c3SjMcYDhbmcoBOe1LpQQ3ek+KxGhMAk+W8GjIS
	AZ2kypDuqIgwuraQKBoeeIO4351kDxw==
X-Received: by 2002:a17:902:d484:b0:234:f4da:7eef with SMTP id d9443c01a7336-235e122a9b8mr70067465ad.52.1749102633620;
        Wed, 04 Jun 2025 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAfaXDJywW3iDzWpFksbi0hvBeqtK6pVImfikKDuKXfpQ8khbucDl1XqnNpYxhWRhT0Kiyw==
X-Received: by 2002:a17:902:d484:b0:234:f4da:7eef with SMTP id d9443c01a7336-235e122a9b8mr70067235ad.52.1749102633222;
        Wed, 04 Jun 2025 22:50:33 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf539esm112561465ad.194.2025.06.04.22.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:50:32 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: remove monitor handling from ath12k_dp_rx_deliver_msdu()
Date: Thu,  5 Jun 2025 11:14:38 +0530
Message-Id: <20250605054438.1855365-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xDUVFdUjhIKQG1FCokcgvILJ67YJvsZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA1MCBTYWx0ZWRfX4U9UC/TfRtFC
 3HqS+Zlzs4Oa1BSq+JHbBNsuFVwu0KvyZ5r5PRl4iDWU8zD1D5m3XQha59jaVcHxvDADY4IQmTp
 9/utqtAFaJAwyJnn4rkjDls+FUdeovY42xPSI8FnVZn9nwcUblRKenJHz9s3kRJ0MU7gQ4q9qCn
 xpgxRpcdDcShNRVfq2a2PK0JcHRMVgW9rKkFE6bCCe+3zjjACQj1wtum2SVejvUib/m7rMOI87w
 6It2QI60IlgGDjbtmZ9FS6mfD0RaLHx5is/49YJZf3yimS/e2SlytoZOSkzbNd4FIyPM5ha9ryr
 30DMiR6+4KN6lWuSyucZtpYSqB7dh2CzVQgNI0wgn5GUCKD6POSSwdLk5CWU/+LsoxUqec+V2SF
 CzVM5itvF6uZH1PKpN6WlNzWLGA3APLb5zvps6qPeFUQdFI/BCSt8yxpfxCPpD8gHQstuLFq
X-Proofpoint-ORIG-GUID: xDUVFdUjhIKQG1FCokcgvILJ67YJvsZ2
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6841302b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VBHITUC6nVLiB0tyTDQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_225036_739018_E5895075 
X-CRM114-Status: GOOD (  13.19  )
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

ath12k_dp_rx_deliver_msdu() currently includes logic related to
monitor mode handling. This code was inherited from the ath11k driver,
where a single rx handler was used for both regular and monitor mode
packets. In ath12k, however, monitor mode packets are handled separately
via ath12k_dp_mon_rx_deliver_msdu(), which contains all the necessary
monitor-specific logic. Therefore, monitor-related checks and operations
in ath12k_dp_rx_deliver_msdu() are no longer needed. Remove this dead code
to simplify the rx path and avoid unnecessary per-packet checks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 7e1a8f29c7b6..490ad1cc81d1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2533,31 +2533,15 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 				      struct ath12k_dp_rx_info *rx_info)
 {
 	struct ath12k_base *ab = ar->ab;
-	static const struct ieee80211_radiotap_he known = {
-		.data1 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_DATA_MCS_KNOWN |
-				     IEEE80211_RADIOTAP_HE_DATA1_BW_RU_ALLOC_KNOWN),
-		.data2 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA2_GI_KNOWN),
-	};
-	struct ieee80211_radiotap_he *he;
 	struct ieee80211_rx_status *rx_status;
 	struct ieee80211_sta *pubsta;
 	struct ath12k_peer *peer;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	struct ieee80211_rx_status *status = rx_info->rx_status;
-	u8 decap = DP_RX_DECAP_TYPE_RAW;
+	u8 decap = rx_info->decap_type;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
 
-	if (status->encoding == RX_ENC_HE && !(status->flag & RX_FLAG_RADIOTAP_HE) &&
-	    !(status->flag & RX_FLAG_SKIP_MONITOR)) {
-		he = skb_push(msdu, sizeof(known));
-		memcpy(he, &known, sizeof(known));
-		status->flag |= RX_FLAG_RADIOTAP_HE;
-	}
-
-	if (!(status->flag & RX_FLAG_ONLY_MONITOR))
-		decap = rx_info->decap_type;
-
 	spin_lock_bh(&ab->base_lock);
 	peer = ath12k_dp_rx_h_find_peer(ab, msdu, rx_info);
 

base-commit: 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21
-- 
2.34.1


