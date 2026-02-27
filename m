Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721CFD9E3A
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 04:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ucnwCOp6De/roXp3UDRPA3fB1Exa4pLU72xSjX0GZwg=; b=v0LnKUQKWKAyVGrFFd0G/SpBuh
	sIKsrLbIPkAd/pbMvi1ePiW1Jc31Y7bO3rZZJgFFGr+iqh2oFuwj5GeGkWa8wsbsDWrEk/8jKBLzO
	jhyOtzWa5gvR5wwffAo3niZ2n0gsSBS9OV3rHWGp8Q6L/3ihDJR6bS64tY0iwdiXV8IbacjDicgd5
	9KHs66j3Fa4r2RJTKRldXO85A7HB1FxDV8CGVKT6SAf+8IFCQ1dGsEekoS44ZOHG9pZt74ZNSguEl
	v+QIsADwht/4/LQSl3J8uHMJLWH3PXxPf6HJmoB52FfXuZ2hQo6+EuMjLQ/REE7eiXLA5q6ETCF/u
	iqBfuQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpMU-00000007ePc-0puM;
	Fri, 27 Feb 2026 04:21:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpMR-00000007ePE-2q7B
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 04:21:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K2Hk1874148
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 04:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ucnwCOp6De/roXp3UDRPA3fB1Exa4pLU72x
	SjX0GZwg=; b=HXPbOW/ES15KXopwzYWlcYV/hEtXaAN9qOczNpu1ANa5Da+DmJo
	i4wowYcrP2fL/45ppNP7GjbFmzEz2C/0UmwoHL26w7h1J/junBsawStI3jNoFSIH
	a+16AcEdLizp2TPDj6MjgMUTlJoZAQ/+1pU+42cRWD5zs57TUd8kyJkISPQ09foo
	1dMc96e1yghWqk5wtVurLprYrS6md4m1xaKKhw+EJlWrrnUq0DIKBh+TPNll/lRp
	ruN6tP1NAcRU47JVvo+1KkpNthZ0oHSFF4zxhH90R16+KM3hv7dEVanUvKIuP/xf
	0Yh6tpJV8QP0T+bejtNzczOGX6FT1D0Kd1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytsgdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 04:21:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adca7aba8bso13850395ad.0
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 20:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772166112; x=1772770912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucnwCOp6De/roXp3UDRPA3fB1Exa4pLU72xSjX0GZwg=;
        b=faEN4PHbxxissVurmPpg9FT4x+NFhs4QZ4G2wbadeZzVqc46y9zQRYBVCErSCzWRcZ
         HlIkBLuEHKTzNNTJItNO8bn1PwUie0BZG+ceA28UygBiX5ZXnPcQZkAhxNa3qVPjyB4t
         a4TZ+fClCpiLDKOBdWMy5M4kMQzFeG2T4BLCzbIo4d84K9TbUrlEvu1urUxO9VUwpRAB
         iPGr4JbhxzL5wgApnYMbVQy1rDNkEpNHLWMF1Yv631d8b8Fw6/XpktuM9pR3wOKCkmjD
         osRHmsy1nfXcAB2S1GczSsmm07G8Z5dov4rPUDG+TeUv0kJ5zetnlubtzZE2u4bMoGbo
         kzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772166112; x=1772770912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucnwCOp6De/roXp3UDRPA3fB1Exa4pLU72xSjX0GZwg=;
        b=iMV4TgROX1rMbeeFSHuxrXpDxdHcy/j01WEYjsVqD0mYNMBEwXUBr5a3rJIWigPfFB
         UrasTMI1nMGyJcjYtxoDd6H1WpQ87a8Wt2FXF+bGApZpFKJVLXO+7YCuZHWWBwXJlu4k
         J7AjJc7+MfssiFwndcVw9gh7umc6kAvAX1DpNqxh8OCiKblxgA+N7iGa3KGHPtaFAEc5
         3Ehy1fGZf1ATbdPUdHrnpQZc+4zNibZqXaiWWOC9zXJV90KVgkIdV5ORM0VZR9o63jaE
         GG0Y8AUjDwmuFIMwPd4VhuB1VP062L5LWyr9CG1+ZaG9pdmeghLHYpdqkEouyC6DDfkA
         bGZQ==
