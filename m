Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89711C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=; b=gXasnj31JHftBf9RIEuTmwLXd0
	xMlnlzQJAExNZ9LP9CQSHK4CRUVKLB0F+KjXDv5dGMlzjwoCknEeNpheqgvH9/Kxo7NNoKoyrINbi
	viyZKcYIOzcBl5zIgqSp/Qhos1OgibiU5vJmqesVTrRT/lzjNK8hDg1HeuXg0ol+jz92OQOvfE8ev
	SppLiK3JAbPGsgTQ3gGpFNmpNMOlLgVR4jtEO/1ofOgCH8B2Py0cMlrPLaIzVDmX9oaGHoxqcyIfg
	q/GvQXVkUFsXy+ub5aTeZ2MAp3qyaGZIiym2Sp4zkUNNzRGNlgCWUcakwX51ejb+M4aaFLK6xCenU
	rVCiPGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7s-00000008Pu1-120z;
	Mon, 13 Jul 2026 07:30:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7p-00000008Prd-2HIQ
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6OdZU605374
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=; b=GRYYkVu2hFw4lLTq
	FvcJozrtIVAADmTjHVyx8brQlU4+bjJyKVmVuE/p98pcde4YhP52qXxImJJLWZ3F
	sa3VZA2p46AQjTUCo9w6JaQbeeG72UMhLJaSl5QXGSRQPeDwzw/kLRL5DL9W4GvP
	bxTr1+PCGd66tDZKLFY013dVJ1B71i5x+UiQXJ6wF2COR7liMB4HORa7uDcQQwP9
	P+IOabAPT4Lg7VQpyUXynzLhLklFxgddEBS6ksFUq67MugoYg7HBMVFndFekMlKw
	1w8uGiVrsnpkIJj5iBK3QFD/k1zuaNjVTySH6A39eTur7G8tRStjCMC+bhy23xhg
	Qyd3Vw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmyyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so5099713a12.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927847; x=1784532647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=;
        b=N46w3Y3snbARL6e26Abfd/or2alVQp/2Hzbt75yIGeR4/4PBiX0r2prTXahn1EKYXL
         5M08uXagu1jQIQc7r01bpvnknAgPi75t82qt9XxYxLpU8X/hCLix8CJmudtwzqyRl6+5
         dTx1hDvQwK1kQbLxzJ56z/3yf/VqOIGFRJ2wkTNRPa+CFDfRL3MS8467K4dyK7mrsR5k
         D4F4xWKuheCrczr+NYBf1PugQv9l9WI5YZggE8k1qajHPhIdbPFW/XmbRLKEmH6wdiXL
         Tuw4i8gf0vSUzo+2Q0fBdo0Xd649/R12vghzz3kfsuKS8gBWXCBTItpsTw+LsHcMjapG
         kvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927847; x=1784532647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=;
        b=epGKhG2Zw45QV2H6uLaRrVuET3H88v/AhINKYQs8y+KyILaAHBVsaHG32bazTmuIAK
         nU3D665iUnhbKbUrSMUHxIl1hjMdwugo2abrXjJbEoZfNm9sIkLYp4HpJCF6u9LRk+5C
         vpiB1ru05S+R/XynfbtA+NLINYCA7QO8t5kyFWCyAFAj6fzoE8cUTHrC7uvVDBhH3HuW
         09buxY+5DwdxK2i1FeXFzZhLyCvhZ1T85vnU40+a7offDq++RE5To+RE8+SC0G6RMY6E
         UdViPP4DHZbBapNE2GLZegSJ/BwYfN41vRvIUNVNnw5/RmNSjNLLM/XLktslEoktKAyO
         LnQA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4fuDIzcHvD76KRWOwpYCdHRFYWsb5MYWDeBQ27zhmP0LBYNCxuhwBclFBbPHI98qmtRxKbYw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgWR6TOgbWlV0AwVl01LVx7YX9ot8Rky4PC/1UOvbzk4fXkb+B
	0NNnj7G2TFbzkS5tN1foXoou7NlnecsP1pMcwMhmHzfjNALicxF55K3vzrT9QoeF/CgwtRyDrOO
	rdieLrs+vEy9lRt951DGrmDJ17C6Qc+k/fiyvJx8KUxPQOgidgc4Nbkva8nZ6RhJw
X-Gm-Gg: AfdE7clltBbRAW+FnDf7O83qIYrhzGRzstmw75PncLMoiWGJEVJmJgsyQWXWGMptX2F
	uK8OXxJIdmno7YnY7jAhAkwF6jkFblgPyF7W4rhgn6lXRESXsURXZTM1Nx8MLSI7+HG3D628dwP
	E4He/jYMYQV6jZbb21IsGHk9+33Gj7K1kxh/SPWUYnL0XIhsmNAYSSKg8nVkV901RP/gOWsD3O6
	xLdZmtkDwuyVw3Qd89EmWzCVcyuSeSmX7gVLMabpUXZRQQkvSqZDByB0Rrpf/uUCnW7J/zwIpkI
	6MVXwB+iF+05+SwmSroEWtv34FbGFKjkKpHaOGT+FmQniEFSakqGIqfPJgH2J/7k57wkY8fALuG
	2Y+n2cCnegwD9mr5KlYxP1qtl3skX8vJC+FC3yNYy6V0Zptn5jhqU89CfKCOeBqv9
