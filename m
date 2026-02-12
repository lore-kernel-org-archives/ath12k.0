Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ED1EE36AF
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL+KtDcQa5YZPbZ+XfDdGWOzmh28HH26N59rjfwIUxk=; b=4E+ztbTpSAMp/tR1zjWc0MQGSU
	o8Gzg0nR2ikHXUSWjitx8XVnbzm7u0uOTFChaZGUpf6lRDhqxPLNS/Wuq+wyHjI0OLuPghD/gF5Dr
	WwENCcjXCKS8COTXUh80BFUnRmhCtapHmsJyWF7V+48JNILmayVpGL9kC1MwlSFQUWH6q8dG8nHB3
	oAmy8+XxnTiNGnqNooPgGpb+7q9uzTZi/du10mhNXcHmThp7vaTfAhxKlzZH8DZasG2uMGkNXQ4aT
	lJABdCyqqrfT1ebYAqEWjypgfJFE53sTrnIWdxrSRk1056EDlVBirRX6xk4EKkWzC6M2DnursXDgh
	MSUGA6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaQR-00000002R8u-40ir;
	Thu, 12 Feb 2026 17:24:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaQP-00000002R7C-2QcF
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:24:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGY3eJ053294
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RL+KtDcQa5Y
	ZPbZ+XfDdGWOzmh28HH26N59rjfwIUxk=; b=al16NpCvtg1lO9yGWZhi2NktsIw
	eL/KPBPiBLwriG8AXmuvofGoigv41eG0uoMm6AHWTPlULA3CBp0jeXqkDIRf9XaC
	vlBLfJt6wAtRX2QH2yMD0Y78cHEPYW0yUNolyuspjr/OJ7DxlkJE0us7lgn3hlLt
	GE1ms12xEHnMHguY02BpZnC277gItVh72J5OIQ61eQsUJiUWBfuStyzth8fFfGe5
	rJEO0ReuqBxjCylga+cViDit/pKpJ007d4xRMko3Kjgm2yLzTyc0edxJjZ/8Yh7T
	cbBlAd1lRUWmVambzBimKGL6Dxy1esxujC6s8sLjdUZ49T0iXm+wDA0VuxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9jgb86c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:24:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8f8c81d02so351425ad.2
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 09:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770917059; x=1771521859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL+KtDcQa5YZPbZ+XfDdGWOzmh28HH26N59rjfwIUxk=;
        b=dxEd9QsCe5ONHjUSLm4QZIMWXSSXa1gIRtWDa7nQN6oAByv5todWnTfTZmuXG93Pse
         BtN2MdX6zd9GJ7Jnh/2YPGjNrerx/RsTRY592zIwWAux0rVYuUPM4Ig2YNk4wy2Rin9U
         GOUa9rj8hGFoMkQIdFC7tO6mkkFkP/phpqnNAWffcppOLjtQnjnNX4M6qwmUwAFAZG0B
         JYzO8kt2Yxo/Z6UCd4tBNHXZxj70kxAmh4ei+tB80TR/ZF62qIeGYkkTAmmJSZPDogfM
         o1/cYCZVJiylkGINbQfIjI06tlkxy9G3rdChTAptCGiM470gi4X9Jq0CaUKeOs+XnomQ
         7eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770917059; x=1771521859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RL+KtDcQa5YZPbZ+XfDdGWOzmh28HH26N59rjfwIUxk=;
        b=MjTRmleurXldZJYa1qNSgRXTOIpNKZp2lB7G/q17bwLOLdpYrD3nYWvbmTjFbs9F/J
         APNF0sfkRatfRLo5Q9FLfbxc6mik/fSum8Gn7qd5HOzIBmI+aOCumxm4fAa+FNvjwo7/
         9GRg1dzQM5aRmmoTHHsv8Y5oWPw0UMM6pFUat1TkpEx5ocZSMoYD0f8EK+R14O9ck9Gm
         PIrzdtKwKyFRwSpQqZK0M/JSMh5CoFLXv0VPE5XD1dcHfi2VuPYdofnVtgNQ5xnOCmUA
         7qhK7G75XJlisDojeB1xUOI5wyoe3gUuCu2JQQft60LfKXXKmLnHk43vfBv2DqoSBQsX
         gt5w==