X-Gm-Message-State: AOJu0YwyKXJdkqtX14bY0BjJXRX/yo8YGEXSaxhxYTlZQ7oDsg6c0NTJ
	2YE/Zwd/k1hIm03XgZ6wIEpVBvjGSPA0w106pgg6v7SDG05zr0Cm9nXmmqm9AxcHhE2M8dhwLLV
	Kq8BLa5EovpzYCU0lUAR5PI3eL2VkAd7AVpaVPkqzHBJPSJtqjOM8wm8o5G/rVW5hUqEEqNbv
X-Gm-Gg: ATEYQzwoM1DQP6XxviGEmg7Lk2qLRpjhR+m9JvRb7apaQOyIReEyusgdXAWROZPzz49
	p2l9hnwkF2GWoasEmcMcMEGzc2JHJIEEXJWQIhnLpPK+AaVHm7jx4ViXsEKbyw4EESC8FCzYZnz
	mSJFfbyEMzrqfIPGeokNjCCOTa77cOMWZDXOU/MTvxOisJeHAp/kVuEFyfg4ywRrB+6o9h79y3r
	YSm3LJmUsnualeWW2frSKQ8/sHvzkJHgrXOojV7PxqxPQFoyodBED+/lhwX0noRvnt+gU6idFcE
	luaH2GpsbUmGh1Cwy0wrnmZeaiqiPMiBZdDDQtn31dKrkH/egem29+EaxF8vhzGJg+ON/rrFMVI
	klhIUcPt9ffAgNQUIfsQsTWlWyK/EEQO90SCUAMTnjLgSpkFrNSnkn7THwbcEdivGuqJd3/di5B
	GmCCivg/fwGKjeZ4afFSV/VAuJT6Au/oKr9lDXD0uHG70fsLkxlhy/uT4=
X-Received: by 2002:a17:902:d485:b0:2a8:f8bd:bb72 with SMTP id d9443c01a7336-2ae2e4d7357mr14002985ad.50.1772166111832;
        Thu, 26 Feb 2026 20:21:51 -0800 (PST)
X-Received: by 2002:a17:902:d485:b0:2a8:f8bd:bb72 with SMTP id d9443c01a7336-2ae2e4d7357mr14002685ad.50.1772166111284;
        Thu, 26 Feb 2026 20:21:51 -0800 (PST)
Received: from hu-periyasa-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1af1sm56791735ad.27.2026.02.26.20.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:21:50 -0800 (PST)
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Remove the unused argument from the Rx data path
Date: Fri, 27 Feb 2026 09:51:28 +0530
Message-Id: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a11be1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=wAaFTtMVbGzhZbg6bA8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: XwSll-e3OvnMwcYdUxSdAe2LbvcORQVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAzMCBTYWx0ZWRfX2nUaXWPLcYKZ
 x3miqlPmLpOSm6UsIBM+9zP7NqFWL5UdS7S3zkKFV+I67zuezAtOgcokiAuMxm8OCkD9ye/jq7c
 qKKrWnAPOtublKG3wdQ5CYxiIn6SSZpd2hzXUENdrZHCkyDMBYX/P+h2oKTw49ybiniEb/JwPjS
 xbZNbslJBVN7lUcJZZVQsx1kNHH5V0fiS9CMwt18WQCLTrh7ixK1iztBTYMjFXuocXRFVFaqTq3
 nR+pqRODCBsrVufZT2vahjnXqiIT+6Hy1+5ZNbqVwdxYdzTz4EsodsqSgvGJHYoF5mXsPaRcoG6
 1wpQBEIieECINyMTNpqipXbd8bSNolt2rn6QmzpbDBrnzH26kNvKZoeKHuYeszgCmQstB6a+iF2
 Aj6s+/N2wrCOnFQmQAJ4VX1eV4fE6eLKbTMGQv5lL2+v399onNYl0h+gP0f9tkmCJgvu7Cg94mJ
 +9KDq30jwPyeQLf2Wqg==
X-Proofpoint-GUID: XwSll-e3OvnMwcYdUxSdAe2LbvcORQVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_202156_011458_29ED041A 
X-CRM114-Status: GOOD (  12.65  )
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

