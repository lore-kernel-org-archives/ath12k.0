Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C4FE83855
	for <ath12k@archiver.kernel.org>; Tue, 17 Feb 2026 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFvYsCI5HjURK4lftvkXrgVSok0x3FjDs3Lc91XWaII=; b=ujEgBCjNJ7Uh7x8uQ1s3bc5Lz/
	wSDG+CkJfaNLgk5Nwl3mnh0U2ez0vhTHGF0Y269Kpp0OXPP6261kreDr0aJwKQduMPOxuHGImmks7
	ZEpE+pJom7bXFofG2yXy3QsZi3wkcoGa2SbMMGe10oRtVOWK2WNX+jbZHZ43utjbPrMx9HtNRAk2r
	vD8UWdrtH4z+ojXs6W6AI5R9Ar596WGH26g9BvS7YGuUZ7ZzszbKWr4ECs9fRjjPJH54dq83Roo09
	PmAkgydaeKtOmUFQgcfEKYu667bauE72NK8eVCs1LMvN8QY7b7Kc1k/SH4ER+wJk9ZDpdJ8FFYXYH
	3LJyaCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxn-00000007fGC-3wRO;
	Tue, 17 Feb 2026 05:49:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxl-00000007fEU-0ovz
	for ath12k@lists.infradead.org;
	Tue, 17 Feb 2026 05:49:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL8Wh2912069
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cFvYsCI5HjU
	RK4lftvkXrgVSok0x3FjDs3Lc91XWaII=; b=E0PsDqgcLMdd1+Mq6tVsol84lxT
	hzanVhJHV2hqr3H/A/BiLiUJjQ2iC96OEo5wH9VN54Tqorc+rkXhM5tnEoZgPmq+
	xgrMBmvUUtQsRmMyD+qek96aG9/nJJegNCGr3tFdyEAtxPrG6EbmjSQ5xQJ68gOk
	Pr+K5wrLYovdRAOwde/LmOF+LNMDsQ/Gn4xSwalUtHd59aV77GRCf0MDfTVxFsc7
	UHxjP/qthCYW1KfCQndYXZbm6L+/Eq51svWGgTu/pHe9nZou66GGP3FiOW+xAuQC
	5VNPjU+tQV+SyEvG3td+RqtVOaNR6o4ZXy5CAnndMdCfhmaxbvOBHYlxfmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9sb7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aadeb3dee4so217561905ad.2
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771307371; x=1771912171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFvYsCI5HjURK4lftvkXrgVSok0x3FjDs3Lc91XWaII=;
        b=GHcihtgb1xFJjbHWmyVW7t1nVATWb4rXBv1uCzlpgNmUUPZwXYxOzgMUdILu5fiisV
         0Ns0BxauiaUrZVoOYw2AJbgpfPGfSNs3abWuvGTK0yTwJSl4IcvWL9cSa6vROxN6UO+U
         Wvu2+JkZxVO46grPef8ZhRangizXM2YjVuHgFPWUAy1EkyAOavhyn+FvlOOzMDrlb5xa
         Rhxi9p+6oM/Kftvz+siivCvqY0gzgUEU0lNStGa2UyXLKZv4ZQfSyhgkHKehEC1SZMBd
         rl3HcV0HjmkRo5ZKJnTyTMzSrW1FpCTEg+oU+BhK01hWoLKA3Q/I5WYknZNE3FerNGFe
         nrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771307371; x=1771912171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFvYsCI5HjURK4lftvkXrgVSok0x3FjDs3Lc91XWaII=;
        b=ZwK9zgvxr33I1jR6GSl5D8SYSv6wXeWSV+Hq5Ba2jReOWSyBf6JHOM5CNkj7FqCvUv
         iiZtFsk8yxjakDDYiaDaJ09zGBhkIi0OFOHvAlEJYjtQvXdCALjqhSl4CTO6QL9k2KKN
         N5AlddKXeewlTfln0GcHz/mgZe3SiI9RFSkpPgYN1l/EGTnrpnlueavGpmeOPN5xx2bj
         PnKAnFMc24iGkVtyK3QWXxNasUZ1WyPrNmj51OzqlUM/h10mxAHNmfaytVTQR3jMj8OW
         QPya+7tiEI3IZZ+XCgwDWec9yYKm60z/2s9zMawh7zFV2ig1ZHVxDRBv9isyafGTcNo5
         uhig==
