Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D70CCA46C
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvlsO4IkbfxIuqs+Ah0LND1CtNRV3rUqrYscG6HajvA=; b=OdBl0cbkg7ixvVK7Ms2bNn1adt
	OTVqcMZ++NkiYd1jK+E9/QsmsVoPk/55DvIno5AbLk5cHU9HT6aga6Ch+31m7VVxFDVlpqcCxQV2F
	wfNMVlwHqCjFqIaPv7WSer9EQGC+A8dGDM3tBiw6kTZPxv+B3YLU/C7EBarW6hvrj1n9+WD0WICqZ
	2NgmdeStc62ATj4JkzzrKCxdGEPqY7BbzUeKG1kFUvXsecig4RZHv5NKsj/qtmvTXIXV4CjM1J9/R
	GrdxBOSbMKWLXbFwfgOgV6Mkp3bLCC6ziyi95rH0mHh0i3TKsJrYdONipzoiFwSQHHZn4em/SYlV0
	C8aDDKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfw-00000003Fng-2FdM;
	Fri, 16 Oct 2026 15:16:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjft-00000003FmL-3tsc
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 15:16:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6D0J3006460
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvlsO4IkbfxIuqs+Ah0LND1CtNRV3rUqrYscG6HajvA=; b=ITMp8O85jJEpC9Df
	CAl586fG2YeQZ+PzTh8faDIaxaYu54lEIIMoDYpd+woxrht6W2eHDPZc81cnaW5S
	ZBLs1HkRExWq5KhYeW2mevy34Z+0oyP1k61NG5nl8TttLShchie6R2hQc6gUUZlP
	PT4Y2JGltvejd9JHyRP/HORYcPslMF0H8F1756sKfcw0h59eI098eqFpBx89vY3z
	GXrlhC5I91xPUvFGNW/QA/x0IoKj8/OrDpQ0igpUotgUgUoChyTUbSJ4ovqOTFtR
	TXHYmcplmnRGK629ArX06aRqfAxedyqd2KK6HiS6suVKHSNMcg0gumxX5pUbhC/y
	dYD6gQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa4at1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990885654b4so7854241.2
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792163808; x=1792768608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvlsO4IkbfxIuqs+Ah0LND1CtNRV3rUqrYscG6HajvA=;
        b=ZZPOF6UESZay7hB+dmq+UUjsVlgMDru1H7OHnrkfVlIF2V00o14QUIADMe4tStWBjG
         +i1OVi//BY5QB01CLU8yV23hutpBGtVYZNtwB0bHQgLEF2i/5iN4jLsRrXmJhDvSmDzt
         RZmmZ/Yu9Z00fY5lMgvCAoeGY5AhWX6aCBrw+AS0KJ1Y+RZa6m0ifZ/GYtXMsDEi0hwx
         J9pCCTmLLkonX9IqPizcEKrdn6iG40JT1ls6HD2FUxrJvqB8mucsL4ZNllUzMXmzndV4
         faWR6lrRlTh1B5xgIMkBEn7hiyu1c2IHZqfwJBDJmF5Ew8tJPNQZbSIw4vVfVOCuhzak
         ZyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163808; x=1792768608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvlsO4IkbfxIuqs+Ah0LND1CtNRV3rUqrYscG6HajvA=;
        b=xG3YRgl2rzdNi+Kf8eGpYOMIe9bu3yhLDMZ0s66MYui2u5NAdU65LYGq/BSILEB9FR
         hNpq1pZt6tv2W6C6kjA6wvuJvIxcjQvlvrwPwW0YwD00aQgM61zhUYMzeumQWYcrHC2K
         H0qKAfv23kD0qrRTseyFXuv3FMnkxZ5lAtAEdr9F6Mku9Kvioz9Ht280gYk9Jy7luzH0
         iaTenap4mRP8lrdekaJzAobmbYWi4kcfxl+tNULhisKFWuB/h8CIMsHOPj7IS9SqzxXH
         xireQmAmJKivWiKILTnEjRrXbsdLeSVV642wh6I7FpJfk0ycfZauPhlAqI662Y94o0Yl
         XCRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqT3ip+z4C/kz0XLurkOPL67LxRonr0irEg5SsNVUqHZhXfnxAEqWVqPcQh/e4UVqg70nW/HY=@lists.infradead.org