X-Forwarded-Encrypted: i=1; AJvYcCWd5xHGdkxZJVmyCjUV9eSUVzZLQecTj32xCFTDEVI4MLJ7aiGyiqGrZIQzzc/Df6mqe4EIxq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvZknpQzlrvnjdrVcV0DSPxX0dXAv4sYXLQPxfLq4+ezc8QOMC
	YmR6dBHftQFHNLK/M38+IeVe40c6bx+ize6pTszVZroQy2t2r+5zmGNfBq3yzbI91O5Ih9SQUU2
	ULI1ncSIH9hC+pLaGmkloNgpn9Q4jrgK7HAXS9rWPFyOW0usB46iiC6yuzfqgNVfR6yBb7bO4
X-Gm-Gg: AZuq6aIj7S+uKiejGpcsN8fhLcaNwSwv0Mo+Oc+iPtY0EQIqcr20x7oJTdmvCeC92Mx
	w5Btfx0EiF31VqIYRmTfnKm/5wc33wDd4SMnad0hrZkm/KQUa4l33DgVfMIGXxG+N120HtmoqQx
	txJwDHLAidPaV9a5fmQ4qiwL3Z89bWLgE4NvH8W/SHRn4wuCYqtdhpvm+6slHUqP7g2VU2JZmCw
	WuNx31Wftb4v/I50h+jw2UFtM7YMa+d4U4ORF9mNupDG/rthdmI+3/jejrMrQi2/kvxQSA+8v3i
	ud+g2hHH2jt8pcWozWe5okGAalLF36DnMNfNCmVcK2ec3B2fTkwn2ioZGTB9YrdUOQwJbBBFGzD
	sb93w1Xud/nM8YfeQqq5OsL5Eg1Q3DZU9rMARtKVeB3Bu8p1Df9B/qBbm0kCfX0ELBQ==
X-Received: by 2002:a17:902:b703:b0:2aa:daf7:84f6 with SMTP id d9443c01a7336-2ab39c68264mr22360115ad.55.1770917059432;
        Thu, 12 Feb 2026 09:24:19 -0800 (PST)
X-Received: by 2002:a17:902:b703:b0:2aa:daf7:84f6 with SMTP id d9443c01a7336-2ab39c68264mr22359845ad.55.1770917058825;
        Thu, 12 Feb 2026 09:24:18 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2999879dsm57697675ad.80.2026.02.12.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:24:18 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v2 2/2] wifi: mac80211_hwsim: Add UHR capabilities to the driver
Date: Thu, 12 Feb 2026 22:54:01 +0530
Message-Id: <20260212172401.234059-3-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzMyBTYWx0ZWRfXy3O0qT9CkoWg
 s4CvMLjFHR6W3IBnJwwi8BoEaVE4gHAQjd1n0CbZ7Iv6BXD90r4i1dTNYvDn8Rjd/YSEd0iZzPK
 pFIsv6A7J2HRQwN5NqtCR9KR3hsK5mGLB0uONyVh+OzubquEThly2OC+bXf90WTBLr7ccnTiFRo
 tVQzuTL2BFHEW3Y1/q87KBbJM+u3uB9aVSU6HwLCAgmkup4Z9yI5D0nGRBigpTq/XG9ApOGAeiA
 tIy5PgwqXBTD3oug5Ue+hT0n73vRs+7VlSocMefZ2LlC+vGWJEL9nvjU1J1jjNzLy7grBuzNSzk
 Pjc+92eLmq7R+f8TrEMtr6/rTvlpwyW7s1uqzXniW1gazBhWfTYDwBwA3lVxjcBsBf5GHFtGR/T
 Drdd0xdKXXDZ7aLsA9xrWpEf6Ai5PBSu2cZZF2qoZgSHWActguCETSWV3Sg3PV7iFeOQx01+4cl
 S4MPXfIAmWps9w+qa7A==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=698e0cc4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=zvSoEyNLsJKm_rXvJ_sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JwkX7OsSFJqtWnobUypvtkb5Hm7P90mv
X-Proofpoint-GUID: JwkX7OsSFJqtWnobUypvtkb5Hm7P90mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092421_735906_20EFBFB4 
X-CRM114-Status: GOOD (  12.81  )
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

Add UHR capabilities for bringing up the interface in UHR mode.
This is required to validate UHR test cases.

Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 285 ++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index 4d9f5f87e814..5a576bbb7688 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -4478,6 +4478,49 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4586,6 +4629,50 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
@@ -4755,6 +4842,55 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4880,6 +5016,56 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
@@ -5073,6 +5259,55 @@ static const struct ieee80211_sband_iftype_data sband_capa_6ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -5219,6 +5454,56 @@ static const struct ieee80211_sband_iftype_data sband_capa_6ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
+					IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
+				.mac_cap[1] =
+					IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
+					IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
+					IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
+					IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
+					IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
+					IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
+					IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
-- 
2.34.1


