Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC21C369C2
	for <ath12k@archiver.kernel.org>; Tue, 22 Apr 2025 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a0aCPzESRmOLFCZSZqW4C1Bz5aMHm1PCkm2+Jj0kpro=; b=H1Vo8mG8PJQ+VnRkBxX9LMh9ou
	o3PXpcdwW1pg2BOD0klX++3UC0N9o8xABYNwd8p0/tB761+YiqftlenKWccL7o6jvsd44odiM1qTb
	S64JamGuVbJYXrqb1lhX/62cE8uRdB9LtJkF4qBqifA3GIjrXh0XXNuo4rHO2GAQ85PbfdZ4u581B
	iZQRY5mESNK+F+t4/UXVfZG6RGcZwFx/FapiAzv01Ae16PX9nRKbTJYoYnAlFzQvVY8cVkjA+rkzn
	aQ0SlFM/kISQ7xQ3VLusgciMrUT6IT6q2pmzA9kVU2hHv/6vjT5qANX5tE2CMWOgFtDBPcqMRh0zg
	z+sosxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aru-00000006lfK-1hSJ;
	Tue, 22 Apr 2025 10:28:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AAC-00000006bQB-2kEw
	for ath12k@lists.infradead.org;
	Tue, 22 Apr 2025 09:43:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OYTg011241
	for <ath12k@lists.infradead.org>; Tue, 22 Apr 2025 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=a0aCPzESRmOL
	FCZSZqW4C1Bz5aMHm1PCkm2+Jj0kpro=; b=coXIRiOIuG2XzFtF5m8Sc2iUQ0zn
	NGppuBJ/gwEq+p/us/hOG5Ywzo48UysAxOXIb2S5B81sToNd14QvMkJPmEHQaia0
	LFFEeAD8TQLGa9ErQeFmavFv79oOj5vGtNb6APowxM//yqU2i7POSvqfDBmHAgaZ
	VD2KNWdO0HTsM0wXNlSvWSlu1CbydVK8q5zWH3XUFuuMM9oAnasOCpiY39NlSTJZ
	wZgtLW2PfcvYaVeT5MYCHI0kOtQeVM0ok8lZIsAK5k46KR2RWHpsbg/A9edejZkh
	cfH8es6LihWtEYJlzKgck01mmlRF3QFgKIJmrHxmXlI1XXxMHWgafXsNPg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450peu2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Apr 2025 09:43:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4140977b3a.2
        for <ath12k@lists.infradead.org>; Tue, 22 Apr 2025 02:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315014; x=1745919814;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0aCPzESRmOLFCZSZqW4C1Bz5aMHm1PCkm2+Jj0kpro=;
        b=qYqO5Re8pbMJdCXt5qCkekBr9s3hH3R9w1kibmCcXCakEsNeUYEz3Sw2M1rsJeWidm
         XPGmywioMqXPlJFOLb6ShFB8yTH+ZSLvlku0o+oZm+S7g8g6Mqz5Dd6v/J/obg4C2eND
         X7qf94xoMTUOo2NyCYEOyZlXJTiqw36Z8lu4OXBSInwLnBq20lpmlr9UlTMeJ+iGZys4
         s1AlAdlYX06XxA/ujWAqvtDDf5GAfC0thqtkd8JyDzYJHprFtY7Rrm+ZFe4S5yw75sGP
         nk+VFVCXGRogVMNpfsR/keo/M45WHHB4iNZbKKxydA7Syco97ZgfawwaK4k0BkodTKdP
         xQLQ==
X-Gm-Message-State: AOJu0YxFvDvVevhTehmPdMv0MWgnzCpH2rCE+PTLFK2oei7VZx2QagJo
	N4P/lBAvnKxEUavch/OOvlLVi8wqHp+T8PwZ8WBSdZPtm65vJ+/NKqXg0t1F8ntH2Xg7ragCEYv
	dmwV2SMGI7TwuPTTZ7W+UDVPYhABgEyiUlBhwf7/SI+KkeYPMXSadWx8tTs+gvAtyVlpv
