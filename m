Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5092C83F22
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 02:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAfqWAgTVp/NnDNsyZslnXqzroALmVm6Sk3ncdH7uvs=; b=w2bPLtAEumjGTWQmbQlwsb24/a
	QwyWlZmB6d5gPaBrdrsKUZ/5IAWn/UylC2GRdC4sHcaPoImoGurOH9jSKJXP0zOQg8xjp5WoEUR/K
	Tv3LOlL2jadM0KSc2h1hmlL8ZxhpUhxPpJCbgrqdDuXy0rYDJ+sMrxB880IIFb4bCdZyyRY99/LwQ
	aTORN+HirpXjhukOHYUhqQRZxOYPZEXZtqJgjhsu2+u3fMF68/6ttD4+1jiZRKL/sD1dTgMW+3uzC
	Hs0/TY6vPX5jpk4tL1LuWl91IBDveH0UqxBfWSQ75WEFFgu81Z54AhJ1Tq/POD+kQ6aF9CGZvkYZW
	bY9kQLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG2-0000000BZ9j-229y;
	Fri, 18 Jul 2025 02:55:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbFz-0000000BZ8R-1idm
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 02:55:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJoY8w020653
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=ZAfqWAgTVp/NnDNsyZslnXqzroALmVm6Sk3ncdH7uvs=; b=KZ
	Ah9+0kGR5mGrTpYUE6j1e5ZiHHHk2lvUeVPK3Dn6BAnYbm/toyDvUzbGr7Mdfh7+
	DQWVFQn3e3zu+0PUNWcfgLiLZmaS1XyAq1/Zh+AKWFt39KP2JbY2hYGLoPaE96bi
	19i8HSIdtM7Vv9EVYL+ZKelyn2JvgzdiNMIJ/WLRpuYn23UB6/jE5MpcRi+40NGm
	Z/AFp3JrI5Njbm69lST+3x0XLdZFBWqdCBR3l5BdfceCE75yXaS7p8igq9zIoMxI
	jyGOjXg0yPQK7+jBr4NZQkKRyqwMnA5f6b05CKKoOpm+2ThFVXjMVcvtyXW5cORg
	MPmqAvkUelC6IlPqYayw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpn07p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ea7007866so1564846b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807328; x=1753412128;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAfqWAgTVp/NnDNsyZslnXqzroALmVm6Sk3ncdH7uvs=;
        b=vJCliw1rdNjA+d9WgYvy6beEvtN7ilEf38VIV/VbtrxbQvoGmKPQa1RlcDKhTBSlZM
         AsWHkPX/F2yV7eFtWTu9kfbykL1X6F0wBH+LxdEghArc+pTE6Boc5xKfGROPxj0Q9zeF
         B+WaY+4HE4uXWhCthL32NhQLfjvkQ6mEWIsgWbCkHXH3PUmYU2d38IShpe2YQ/hFnPWp
         k907YKWgj/mcSY2b2cPmalZEZ9unjvkrWFN3v1LgP9rDroGCojzuZZ3/CvBE6WpdCyTs
         9ouJBcWzTJCOkls4KW+K+/KGYO/Z+KpXjCK+rqt9lSS457cfdKwvGou70dzVHJZ6KxD5
         aUhA==
X-Gm-Message-State: AOJu0Yx0UkgpRIOvPgjcJ5SiGa9ZdGpb/CIPeuUh9ehlaLWwWQnnfs+h
	EArLW5vMGiiWztZ56gqs0SLV+ZzSJs1mrG85e7K0SIWF048Zx3WLC44GhsTI7NRnahwfgb/vYLz
	17oiwEMwoXw5WH7N/9Eahqq0Zh3A0fsQ8XZF0Q/hoYb+gPiacoo6f+lFnQVassJaCXbbI3WKl
X-Gm-Gg: ASbGnctj4iDVazz2ysh3Q5C2MJODu4KGDdcQ7owgsrELSdCGGzaRgmhabi8Sjb5RCXF
	VJpd/7Ng/cnxyG4rBUznOkyrtAUb6CKodOqAWrQkfovqLTqKPV95twzwPpnkPJH6EAg02pNu2B7
	xu3zkWetdR+YMfGzJXCXAjGoh8TLasTKEOj6CNHPaZLtiHaS14PHum/tTRlwvDLduq0uR8jYsLx
	cRRxfz3USwp0IhWXThx2aNkhJ9oPimwLhPI4wCHDC72sBjoIpiqjTY1xD9VU6vn0c4yT6G1Z/ac
	QwlRapy+W18arycjyJAM7zAdUM3f8qdupAv79R/AQQ/NM/CrUsv1Xo95gY1I4Qw+OL1btEqiNWU
	1Z66M1UD8duAgNYaNoq7GGu05VVGeJOPxz7pWGVvhX54PSan2yzXOhNgCAGsqxgarcyKucf/JTA
	==
X-Received: by 2002:a05:6a00:2384:b0:73e:23be:11fc with SMTP id d2e1a72fcca58-75725088c14mr10625306b3a.22.1752807328404;
        Thu, 17 Jul 2025 19:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJaxGMSo85A75leA05HTzStwaZIG0R5PNPtoGxVpVxbJnlscIkYklP+7z+1XlAhEFv9TfflA==