X-Gm-Message-State: AFq9FYK1N0ugv0bus+AAxdXDpR8G2k5qkOTjHlHInEq6bmsUy+Y/5IFx
	PiZPA7qBJug6COgQpiBdrKIg8GdGTo4Grn6IhQZrCyfJc5ND4ZZ5Bhu3bcONey4PRXLr481jker
	M40sBZ2piiszjQhPiLZLBie88o/GgQLBgVICXk2pxB6jCbjUMz0/PyyKc42KGBiVGq6bZrRgp
X-Gm-Gg: AYBFou0xUrucpOqnAVc5S+pkBLw37FI0nSRgQV9nqDSOesH2197VzceSKxnR2v5Cces
	//wOtCWmL1F5KO5ij9gIcqNvDazqQfNEpUYzTZLlW9qQWmomh6Hplbp4i3XbDg5Zh5M3LPWg9is
	D1s0IcZgEHp+dE6jgeZ+yIWpTzLZRoXQxrzG7ECQa8zFOj3Dg74zej5GtZk477E7iWYKwcs811A
	Ai+fPMUNfdOvKHuT3lU60fiMWfNK0Yx8lM/ihSERuWeU4lA6FJJQxdydyfndrwX6rE0mpGpIklQ
	rPCyUFQKtS+bixkXgYLu4BB2639tZdQ2MEdOODj5ecOAMWvsdoRB43uWurvTRJceFzOhr92KZ5H
	EfXXpnwfLwzSQ8Q==
X-Received: by 2002:a05:6102:418c:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7cb37506fb1mr5596445137.30.1792163807224;
        Fri, 16 Oct 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:a05:6102:418c:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7cb37506fb1mr5596393137.30.1792163805766;
        Fri, 16 Oct 2026 08:16:45 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa4sm24924245e9.2.2026.10.16.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:16:44 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:16:27 +0200
Subject: [PATCH ath-next 1/3] wifi: ath12k: validate RX frame length before
 undecapsulation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfXx0QtU1deDpP5
 9uVHd3RN9/EZeyXZ7EoYeIcQ6x9bgB09BNWEN1QBlr8SpP8ATd5wU9xb3zSHsWqEroWJmYpODD8
 wN0Zdj55dLxAXB4ebgXUuwHgqxQVfyg=
X-Proofpoint-ORIG-GUID: VhxAWssoOXNrCuzRMukZbm91YC5iL9a8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX49vcl8ePLZBK
 imrqR6eirgnns4AbEZGzC4JJYOlGXY/t+s+NSngQMWO7TXGsnvR0sTwYeB7mqDJtCaw5jgQaXjG
 +uiWNn6JSXnJ8KtTc8/Rus7nrpXTwkjqW8rKkFqbN2squLi86jU8/xK2EI0fhjaPefd/vcdQUgb
 gaY76U/C54U5N3QKwT8Fjaoqs/cVMYSPWdDvau8nSqDbwbBSX28oko/YfEhWEDWtelcd4+Hf6VJ
 6BWeZxTuuct0wJRLeru97naxdJ232yQNyLxSkRlMi8y8yFihnpIA/Wry6kNHr5NHsI4Fx8pZrXs
 Efmp344DQBSGYcyfJydDD+0n8H5b1bnYfCK0011+qnBE4xy7joZQ0Fq6wZgNq9U5japgDkyB/2b
 YPIaOhMpP1g1HmSNN6XJSu+S88RzkH65/2krC9HazLrhPJc1fKQS/BkIaizkoctzmAFlWKNOA+w
 L6I7J8rvwPZp6r3iG9g==
X-Proofpoint-GUID: VhxAWssoOXNrCuzRMukZbm91YC5iL9a8
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad23fe0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9DfpywYCbWix7F2gzjsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_081650_113218_D6411689 
X-CRM114-Status: GOOD (  16.24  )
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

