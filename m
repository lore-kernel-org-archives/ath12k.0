Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF68C3ABDD
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 04:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awwojNaNrXyiw5s74gkw/0TBIsrjT+fryKobFxMVZAU=; b=vUE3dxQAFqBMzlotVDmLVQiy77
	MHCsMjnYL9L+3KFfl332ZQl//kZ+i4qfyAbf3K0qkT57KJjHqiZFVXwFbgieq1ma8Dt90vEHL8uaQ
	8noTiokuzb+4cvOnT3wUwIncBsOB2dLJLMdAEbSj6QuBnFtPLQpFmTIzp6Mo9ijpWkp5RcoHZ5Ghf
	KqmhXIkI2fjaDZwQMQI54Tsx3NSb9SYHTSUvpvdvUnCEZFWVclczY/RUua+17Hc65ezztP/BI4zTH
	mQc7roC5nhyi2LzyRXFPm93aP6CiCjZ87vzDDYoPBatafHjuKgaTWMV/sRXeSdAc39TCQJ1cXHYoT
	vjlMbzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEj1-0000000BV3z-3uCG;
	Tue, 20 May 2025 04:37:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEiz-0000000BV2Z-0Nvb
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 04:37:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K3m2LW021268
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 04:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awwojNaNrXyiw5s74gkw/0
	TBIsrjT+fryKobFxMVZAU=; b=UAyPToM7bIn7t18+Iz095PGhXjCA7lT4yVZZzW
	mIzSvqJDSW/GVDg/r9EZLzZQrG1wfTuFXH3b+8oQu1MjsfEbtKjQXgNCpUTLf7eb
	YaUK9E3vMY9oGYKbEmF+Z40XqltkeML+OXNhQ5JUxP4CTxBWAFY7vGRGfFPoJgu8
	1c94a69Dn4RvMkenhYskSB5kDRwmvxBXlhNsb1L66zsYklsLqM5GBDZx1W26QJKC
	/ywxycnh0t9nhIrwEp5zF23Xx7CE0ruqU2XpYQ9BFIB4ubq846OZtGhPQiFFfnan
	l8ZXu7QiCG6dMDjYchnZyentvglgeIVDw+JAeY7nby4+lKTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vysrca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 04:37:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23206c06d29so16530985ad.0
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 21:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747715825; x=1748320625;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awwojNaNrXyiw5s74gkw/0TBIsrjT+fryKobFxMVZAU=;
        b=CXpsB0RwlO2ERuXxErZY3hX6MTKvGwWw/iEK65UKCnduszbsmMWH9ycvQph57kV8w/
         aV/jf7+45lEaKRcWxEJ73UOq2gG2701QZ/btTEsR5wrsoMPJ/OBK3h6a6gjj5kZh0DJ4
         zgzVHQOozIOHgAPWp5R2fjrqK2d0LTJkNkL20XGVmWJPHEKAm61+QUoWjpf3Do/Vulq/
         0USTvi3lMlqsrtVXkWrgPVe7RuFWhSmjANQFkMdDuh/jikYnUj5aJxdtqfO/6IQNwzmn
         j4razcA7WEKn4CBF546U5S/JwZUU81vWbHBl7+zyOLJgYbe0PJTXCvozhtgYh5IBTkqb
         TxFA==
X-Forwarded-Encrypted: i=1; AJvYcCUQbO4lgADz4X5/8fQNZnN05iqB3nO75vBIBglSRE65SpbF0ZbzFObF0/hLIHNXtG0qk+yhplo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJWLifEnpfbpWvuWKdh2YDWo/dkCNBn1c3LyVXIp9cfzYZ1+Po
	V4XypJ7HmzdZWL9Cpt6z4CnPeCUeRWz090mBkdHDuSvkLHDlQU6sehK6faQeskAIbeQgJY7WddW
	TYXEF3cKixUP1ihBHayPijdYmokn6GatxoI5mBb3JytDQH78Coi6trHWEmnkCsPrI
