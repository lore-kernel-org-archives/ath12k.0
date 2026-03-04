Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59433EB7EAC
	for <ath12k@archiver.kernel.org>; Wed,  4 Mar 2026 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXNn8gE+HxSx+H98VO9vSfJk7bcf6vTbEo1SVs+3ZeU=; b=0Dh8MURXxyCpW1Me5BzetBsg/6
	m8lXK3bidUazU9cjQrNb6y6xB0vYn3OOZbHeELO8o3ggcAfgs54PGi7iGhx36tOhGtmsaUCs9Xie3
	glucAGIIh1GCAAhLq2RPPdKmLBEPzPzrhHQ6y2wuxk8Pl+Xk4UH9PgzIcZ6ifdK1AEr9YP6YL+2vC
	DsSDNbVwKluPCzUW7oHhSwURlQT42g6iC4VNjU9bEmiNuDqarTeOwSEWjrPufHQlatt/zj6vW0X4h
	6/DiLbdU8STVi1nea/dehdgvyK/7t7DEY8AvRRpLzIh5WR0cFrfvJO7ryTS9j1IP48uZxul7uN0Hd
	dugfjFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhze-0000000GnFN-0M21;
	Wed, 04 Mar 2026 08:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhzb-0000000GnDt-2S95
	for ath12k@lists.infradead.org;
	Wed, 04 Mar 2026 08:54:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQDG2861139
	for <ath12k@lists.infradead.org>; Wed, 4 Mar 2026 08:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXNn8gE+HxSx+H98VO9vSfJk7bcf6vTbEo1SVs+3ZeU=; b=h7UWy8mEE0RpTVdZ
	zQcWJHg6BIamccaFE/u6sOQmfoASWNM7W7fIF60h8AKodSK0ovrx5l/WsQEPgUsx
	ro+iqAWc9oOjKSkhEtj7R6qwMXy0gciodW+rlZbdLAXViE9f8/GlP9xJos8qQJEX
	e1OI9g/xXle/KQ21Twr0ILutnJ4zVSGGG+m1fCjTPqCFztYf6FnhjHLpeNB3dfov
	t7jvbeOAeHctt9XJgJCc7nfa2ImXaD9f6Dsg+8ux2K/5FJQbNLG1hAUmuYCUec5Z
	JdhvduAdqx6pPQ8NE2KFZYZ0Zk48NW6GaTix+DcW8/wXQj9hb8T+sJY5c/pnPyXC
	hTgQVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9k7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Mar 2026 08:54:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8273494d873so2746965b3a.1
        for <ath12k@lists.infradead.org>; Wed, 04 Mar 2026 00:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614446; x=1773219246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXNn8gE+HxSx+H98VO9vSfJk7bcf6vTbEo1SVs+3ZeU=;
        b=Qrxf7lSngAqJ6lJEjB7V9OGnhwvMc0EvOx2zoN5vo4N2G/ZJjKPU6UvBiiC18Z35Ft
         N7XWM79U9qfb6CwY64qXzfyD838Rv+6Vnh1FbVAsuSp5AaZFhtu46GkJ6EsXWH0ZoSXF
         VeKEoL0aRh6N4K/yh5l4A05sBhvCdblbes/tOhY9YBIIitnlY9XD5ff3nfDidz6aQyC3
         Ecoxykg+ENc3eZo00mBtB24aU1A8UbhOwEhZoKDFWLCaNMNmv7hxKjo5guIl2RBBqcoI
         S47LLmAFW1aDLXMfIsLQe7kZ6jZWYpqlYmSWFRl6Fk7to73YTXaJD81y8SHSb3BVY2ed
         QVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614446; x=1773219246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXNn8gE+HxSx+H98VO9vSfJk7bcf6vTbEo1SVs+3ZeU=;
        b=Ih8bIHPd2GuIN1SuzlguYIaH7AnrDLQatX2PN2FA7h0WHr/oPf4MuA73Wn8giklAZM
         8oOg/igsEx3rwvggfRvbxXf1xkLn48ZJVhi0KQc2AD/5x4AEQFib85/NN5PIuPvA3kL9
         MToefoOv3Kq295+pJH8nviNTBFaQLgtzrXjpHCr+KXtPTLaqP6d9jr0R1Onyq5UZluDy
         iu3Xaf3X3apDVDvm4l6C2PFQIhuHLexVm/fGm2HiZkNRiig0gz9mquSOggLMIecw6Prp
         3XQMcqYXwNZ7mzISfldDJPiqvdSzARXN3RbL8BGx0aDDs5JTLPgShZJ8WtlL2W+Irod4
         n6tw==
X-Forwarded-Encrypted: i=1; AJvYcCXFNOlUHr2+HSS1YYuQAUHhx2L8TVFASu2L1z4yZmBLe1DwSYjIWO5oqk9wNXl6O1W9CJwlgEw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE26hK0JPlzzpSVD6X8N3CdfychlhT6KpUZ11PL7lmf3iUH9AH
	NEhHIo3odmAYT9Mvv9i7yCMj26njPrHQGkLNRFjwnyWUFqQc1OHhy9I5zp5ETqzKIKm0U/BVeKa
	KWebtZNQ3i2nRRZzAA7bbVqWFdBq6yH1ULtkfVLmuiqEIeMmfdFYLbtCbtl66Erb0
