Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5833ACD4846
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 03:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDP19UPsXAB5jb3WMhsOr8Ux+xOl/E04ZRZxTZx20SQ=; b=rB1JEP3gi9Lsipj/sCmTOKrFva
	rjZJLdBF9TOfuyMbB1fe4gRsveAZ1kV7bqfBmlKf67ebj8vGyCvD9pafFX+mVQPMAJFgKHf6bjY1v
	M8aLwKf3RbBP1RsmsgFZJwGOZ8zatjEHmS8ln45x21JLQj2BgqshDZ2k7HMZyU8Fesw2wGDN+NAbq
	o47C+6xW/dO/HWC6EDZxdPFhb1DVmwLhnM1nYADNT8OGCiHEOOB/Y6KwTFWGgxdd/A3g9RB6phuGx
	zT0wzQaMlfjyb3LaYUGoGCSdeOLcd1VdviuBWp5YETRH5jUoXxIq2APelRKhRAnPygSLNvDHbbsHO
	tM2xl5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMol-00000004ShW-3xuB;
	Thu, 14 May 2026 03:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMoi-00000004Sgr-3UuR
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 03:32:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0t3Rh1622258
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 03:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tDP19UPsXAB5jb3WMhsOr8
	Ux+xOl/E04ZRZxTZx20SQ=; b=SlMYov/ureiMOvwqcs8gNHO0d4fZ4K6I5IHMU0
	TNeDCj/sEaXnJBg4GXULHaikpVuSWCEFXlUtuF6oba09zp/0UiBoiJkmfxeTQh3m
	ZWJia5guTf6GtzGjOXoao9uA+A4Ua29MxrHOEXWhGh+6777zWkYicrvidu76bbYI
	+NhrdMQtJr5tBzTviAlgESqKMw3WS96uYBxCnl8Sa2M9pi/qM7qT8fLWA2OjM/NE
	5E3fz7nFOKbN3Eax4S+zjFzckdu4p0yKDGNoAomaOIRLYreStQ8ZOAOLDDXF7PBm
	8FI4yF9PlC2uTNR+KPfRHWMJtpjIpAnuU6tA9UN7r9AXC24A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rdj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 03:32:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so78205865ad.2
        for <ath12k@lists.infradead.org>; Wed, 13 May 2026 20:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778729574; x=1779334374; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDP19UPsXAB5jb3WMhsOr8Ux+xOl/E04ZRZxTZx20SQ=;
        b=HhekZkoheTfqsiTXDd+otB2ysp1iDAqiDg7htnmU76Vk7TxtDGzF/jh/61/Rqwybor
         FYJ1QmTr+9HTceIuB8AEa15dp0M8k+gTHpZiOZ5jvgoucugYGf0WR3O+J6DaTdSadW7p
         Z6Tju/Drum8brITAPbq5Mti2jReUnXa36hoNEwNbJ1SVIG4dbJb4EBKSD2t8WkVfAeGt
         ud9HIQ27YKCdoUUJsNuEf0kYfySOdM2LEozzcBFRM3Oyv7cRdPu4gJJ+pNs42Yq4S8rW
         Au8YS+QRyuSSb10rRDeZVVwAdzB79Zt0HpfcfHz3k3Tzm3ADxKVhCCwffNDAsB84IRKS
         Hfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778729574; x=1779334374;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDP19UPsXAB5jb3WMhsOr8Ux+xOl/E04ZRZxTZx20SQ=;
        b=K5u34l2aM/ac/PQ4WJyXX+u4omcXYfGFXBRJMebuJaDEjwlt9y8SZM+cTAImE1rgqy
         qW4DDL4RJBse9lMGcbd4MtMaWOza77KyZoGyf9W9Ib027vVvmkyteXqPSrBvMmGxRb+q
         2qy9i5JnlL8+b0uN6C3kcrILZghp3FIoVFD61Xam7aZMmAZcWe5ie0iD3NAFo3SQqqDD
         uiEXY95FEp9WigTU1fKn5q8VoHekVEDDdnIyYMomXEB+JufnTqUGB3hxigI281Xxfyye
         9KGewUYxa9JsaGziJdOvI7lHzrU4o+ITL8ychbndFivI2uglPQP96tFNFxwzd9+Ot0Ma
         a02w==