X-Gm-Gg: ASbGnctprZKMQawqJ+80jCkz+p5aVN2FvMtr5PNTlZ9vLMq/+A6yFYw2twX7QvzI01C
	PPa/Kt+Uuqo+/nSJa6sVi7d/i1JNmnarAEfYXsQACzCDg9/fhNYoyJkz1Bq3bU1shExF7xpURJi
	ZCtiKfgqr6EIHjt/bJ5qAGiYu6HYQk5wpE1VP9zu2CSEvFvwYBKTlMxWtaSrvL6jWvF6ZovRyZL
	fAqNYhrBcSTxN2BE2ALR8U5La4G9Bx9h2D4lG2AtXCBi25HiwJ7hKkIrNkwMD+DEb0kKjb/k1oQ
	M6+xJsO0+QP1LjIFEDziIWtr0CAUfqGGfaTIq9xx8+YIy1B/H75t7NgFsv+1Xms6DrBbRPEqW8l
	TqZxr790C7TpE5nK8S1fHebmqThhUgkFHH/SX
X-Received: by 2002:a17:903:41d0:b0:231:c86b:ff77 with SMTP id d9443c01a7336-231d43cd9b2mr208070485ad.26.1747715824845;
        Mon, 19 May 2025 21:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt7ORIP0yCt6qLypNPPfXeVFvBW/v9IliwSoKvZIBmJS5PZ+67wJGNjBRQ+fK3mLegQIqhhA==
X-Received: by 2002:a17:903:41d0:b0:231:c86b:ff77 with SMTP id d9443c01a7336-231d43cd9b2mr208070235ad.26.1747715824423;
        Mon, 19 May 2025 21:37:04 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adba91sm68395295ad.54.2025.05.19.21.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 21:37:03 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 20 May 2025 10:06:52 +0530
Subject: [PATCH ath-next] wifi: ath12k: fix mac pdev frequency range update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOMGLGgC/x2MUQ5AMBAFryL7rUnbILiKSNOy2J9iWyIRd1c+J
 2/e3BCQCQO02Q2MJwVafQKVZzAs1s8oaEwMWupSllqKiS4zMe6Gv9Uc22gjCj24unKFcqqpIH0
 3xiT+3Q5sXITHK0L/PC9CUJv1cQAAAA==
X-Change-ID: 20250520-fix_freq_range_update-2cb86b41b196
To: Jeff Johnson <jjohnson@kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682c06f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QKJL3u4FREtiCmV0lJIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzNSBTYWx0ZWRfX1fp4UGg/8R1R
 I4hZ6w+CooeJevXYjoYT0uhBleQreHM8qFXDHMtl93TTJkTv52SBYlEyV6DHxvuCCx9IRPhB36G
 aR4/OI4SMvv68FeevPDrZwk5+5e3iipOBlFZnuAO5jzW7iQJV0pdTKNey8Yya3BhCgQhWsnXBjo
 BooI74kMfi9D58oYBB70J7L19biTnqv+tS3QRYJAzzea+4IUFrXKloS0ZuWPdlA6zWl0QCIpdil
 dmhiEfFcoc1lAd9s56THCI4BldKqrYAHoDnxnq3+YIth/Dh8hNZx26bBxxqP9SYdxTaISUDo9Bn
 i73BjATQdvQet2IwquX5UE+XS+MA0+PZu80zOww6Q2QRiRjJwqA84d6ai7EfYlbBBgEYk45Cmpm
 lbpmwiYMRLUzpWIOlnhoxBiOSVPWar6Wb0geVXRFm4HjgjCMKBon5W1L5JEVMKk3WT8gtKAT
X-Proofpoint-ORIG-GUID: XhtYcDDTiPe30PC4X745wUxNs5pbM7Sd
X-Proofpoint-GUID: XhtYcDDTiPe30PC4X745wUxNs5pbM7Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_213709_259047_9024A590 
X-CRM114-Status: GOOD (  20.27  )
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

The current implementation of per-pdev frequency range updates assumes that
each pdev supports only a single band. As a result in ath12k_regd_update(),
bands are handled using an if-else structure, which limits updates to only
one of the band per pdev. This assumption does not hold for all chipsets.
For example, the WCN7850 supports multiple bands within a single pdev.