X-Forwarded-Encrypted: i=1; AJvYcCUXVH5nvLI4ydZHVH7fp7pqXhsaijI2CuyMLU1hE5HBK756qYj43nWQAUdDSPRX5WHHOKmDY98=@lists.infradead.org
X-Gm-Message-State: AOJu0YwW9HDSHBncQS8+r1XHf5UR91pLelUHRS9YFR8/pu4/GllRCQs6
	qYfbY9shq+5wgMsgatJq/DjlMvA5lWBlI+5xx6PTOMU7XnNeF05AHTcalYL+P6eXiLxvPEhRUZ1
	cSXyLnpjvix7xf8AbKdkNxo4HQYIkCNmlzwQlBb0isbqMPo7LF7XmEjicKn5TPyAU
X-Gm-Gg: AZuq6aKALlxpYlkObdZjbBPn/XPbsUPrwDKg+lU95GkbIyeuOCjHtk/JRrrjwIkdePA
	C5/J1QhxF4LXfltBQXDBCLqSQJumE9X4V/ZMKq1QsrU7cdccVv5Cu8RGzKkbd95nVugp9rhCBzI
	qehgixe0R7a/x+Ug/1T+S1mRsKgh6qL+eODsn9zOmCwDKwbEZD9zYgL+oVEcqtkA4tVuOYxPCg2
	yRtHHZp28nmjO1BHIcokn0llxYzZl23m/2kcIAzpxbdztgU1S/zgo6ACVpdcru6idggmTkXvXO3
	uqLcdbcmpOwMVzdg/O+eP6xpikAY0RzG1MdQW/4muKQ/HECovYZ0VRN7c4hjN/DjPKYYCg4xOlZ
	Q3QKoyioNpryeJgBqZ3v3zGH8wj/itZ9QQtZlaeliBtMhf6ieQi86gGRp0e8juBujng==
X-Received: by 2002:a17:902:d4d0:b0:2aa:d61d:79bf with SMTP id d9443c01a7336-2ab4d04e925mr140733025ad.42.1771307371215;
        Mon, 16 Feb 2026 21:49:31 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2aa:d61d:79bf with SMTP id d9443c01a7336-2ab4d04e925mr140732635ad.42.1771307370740;
        Mon, 16 Feb 2026 21:49:30 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5bbcsm89808175ad.56.2026.02.16.21.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:49:30 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v4 2/2] wifi: mac80211_hwsim: Add UHR capabilities to the driver
Date: Tue, 17 Feb 2026 11:17:31 +0530
Message-Id: <20260217054731.3667600-3-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NiBTYWx0ZWRfXw4jbXTYRu9lw
 1Dd/4n6QReHhtW6MuVXiwZhGlgO8pPGVxSp3GY3Lat6ma/fGh1O/4UvMuWjjUFG02+VaxwTLXe9
 rWlGIcvsBqkAWP/guThMikWwo+VmC7b12OB/cbWIrSiO/hEd4RiLwENPrCeC71CxXTlv750nNGB
 NxnWYKawo2/ky53Yp0EN/L9mM0RZIWKLggqjzdJWgU26nwTGumOeXEnGeK7ds5hGMPA+mdKEA9B
 nvBAlhOHTVvlE7B+bkVU2z5k09yO8srxiUdHFVYpd1hOGFk7XNNcsm0QcgoeeJ+f5yv8I/9cmtr
 w03iJL515gL0LtyM7jx1/iyh9VKx/5mQ9oxWqj0bCCFxdJDn9YIKLr9B9O98rfO9XMqD1PMh0M5
 xxiQmm02K3getzlEUP9ZKnIpeFYLFkx37D727en+JGmeAMyAByOp22/vF9jMafzC5VkMFuZkZs0
 8XyoyVvej+BFeJb/WUw==
X-Proofpoint-GUID: qMR8-pJZUBsd8FeePA-BmskcQNyY-Fxw
X-Proofpoint-ORIG-GUID: qMR8-pJZUBsd8FeePA-BmskcQNyY-Fxw
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994016c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=zvSoEyNLsJKm_rXvJ_sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_214933_350633_DFE778D2 
X-CRM114-Status: GOOD (  12.96  )
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
index 4d9f5f87e814..7af429e589ff 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -4478,6 +4478,51 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
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
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4586,6 +4631,52 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
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
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 #ifdef CONFIG_MAC80211_MESH
 	{
@@ -4755,6 +4846,53 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
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
+					IEEE80211_UHR_PHY_CAP_ELR_RX |
+					IEEE80211_UHR_PHY_CAP_ELR_TX,
+			},
+		},
 	},
 	{
 		.types_mask = BIT(NL80211_IFTYPE_AP) |
@@ -4880,6 +5018,54 @@ static const struct ieee80211_sband_iftype_data sband_capa_5ghz[] = {
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