X-Received: by 2002:a05:6a00:2384:b0:73e:23be:11fc with SMTP id d2e1a72fcca58-75725088c14mr10625277b3a.22.1752807327830;
        Thu, 17 Jul 2025 19:55:27 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68095sm255334b3a.139.2025.07.17.19.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:55:27 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/3] wifi: ath12k: Fix the handling of TX packets in Ethernet mode
Date: Fri, 18 Jul 2025 08:25:11 +0530
Message-Id: <20250718025513.32982-2-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyMSBTYWx0ZWRfX60OWIVN7KRU1
 pdG5zQPj7oivDPumIOHXTgQoB3GURmCLnk0W078gkLwZ4QVX8shllwSHwspU9PW/lYi6RyEWnv+
 IlHRowG+sxnOb6yDrixLaCd4JWJhPoJ8lznnhWCt34tupB1qwDbjCWCvtIDt1tpQi+7vsXM6FAV
 gJzpnGOKQstOWvcSYch91KyniciDVLJkBgufIlw8cZv8AZHLynnDaA23vJoif4uBzEooAnp5kvs
 IOppT3RH2nV7qQqBmL39ijcXiS4QEjHEuBI/F/JtZyR5qGHs704CuZJ5ZfxgpETQhrpvbl4GGBe
 90PDW3Q8abU84OLRj4WxW7WhC2+nOnBjrv+JnccVjWiOs3vpfwyvxG4fbVZRnOvtMv9Ox8JRbK6
 tSwEFDZr49tDYusDF0QqnrxSkD9c8XvYpv6vzIQKSzYhWCIFE/N5GfAp9mT/KuhWktNc0cjM
X-Proofpoint-GUID: zmi4YyxfvsWo_KopT2njCxrrA8pZmY2u
X-Proofpoint-ORIG-GUID: zmi4YyxfvsWo_KopT2njCxrrA8pZmY2u
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6879b7a1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vl7YvmKCL5Z24jtCxAEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_195531_456296_DBB3F9F5 
X-CRM114-Status: GOOD (  17.40  )
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

Currently, in the transmit (TX) direction, EAPOL, QoS NULL,
and multicast frames are sent in native Wi-Fi (802.11) format.
However, when the virtual interface is configured in Ethernet
mode, transmission fails for packets enqueued in native Wi-fi format.

To address this issue, the firmware should be instructed to
treat these packets as RAW type packets, ensuring proper
handling even when the interface operates in Ethernet mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 38 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 1fa37cda1046..e8d3bcc90a2d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -244,6 +244,8 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	bool msdu_ext_desc = false;
 	bool add_htt_metadata = false;
 	u32 iova_mask = ab->hw_params->iova_mask;
+	bool is_diff_encap = false;
+	bool is_null_frame = false;
 
 	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
 		return -ESHUTDOWN;
@@ -334,7 +336,19 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 	switch (ti.encap_type) {
 	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
-		ath12k_dp_tx_encap_nwifi(skb);
+		is_null_frame = ieee80211_is_nullfunc(hdr->frame_control);
+		if (ahvif->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
+			if (skb->protocol == cpu_to_be16(ETH_P_PAE) || is_null_frame)
+				is_diff_encap = true;
+
+			/* Firmware expects msdu ext descriptor for nwifi/raw packets
+			 * received in ETH mode. Without this, observed tx fail for
+			 * Multicast packets in ETH mode.
+			 */
+			msdu_ext_desc = true;
+		} else {
+			ath12k_dp_tx_encap_nwifi(skb);
+		}
 		break;
 	case HAL_TCL_ENCAP_TYPE_RAW:
 		if (!test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags)) {
@@ -378,15 +392,25 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		goto fail_remove_tx_buf;
 	}
 
-	if (!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
-	    !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
-	    !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
-	    ieee80211_has_protected(hdr->frame_control)) {
-		/* Add metadata for sw encrypted vlan group traffic */
+	if ((!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	     !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
+	     !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
+	     ieee80211_has_protected(hdr->frame_control)) ||
+	     is_diff_encap) {
+		/* Firmware is not expecting meta data for qos null
+		 * nwifi packet received in ETH encap mode.
+		 */
+		if (is_null_frame && msdu_ext_desc)
+			goto skip_htt_meta;
+
+		/* Add metadata for sw encrypted vlan group traffic
+		 * and EAPOL nwifi packet received in ETH encap mode.
+		 */
 		add_htt_metadata = true;
 		msdu_ext_desc = true;
-		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
 		ti.meta_data_flags |= HTT_TCL_META_DATA_VALID_HTT;
+skip_htt_meta:
+		ti.flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
 		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 42eb9e8e14d1..3a33eccc0d1d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8869,6 +8869,7 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 		is_dvlan = true;
 
 	if (!vif->valid_links || !is_mcast || is_dvlan ||
+	    (skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) ||
 	    test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags)) {
 		ret = ath12k_dp_tx(ar, arvif, skb, false, 0, is_mcast);
 		if (unlikely(ret)) {
-- 
2.17.1