Hence to accommodate such cases, update the logic to account for all band
cases by handling each band in a separate if conditions instead of the
previous if-else structure.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++--
 drivers/net/wireless/ath/ath12k/reg.c | 56 +++++++++++++++++------------------
 2 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fa39537fa4ce8a4a2aad5aff87868aeaecd73565..64500b04675dbeb1cdf52b3fa77f4d831f43103e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11353,8 +11353,20 @@ void ath12k_mac_update_freq_range(struct ath12k *ar,
 	if (!(freq_low && freq_high))
 		return;
 
-	ar->freq_range.start_freq = MHZ_TO_KHZ(freq_low);
-	ar->freq_range.end_freq = MHZ_TO_KHZ(freq_high);
+	if (ar->freq_range.start_freq || ar->freq_range.end_freq) {
+		ar->freq_range.start_freq = min(ar->freq_range.start_freq,
+						MHZ_TO_KHZ(freq_low));
+		ar->freq_range.end_freq = max(ar->freq_range.end_freq,
+					      MHZ_TO_KHZ(freq_high));
+	} else {
+		ar->freq_range.start_freq = MHZ_TO_KHZ(freq_low);
+		ar->freq_range.end_freq = MHZ_TO_KHZ(freq_high);
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "mac pdev %u freq limit updated. New range %u->%u MHz\n",
+		   ar->pdev->pdev_id, KHZ_TO_MHZ(ar->freq_range.start_freq),
+		   KHZ_TO_MHZ(ar->freq_range.end_freq));
 }
 
 static void ath12k_mac_update_ch_list(struct ath12k *ar,
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 62936d518b1d767a198958150a13bb9ac8b73009..fb8b07c95355c4683c514c2d62624feafedcf1f3 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -265,8 +265,8 @@ static void ath12k_copy_regd(struct ieee80211_regdomain *regd_orig,
 
 int ath12k_regd_update(struct ath12k *ar, bool init)
 {
-	u32 phy_id, freq_low = 0, freq_high = 0, supported_bands, band;
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
+	u32 phy_id, freq_low, freq_high, supported_bands;
 	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
 	struct ieee80211_hw *hw = ah->hw;
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
@@ -276,45 +276,45 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 	ab = ar->ab;
 
 	supported_bands = ar->pdev->cap.supported_bands;
-	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
-		band = NL80211_BAND_2GHZ;
-	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
-		band = NL80211_BAND_5GHZ;
-	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
-		band = NL80211_BAND_6GHZ;
-	} else {
-		/* This condition is not expected.
-		 */
-		WARN_ON(1);
-		ret = -EINVAL;
-		goto err;
-	}
-
 	reg_cap = &ab->hal_reg_cap[ar->pdev_idx];
 
-	if (ab->hw_params->single_pdev_only && !ar->supports_6ghz) {
-		phy_id = ar->pdev->cap.band[band].phy_id;
-		reg_cap = &ab->hal_reg_cap[phy_id];
-	}
-
 	/* Possible that due to reg change, current limits for supported
-	 * frequency changed. Update that
+	 * frequency changed. Update it. As a first step, reset the
+	 * previous values and then compute and set the new values.
 	 */
+	ar->freq_range.start_freq = 0;
+	ar->freq_range.end_freq = 0;
+
 	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
+		if (ab->hw_params->single_pdev_only) {
+			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_CAP].phy_id;
+			reg_cap = &ab->hal_reg_cap[phy_id];
+		}
+
 		freq_low = max(reg_cap->low_2ghz_chan, ab->reg_freq_2ghz.start_freq);
 		freq_high = min(reg_cap->high_2ghz_chan, ab->reg_freq_2ghz.end_freq);
-	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
+
+		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
+	}
+
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
+		if (ab->hw_params->single_pdev_only) {
+			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_CAP].phy_id;
+			reg_cap = &ab->hal_reg_cap[phy_id];
+		}
+
 		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_5ghz.start_freq);
 		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
-	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
-		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_6ghz.start_freq);
-		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_6ghz.end_freq);
+
+		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 	}
 
-	ath12k_mac_update_freq_range(ar, freq_low, freq_high);
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
+		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_6ghz.start_freq);
+		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_6ghz.end_freq);
 
-	ath12k_dbg(ab, ATH12K_DBG_REG, "pdev %u reg updated freq limits %u->%u MHz\n",
-		   ar->pdev->pdev_id, freq_low, freq_high);
+		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
+	}
 
 	/* If one of the radios within ah has already updated the regd for
 	 * the wiphy, then avoid setting regd again

---
base-commit: 0b7122d5c6a84dd18d2ebffbcc46db835f24628f
change-id: 20250520-fix_freq_range_update-2cb86b41b196