X-Gm-Gg: ATEYQzxJMpDtwRmo03ynEYhkal4xRd4mJ/ffg32QUdQQLPm+au1yoM25AiARiEkeMMa
	dsYRfL7dve85iFambeWbw02jixGW2KGny84Sxq43+Na0METRxYV1VDvDyL5mXxbiKFdGFHS1+fI
	a42v8iLXxDosESyNeFr+QGIUhU2JKfGyX9wYH99BFrbu5SgW8onzoRXpR9ei4PZ72GwGtqlhsoO
	0bKKJbMuo/+yWJ8DnFzYerp9n0NIRq/+/8t8sSKPBcvNaJ0cr2NkR/DaMhcwdYvVQSFRZBa3njh
	xHRo2pynyFKC557QMolDaizmUFRdz0mz/1AYLPT6uLYIB9IYgtrGbZQvJQLAW0oCCRUcPmNm6ey
	K9BcfA8rSaDBLYsqwSt+BxvBJ0fxuYnIUqhBnL2JHOMI2xRqROc0CFXGkx+gekZEEGw==
X-Received: by 2002:a05:6a00:189d:b0:824:3d5b:3cd3 with SMTP id d2e1a72fcca58-82971f8f4c8mr1336554b3a.0.1772614445540;
        Wed, 04 Mar 2026 00:54:05 -0800 (PST)
X-Received: by 2002:a05:6a00:189d:b0:824:3d5b:3cd3 with SMTP id d2e1a72fcca58-82971f8f4c8mr1336536b3a.0.1772614444932;
        Wed, 04 Mar 2026 00:54:04 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a9dasm18205140b3a.49.2026.03.04.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:54:04 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v5 2/2] wifi: mac80211_hwsim: Add UHR capabilities to the driver
Date: Wed,  4 Mar 2026 14:23:43 +0530
Message-Id: <20260304085343.1093993-3-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304085343.1093993-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260304085343.1093993-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX2qCMCmWiTqOb
 mSacnMgjWEy23zKJGL9xeLQTdHO5evubUJBirZeRjmsz5DpV0oIk9R3lFVJJZnkFtOrO7N9dT1y
 lFw2uoilxJLw9Y4syjuMSgeWwfgKI310sGla1nQg2Tw7vSR1aSq/tzAEmtiQgi2vDtAGSUjgcq4
 1scFoLjARPdl/Flu7cEOHRkOYHHGSkjywURXigt+ydjddz2lxykqECcAd1dKtfXm+gKOyGo6elQ
 ToYb7FVCwfi49GL5+VcaqjGWWWsAHIrGAFbA+eQtlF5PMjf4whi2PpUOMoFIOMvlykzlUBjbbCQ
 JARz1jmzS0t8yX+op+DthABLs24bick1dw9lh/uhfbULnw6efupLjYrhq2MI6Qh+y9nl62CyMqA
 Fi9cd/VpHEa1zHRhDwKoYLjAZ69aVmCIrgqTr+s7SwGiSInK42zJxfMmfmgu2A/uuTuVAlLxMvV
 FUnwrUORwWsQukhqcxA==
X-Proofpoint-ORIG-GUID: SGnBbQfWZ1Wb0SGoHRSICC_e13rZmV0M
X-Proofpoint-GUID: SGnBbQfWZ1Wb0SGoHRSICC_e13rZmV0M
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f32e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HmXHpSMdhKLYPtCZ9UQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_005407_746795_44A96304 
X-CRM114-Status: GOOD (  13.59  )
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

The fields added to AP and STATION mode for each bands based on the
IEEE 802.11bn Draft P802.11bn/D1.3 "Table 9-bb3—Fields of the UHR MAC
Capabilities Information field" and "Table 9-bb6—Subfields of the UHR
PHY Capabilities Information field"

Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 246 ++++++++++++++++++
 1 file changed, 246 insertions(+)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index e89173f91637..1d8060ad86fd 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -4478,6 +4478,43 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
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
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4586,6 +4623,48 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
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
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
@@ -4755,6 +4834,45 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
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
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH,
+				.mac_cap[4] =
+					IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
+			},
+			.phy = {
+				.cap =
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4880,6 +4998,49 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
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
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
@@ -5073,6 +5234,47 @@ static const struct ieee80211_sband_iftype_data sband_capa_6ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
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
+					IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
+				.mac_cap[2] =
+					IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
+					IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
+					IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
+					IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
+					IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
+				.mac_cap[3] =
+					IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH,
+				.mac_cap[4] =
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
@@ -5219,6 +5421,50 @@ static const struct ieee80211_sband_iftype_data sband_capa_6ghz[] = {
 			},
 			/* PPE threshold information is not supported */
 		},
+		.uhr_cap = {
+			.has_uhr = true,
+			.mac = {
+				.mac_cap[0] =
+					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
+					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
+					IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
+					IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
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
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
+					IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
-- 
2.34.1