Reject truncated raw frames before removing the FCS trailer. Without this
check, subtracting FCS_LEN from a shorter skb underflows and leaves the
FCS untrimmed.

Also verify that the frame contains enough data for the 802.11 header and
the crypto header before moving the header to make room for the crypto
parameters.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 46 ++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 +++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 +++++++++----
 3 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..40b8da34268f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct ath12k_pdev_dp *dp_pdev,
 	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
 }
 
-static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
-				       struct sk_buff *msdu,
-				       enum hal_encrypt_type enctype,
-				       struct ieee80211_rx_status *status,
-				       bool decrypted)
+static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
+				      struct sk_buff *msdu,
+				      enum hal_encrypt_type enctype,
+				      struct ieee80211_rx_status *status,
+				      bool decrypted)
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
@@ -1014,13 +1014,16 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
 		WARN_ON_ONCE(1);
-		return;
+		return 0;
 	}
 
+	if (msdu->len < FCS_LEN)
+		return -EINVAL;
+
 	skb_trim(msdu, msdu->len - FCS_LEN);
 
 	if (!decrypted)
-		return;
+		return 0;
 
 	hdr = (void *)msdu->data;
 
@@ -1054,9 +1057,14 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 		hdr_len = ieee80211_hdrlen(hdr->frame_control);
 		crypto_len = ath12k_dp_rx_crypto_param_len(dp_pdev, enctype);
 
+		if (msdu->len < hdr_len + crypto_len)
+			return -EINVAL;
+
 		memmove(msdu->data + crypto_len, msdu->data, hdr_len);
 		skb_pull(msdu, crypto_len);
 	}
+
+	return 0;
 }
 
 static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k_pdev_dp *dp_pdev,
@@ -1143,11 +1151,11 @@ static void ath12k_dp_rx_h_undecap_eth(struct ath12k_pdev_dp *dp_pdev,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer)
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer)
 {
 	enum ath12k_dp_rx_decap_type decap_type = rx_info->decap_type;
 	struct ethhdr *ehdr;
@@ -1156,10 +1164,16 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 	case DP_RX_DECAP_TYPE_NATIVE_WIFI:
 		ath12k_dp_rx_h_undecap_nwifi(dp_pdev, msdu, enctype, rx_info);
 		break;
-	case DP_RX_DECAP_TYPE_RAW:
-		ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype, rx_info->rx_status,
-					   decrypted);
+	case DP_RX_DECAP_TYPE_RAW: {
+		int err;
+
+		err = ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype,
+						 rx_info->rx_status,
+						 decrypted);
+		if (err)
+			return err;
 		break;
+	}
 	case DP_RX_DECAP_TYPE_ETHERNET2_DIX:
 		ehdr = (struct ethhdr *)msdu->data;
 
@@ -1201,6 +1215,8 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 		}
 		rx_info->rx_status->flag |= RX_FLAG_8023;
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(ath12k_dp_rx_h_undecap);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 82700474548a..68b80932e046 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -187,11 +187,11 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer);
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer);
 void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struct *napi,
 			       struct sk_buff *msdu,
 			       struct hal_rx_desc_data *rx_info);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..e7afadf2bf2c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,6 +344,7 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp_peer *peer;
 	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u32 err_bitmap = rx_info->err_bitmap;
+	int err;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "dp_rx_h_mpdu called without rcu lock");
@@ -409,8 +410,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_wifi7_dp_rx_h_csum_offload(msdu, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted, rx_info,
-			       peer);
+	err = ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted,
+				     rx_info, peer);
+	if (err)
+		return err;
 
 	if (!is_decrypted || rx_info->is_mcbc)
 		return 0;
@@ -1064,9 +1067,12 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
-			       rx_info, NULL);
-	ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	if (!ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				    true, rx_info, NULL))
+		ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	else
+		dev_kfree_skb_any(msdu);
+
 	return -EINVAL;
 }
 
@@ -1715,8 +1721,10 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
 				     RX_FLAG_DECRYPTED);
 
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, false,
-			       rx_info, NULL);
+	if (ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				   false, rx_info, NULL))
+		return true;
+
 	return false;
 }
 

-- 
2.56.0