X-Received: by 2002:a05:6a20:4324:b0:3bf:80a5:51b0 with SMTP id adf61e73a8af0-3c10fb6f300mr9071210637.0.1783927847500;
        Mon, 13 Jul 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:3bf:80a5:51b0 with SMTP id adf61e73a8af0-3c10fb6f300mr9071189637.0.1783927847017;
        Mon, 13 Jul 2026 00:30:47 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:45 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:58 +0800
Subject: [PATCH ath-current v6 6/8] wifi: ath12k: do not advertise MLD peer
 ID for firmware-allocate devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-6-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX7+qtTfiMIvSo
 bjPlEVmI/nR1GMasgBK2B8I1ysRWKDQ3yUxVUikkLs1WLGJXl/ojoJas8b2f/Zo+gFdcVuPtF/c
 ceGk/ZEO8B6C7xNxFTBrl/dsSt+xEdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX7Q2XORCcKzSj
 eGMQuLg7bD6YA8yeHipozT+2iw9PVIg7zYUTpwcwWLO/l6WOQutDR5jAjkn/0a8Iprft4JtHnwh
 3y4Zv7QjZr8QAn7QzMJCTPC+AS6n2s02HSgwbPFbDaRAmgko2oVOR1yXy9aHbkGNp73BMy28pa+
 R66nrEGjVPmQ9XwNsYI1IHP2Y/AdGQQ0PeO5IoXRGnVYgDOW32+3bta4frTEeV//zkDpx76UTmz
 3m8wsIyAXQaV1kThHRNVi+YZl0wWnmikI4MiPfTQ3WueTbb+k4+bUyLiKguVk3uVzpBQSyUq4c/
 Os3PStwn5nnv2Or1ZDMEgyUnauVqpRPY4tz/YJGM+HY0b2GStNitN6pRwr/jCXHQwKgL8FXU0B6
 cBIgWDniOpkfYpdyD5n1kACZS8+V2aSz26rev3yZEwfVScjj6kC6PdLcWdJFrb7J+R0RzbOXj5x
 VOiolvZALFv9OhZmf/Q==
X-Proofpoint-GUID: Hjuxuyj9pwmY5rSWpjQHSf6_nTrJp3nm
X-Proofpoint-ORIG-GUID: Hjuxuyj9pwmY5rSWpjQHSf6_nTrJp3nm
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a549428 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zO7lKvSgDLHZEP5-WbMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003049_711293_55383BE4 
X-CRM114-Status: GOOD (  18.64  )
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

ath12k_peer_assoc_h_mlo() unconditionally sets ml->peer_id_valid and copies
ahsta->ml_peer_id (with the ATH12K_PEER_ML_ID_VALID bookkeeping bit masked
off) into the WMI_PEER_ASSOC_CMDID ML params, which causes
ath12k_wmi_send_peer_assoc_cmd() to set ATH12K_WMI_FLAG_MLO_PEER_ID_VALID.
This needs to be gated on chips where the firmware allocates the MLD peer
ID:

  - WCN7850/QCC2072 firmware always picks the ID itself and does not honor
    a host-supplied one, so the value would be silently ignored anyway;
  - QCC2072 firmware additionally crashes during MLO disconnect when
    ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the preceding peer assoc,
    so the bit must not be sent at all.

Branch on ah->host_alloc_ml_id:

  - When true (QCN9274 etc.), behavior is unchanged: peer_id_valid is set
    and the raw ahsta->ml_peer_id (without the VALID bit) is sent down.
  - When false (WCN7850, QCC2072), peer_id_valid stays unset and
    ml_peer_id is sent as 0. The firmware ignores both fields and reports
    the ID it allocated through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP.

The early-return on ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID only
applies on the host-alloc path, since on the firmware-alloc path the value
is ATH12K_MLO_PEER_ID_PENDING here, not INVALID.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9e5fcbf8c730..8cd5e9b15db5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3529,11 +3529,16 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	struct ath12k_sta *ahsta = arsta->ahsta;
 	struct ath12k_link_sta *arsta_p;
 	struct ath12k_link_vif *arvif;
+	struct ath12k_hw *ah = arsta->arvif->ar->ah;
 	unsigned long links;
 	u8 link_id;
 	int i;
 
-	if (!sta->mlo || ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
+	if (!sta->mlo)
+		return;
+
+	if (ah->host_alloc_ml_id &&
+	    ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
 		return;
 
 	ml->enabled = true;
@@ -3541,16 +3546,25 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 
 	/* For now considering the primary umac based on assoc link */
 	ml->primary_umac = arsta->is_assoc_link;
-	ml->peer_id_valid = true;
+	/*
+	 * Only chips that allocate the MLD peer ID on the host send a valid
+	 * ml_peer_id in WMI_PEER_ASSOC_CMDID. For chips where the firmware
+	 * picks the ID, leave peer_id_valid false to avoid unexpected issues.
+	 */
+	ml->peer_id_valid = ah->host_alloc_ml_id;
 	ml->logical_link_idx_valid = true;
 
 	ether_addr_copy(ml->mld_addr, sta->addr);
 	ml->logical_link_idx = arsta->link_idx;
 	/*
 	 * WMI_MLO_PEER_ASSOC_PARAMS expects the raw ML peer ID without
-	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit.
+	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit. For chips
+	 * where the firmware allocates the ID, the field is unused (the
+	 * firmware always allocates regardless of the value here); send 0
+	 * to make that intent explicit.
 	 */
-	ml->ml_peer_id = ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID;
+	ml->ml_peer_id = ah->host_alloc_ml_id ?
+			 (ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID) : 0;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;

-- 
2.25.1