X-Gm-Gg: ASbGnct1Xsl1qzoc35nj5y86zFq3mE2/97vUvaKskoiBNJo9e5YnaYw75wPUBmC5INZ
	iKeZ0YgY0g8f/uY+1JTnR9PUIbR2rdIYwAhaheRf2ySF6mhCCHVwjOiJlMpdO4LByKzlRU3phX7
	wrrZcVcV9MjtsV77P6OAbR788ngWtuqMqHtVAwcBgPaUn0Ho9I6nciJLUh51mN7Defjzl43jwTr
	g4PIXvRyJsnOvblUvEC6ZEWdQDajtzgXOSAGUR5EsiQGfqA31X+vN9Eyq3mhQq43W+WJT2nl1ki
	xyCQ13zYcHAeQqWxHCOuzLPoKqAohiw7W2b5QbFTQ+w/EduQdd8ltS5fmkQPTRlmxPzvuyFPzEQ
	bq1olf6jKQyDotAlAptfUnlVOSD31V02zx8+j5ejYZrEtEQ==
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr23123358b3a.3.1745315014343;
        Tue, 22 Apr 2025 02:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEan9zA+8EjugL8KIBuwmnjvji6NNTShHfGQ9LH/OIZR2Y1iL5cxa0Jyk6oLHrP2hF/h1A6hQ==
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr23123330b3a.3.1745315013837;
        Tue, 22 Apr 2025 02:43:33 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa58376sm8432243b3a.100.2025.04.22.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:43:33 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Enable AST index based address search in Station Mode
Date: Tue, 22 Apr 2025 15:12:55 +0530
Message-Id: <20250422094255.131226-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=680764c7 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=g-AHoWTylar1N0jkHzsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xl_LGy7VDKLV1-NLRKcqoWNKt4pFY4tf
X-Proofpoint-ORIG-GUID: Xl_LGy7VDKLV1-NLRKcqoWNKt4pFY4tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_024336_714043_8FBE4117 
X-CRM114-Status: GOOD (  14.04  )
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

From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

Currently, TCL performs the TX address search for each entry during
transmission, which may lead to packet delays.

To mitigate this issue, enable AST index-based address search during
transmission in station mode. This AST index-based search is not
enabled in AP mode due to the complexity involved in fetching peer
information.

Implement changes to retrieve the offset of ast_idx/ast_hash values
from the PEER_MAP3 event, update the vdev search type to ADDRX, and
enable AST lookup in the bank configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    | 10 +++++-----
 drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c |  6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index ad873013e46c..0291fbea6312 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -354,7 +354,10 @@ u32 ath12k_dp_tx_get_vdev_bank_config(struct ath12k_base *ab,
 			u32_encode_bits(0, HAL_TX_BANK_CONFIG_EPD);
 
 	/* only valid if idx_lookup_override is not set in tcl_data_cmd */
-	bank_config |= u32_encode_bits(0, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA)
+		bank_config |= u32_encode_bits(1, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
+	else
+		bank_config |= u32_encode_bits(0, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
 
 	bank_config |= u32_encode_bits(arvif->hal_addr_search_flags & HAL_TX_ADDRX_EN,
 					HAL_TX_BANK_CONFIG_ADDRX_EN) |
@@ -1107,11 +1110,8 @@ static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
 {
 	switch (arvif->ahvif->vdev_type) {
 	case WMI_VDEV_TYPE_STA:
-		/* TODO: Verify the search type and flags since ast hash
-		 * is not part of peer mapv3
-		 */
 		arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
-		arvif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
+		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
 		break;
 	case WMI_VDEV_TYPE_AP:
 	case WMI_VDEV_TYPE_IBSS:
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 706d766d8c81..e3923ff02dbd 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1330,6 +1330,8 @@ struct htt_t2h_version_conf_msg {
 #define HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16	GENMASK(15, 0)
 #define HTT_T2H_PEER_MAP_INFO1_HW_PEER_ID	GENMASK(31, 16)
 #define HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL	GENMASK(15, 0)
+#define HTT_T2H_PEER_MAP3_INFO2_HW_PEER_ID	GENMASK(15, 0)
+#define HTT_T2H_PEER_MAP3_INFO2_AST_HASH_VAL	GENMASK(31, 16)
 #define HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_M	BIT(16)
 #define HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_S	16
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 1abfbd15f13c..f83e34db83c0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1802,8 +1802,12 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 					     HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16);
 		ath12k_dp_get_mac_addr(le32_to_cpu(resp->peer_map_ev.mac_addr_l32),
 				       peer_mac_h16, mac_addr);
+		ast_hash = le32_get_bits(resp->peer_map_ev.info2,
+					 HTT_T2H_PEER_MAP3_INFO2_AST_HASH_VAL);
+		hw_peer_id = le32_get_bits(resp->peer_map_ev.info2,
+					   HTT_T2H_PEER_MAP3_INFO2_HW_PEER_ID);
 		ath12k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash,
-				      peer_id);
+				      hw_peer_id);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP2:

base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
-- 
2.17.1