X-Forwarded-Encrypted: i=1; AFNElJ8TT92oRdoX2dqxkcjnK5YgimiGOe/mIKlVVrlOH0hRlUHcz/Yzt60c6u5hVi1mKB+sLLcEhoc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwklCEr2V14/VvUNAc7HaCFsQbn8hChrM5iFdwe3c3wXj/xRBnw
	MLDuA5t0y9Q0oQqArjLPgea5tl5/wir9jOeoqeTm8iYJQwnD958gMNowNC873vs6WDqzM92sEYv
	/t9+A6gACf3v6U1vnXm2/GO+2u6cSYY1rpkdjKoQjQyitVjl9//GovraJVleVhfYv
X-Gm-Gg: Acq92OEG+hz7f6LnAN+lj+OvPO1mxjBfXOlz8Xo3QsFqSxAyZPT80UU8T6u33xNxrTt
	ShBDF+/CdceTvFIIT1g4SPdedrFvVW/vBxgUeQGtNKBtoPGkBsZhMF+HDEFs4CoRQSfaCID8KTN
	X0/A++QfSHeUyum+eZTVNXMSQa1XjJ6FGLwx2bUzrBumcbZ3VkM2zsi27uD3wmbH5XkTFR77DaV
	GRA95i1p9+45G9G2Efozn1XTESBoZf3thuveY/xsJ6MECS7XA1+TO6b00gPMmUouLB5oV+R/Fdi
	gxv2h9zKFycw8TVZAEgnYIh8vVmVN4F8PEndiPvDQTIy9rj4gj2d9u6w1h9Xu64ywUmZor5Cem1
	RNFuPZ5fNJHDoZK6F4apHi9O1BOksL2jF3pCwX0Dava0g5DwtSvp/5KtJAT5mBWBOvwz67TJMXA
	==
X-Received: by 2002:a17:902:db01:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd2716dbd0mr64568045ad.10.1778729574231;
        Wed, 13 May 2026 20:32:54 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd2716dbd0mr64567805ad.10.1778729573705;
        Wed, 13 May 2026 20:32:53 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ba17sm7610165ad.22.2026.05.13.20.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:32:53 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:32:51 +0800
Subject: [PATCH ath-current] wifi: ath12k: fix EHT TX MCS limitation due to
 wrong 20 MHz-only parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-ath12k-fix-20mhz-only-mcs-map-v1-1-a38d4a9b21a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGJCBWoC/43OzW7CMAwH8FdBOc8oX20oJ95j2iE4Do1GGkhKx
 Yf67st62Q6b4GLJsv37+8EK5UCFbVcPlmkKJaShNuJtxbC3w4EguNozyWXLtdBgx17IT/DhCpL
 H/g5pON4gYoFoT0Cms43tXKsNZ9U4Zaqbi//O6ingJWcaRvZRh30oY8q3JXsSy8qLMZMAAX6vl
 DfodUdml0pZny/2iCnGdS1LwCR/o+0zVFZUO0Iv0e03Uv+Dqh+0EeIZqr4/RYfNhreN0eoPdJ7
 nL3Fn60iIAQAA