Currently, the Rx path uses new infrastructure to extract the required HAL
parameters. Consequently, the HAL Rx descriptor argument is no longer
needed in the following helper functions. Remove the unused argument from
the following helper functions.

ath12k_dp_rx_h_undecap()
ath12k_dp_rx_check_nwifi_hdr_len_valid()
ath12k_wifi7_dp_rx_h_mpdu()

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 --
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  2 --
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 25 ++++++++-----------
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a32ee9f8061a..c0e2b2c1a292 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1117,7 +1117,6 @@ static void ath12k_dp_rx_h_undecap_eth(struct ath12k_pdev_dp *dp_pdev,
 }
 
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    struct hal_rx_desc *rx_desc,
 			    enum hal_encrypt_type enctype,
 			    bool decrypted,
 			    struct hal_rx_desc_data *rx_info)
@@ -1393,7 +1392,6 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 EXPORT_SYMBOL(ath12k_dp_rx_deliver_msdu);
 
 bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_dp *dp,
-					    struct hal_rx_desc *rx_desc,
 					    struct sk_buff *msdu,
 					    struct hal_rx_desc_data *rx_info)
 {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 1ec5382f5995..bd62af0c80d4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -189,7 +189,6 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 }
 
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    struct hal_rx_desc *rx_desc,
 			    enum hal_encrypt_type enctype,
 			    bool decrypted,
 			    struct hal_rx_desc_data *rx_info);
@@ -197,7 +196,6 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 			       struct sk_buff *msdu,
 			       struct hal_rx_desc_data *rx_info);
 bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_dp *dp,
-					    struct hal_rx_desc *rx_desc,
 					    struct sk_buff *msdu,
 					    struct hal_rx_desc_data *rx_info);
 u64 ath12k_dp_rx_h_get_pn(struct ath12k_dp *dp, struct sk_buff *skb);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 7450938adf65..77a1679b41df 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -325,7 +325,6 @@ static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 
 static void ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 				      struct sk_buff *msdu,
-				      struct hal_rx_desc *rx_desc,
 				      struct hal_rx_desc_data *rx_info)
 {
 	struct ath12k_skb_rxcb *rxcb;
@@ -388,8 +387,7 @@ static void ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_wifi7_dp_rx_h_csum_offload(msdu, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, rx_desc,
-			       enctype, is_decrypted, rx_info);
+	ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted, rx_info);
 
 	if (!is_decrypted || rx_info->is_mcbc)
 		return;
@@ -549,14 +547,14 @@ static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
 		}
 	}
 
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, rx_desc, msdu,
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
 							     rx_info))) {
 		ret = -EINVAL;
 		goto free_out;
 	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_desc, rx_info);
+	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
 
 	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -1030,13 +1028,13 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
 	skb_pull(msdu, hal_rx_desc_sz);
 
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, rx_desc, msdu,
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
 							     rx_info)))
 		return -EINVAL;
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, rx_desc,
-			       HAL_ENCRYPT_TYPE_TKIP_MIC, true, rx_info);
+	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
+			       rx_info);
 	ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
 	return -EINVAL;
 }
@@ -1588,7 +1586,6 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_base *ab = dp->ab;
 	u16 msdu_len = rx_info->msdu_len;
-	struct hal_rx_desc *desc = (struct hal_rx_desc *)msdu->data;
 	u8 l3pad_bytes = rx_info->l3_pad_bytes;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	u32 hal_rx_desc_sz = dp->ab->hal.hal_desc_sz;
@@ -1632,11 +1629,11 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
 		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 	}
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, desc, msdu, rx_info)))
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info)))
 		return -EINVAL;
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, desc, rx_info);
+	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
 
 	rxcb->tid = rx_info->tid;
 
@@ -1673,7 +1670,7 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, desc, msdu, rx_info)))
+	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info)))
 		return true;
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
@@ -1681,8 +1678,8 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
 				     RX_FLAG_DECRYPTED);
 
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, desc,
-			       HAL_ENCRYPT_TYPE_TKIP_MIC, false, rx_info);
+	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, false,
+			       rx_info);
 	return false;
 }
 

base-commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27
-- 
2.34.1