X-Change-ID: 20260414-ath12k-fix-20mhz-only-mcs-map-e79a5a9d6470
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 8V5VL370k3gL_S5AU1zWEkO5BJXveMja
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054267 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ss5F2DYwMVdF2Ol0r0oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8V5VL370k3gL_S5AU1zWEkO5BJXveMja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzMSBTYWx0ZWRfX87+4h9KVKo9O
 XlcFmESWwlnC4oqj6epud0qh0L6xUg50/MHqaUXEyn1w0wb8CoZVKlk+pRO/byOnp0vqKI/HkIL
 3AEuFUC/5idNnFB17zhnQFbReldZVSz7NsmijrQcBTkr6bicr4jwycTe0SN62PSbDSEMxLgG2x7
 OEndlr0rPdPp4u97h8nIEwkTbOPA5AHyw5Jcdh8oVlCvI+B3gLKNcpr5gs8A8KfJOJdnFsKItrR
 2A9kx7jelSIIiyYYzO9giuKE3hUKdIE85OVx3xmCY8lcy0bNtc+Xpaf2xOTpZtNAllcXTCnnFT/
 ZiRClQtOvpsJjRRMVpoMJNoGzihkXzodwr69URSktx4Qv8dtqdqOwob/Hqs550MamXHhcWsvFcg
 O9iCBcCa/yFvGW8LwW83vCzBrGv0QUP6cTUdQ6cc4zNKE/+RXhFpS09awJxrgoZ1hy/MpEfQrz/
 EwrYhKon/2lXvI0pqbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_203257_032267_0F777847 
X-CRM114-Status: GOOD (  15.66  )
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

When connecting to an AP configured for EHT 20 MHz with a full EHT
MCS/NSS map (supporting MCS 0-13)

Supported EHT-MCS and NSS Set
    EHT-MCS Map (BW <= 80MHz): 0x444444
        .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9: 4
        .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
        .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-11: 4
        .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-11: 4
        .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-13: 4
        0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-13: 4

TX throughput is observed to be significantly lower than expected.
Investigation shows that TX rates are limited to EHT MCS 11, even though
the AP advertises support for EHT MCS 12/13.

The root cause is an incorrect parsing of the Supported EHT-MCS and NSS
Set element in ath12k_peer_assoc_h_eht().

IEEE Std 802.11be-2024 Figure 9-1074as describes the format for 20
MHz-Only Non-AP STAs.

IEEE Std 802.11be-2024 Figure 9-1074at describes the format for all
other AP and non-AP STAs.

Currently the first format is parsed when the peer advertises no wider
HE channel width support, without considering whether it is an AP or a
non-AP STA. This is incorrect: the peer AP's capabilities must be parsed
using Figure 9-1074at even when it operates on 20 MHz only. Parsing it
as Figure 9-1074as causes rx_tx_mcs13_max_nss to be interpreted as zero,
which is then passed to firmware, leading firmware to assume the peer
does not support MCS 13 and to limit TX rates at MCS 11.

Fix this by parsing the Figure 9-1074as format only when the peer is a
20 MHz-Only non-AP STA, i.e. when the local interface operates as AP or
mesh point.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 6c95151e2e77 ("wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fbdfe6424fd7..42b04bd7f677 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3446,7 +3446,9 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 		arg->peer_eht_mcs_count++;
 		fallthrough;
 	default:
-		if (!(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
+		if ((vif->type == NL80211_IFTYPE_AP ||
+		     vif->type == NL80211_IFTYPE_MESH_POINT) &&
+		    !(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
 		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
 			bw_20 = &eht_cap->eht_mcs_nss_supp.only_20mhz;
 
@@ -3475,7 +3477,9 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	arg->punct_bitmap = ~arvif->punct_bitmap;
 	arg->eht_disable_mcs15 = link_conf->eht_disable_mcs15;
 
-	if (!(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
+	if ((vif->type == NL80211_IFTYPE_AP ||
+	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
+	    !(link_sta->he_cap.he_cap_elem.phy_cap_info[0] &
 	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
 		if (bw_20->rx_tx_mcs13_max_nss)
 			max_nss = max(max_nss, u8_get_bits(bw_20->rx_tx_mcs13_max_nss,

---
base-commit: 6a7693873b20680a3c33bae0c9f9cb3185f64ade
change-id: 20260414-ath12k-fix-20mhz-only-mcs-map-e79a5a9d6470

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


