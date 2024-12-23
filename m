Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2072BE7718E
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGehVTF7zvHWf49ABnoTQ81cLNNR/YoCUkt+Ee59IpI=; b=QQHMQRDnQtsXPf9omnYfYZDt2J
	y4aafhqOcoNUSmJAEcf0Oipsbq8AuW/eag8PSJsAdikv9JldcBJ9ezwMA0yWClXvzwWD2cJTRZ7/3
	6r8ntpcmhr2/EX6a4JLiNFzVRCWehRIUOk1OsrLgghrA4oodqqH8gmljxEXOoIDSy8epeilENpE7O
	T6FodZOq9zBrccs1FeNB1l8z93C1hIqkP/MW5Mn0NyGHfeWUoS01ioAdfXLWNVDkU4qKfjIM+XAD6
	3sCHNp+/xpppfTBsqiPT6KzSlULODRQjLs3+Clh7ZZ4y9SNSjZLste08mE/pUAvLiNa1Nn+qU69Lx
	7CtB0PdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlGT-0000000AOQ8-3dsf
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 16:26:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlBq-0000000ANS0-3nn5
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 16:21:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCatDi004224;
	Mon, 23 Dec 2024 16:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGehVTF7zvHWf49ABnoTQ81cLNNR/YoCUkt+Ee59IpI=; b=dOA+pAjusXvAEaLz
	mvFwanZaGY+eVHJY9W78oiomaNQAE6MorhPTfjSp6dYbi0HcH2GGp8hkrblTtZL5
	JIfxseAn/DaYFvsyz/ee2yyYKGRh5AlH2gcNLF4y8eIo1jYn6dwbGrmjUxviyo4b
	qnQrOm9g1q3Hi21laKHBpIIaIGdMd32BFxlyl1B8TP0WNeNwgsAFzQ1Ni0bgjVT1
	7PZYpxKMXPT+uBY/iniLYGQHFL64wClRXdQuZw8dTfXC6+LRNaCeoUl0s4OZGTdK
	RXJamf0cW13R5DgR4OcjpqbNG+eD1InmulV2lowdsBN5QnA9NY3HNVbDonG6NwwK
	3IKsrQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8168vns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNGLoOU021556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:50 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 08:21:48 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 23 Dec 2024 21:51:36 +0530
Subject: [PATCH 1/4] wifi: ath12k: update beacon template function to use
 arvif structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-ath12k_mlo_csa-v1-1-78b6d7515568@quicinc.com>
References: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
In-Reply-To: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0_F3w6VbgKH9ECMcHIBFpc-NT4um87Ip
X-Proofpoint-GUID: 0_F3w6VbgKH9ECMcHIBFpc-NT4um87Ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082155_078931_C12851AD 
X-CRM114-Status: GOOD (  13.97  )
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

The current code has ath12k_wmi_bcn_tmpl() accepting separate ar and
vdev_id parameters. However, ath12k_link_vif structure can be used to
derive both of these.

Hence, simplify the function signature.

Later change needs arvif pointer access within the function hence it is
better if arvif is directly passed now.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 +++-
 drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6f10813d937820476afe8084ec4030b8eb9548a0..9420566952faecc02356e885bee138d3ba79b097 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1579,8 +1579,7 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 
 		ema_args.bcn_cnt = beacons->cnt;
 		ema_args.bcn_index = i;
-		ret = ath12k_wmi_bcn_tmpl(tx_arvif->ar, tx_arvif->vdev_id,
-					  &beacons->bcn[i].offs,
+		ret = ath12k_wmi_bcn_tmpl(tx_arvif, &beacons->bcn[i].offs,
 					  beacons->bcn[i].skb, &ema_args);
 		if (ret) {
 			ath12k_warn(tx_arvif->ar->ab,
@@ -1674,7 +1673,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 		}
 	}
 
-	ret = ath12k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, NULL);
+	ret = ath12k_wmi_bcn_tmpl(arvif, &offs, bcn, NULL);
 
 	if (ret)
 		ath12k_warn(ab, "failed to submit beacon template command: %d\n",
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 562b0615ed065d094f5d7709cafeb22c41f02d17..d06ab4db7db40219bd30079b4eb048f20637d42d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1888,14 +1888,16 @@ int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
 	return ret;
 }
 
-int ath12k_wmi_bcn_tmpl(struct ath12k *ar, u32 vdev_id,
+int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn,
 			struct ath12k_wmi_bcn_tmpl_ema_arg *ema_args)
 {
+	struct ath12k *ar = arvif->ar;
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct wmi_bcn_tmpl_cmd *cmd;
 	struct ath12k_wmi_bcn_prb_info_params *bcn_prb_info;
+	u32 vdev_id = arvif->vdev_id;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
 	u32 ema_params = 0;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b6a197389277b4520bd3fb20b21a504092680531..742fdea272cb7a47b41d4446e1a3865f83827456 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5640,7 +5640,7 @@ int ath12k_wmi_mgmt_send(struct ath12k *ar, u32 vdev_id, u32 buf_id,
 			 struct sk_buff *frame);
 int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
 			     const u8 *p2p_ie);
-int ath12k_wmi_bcn_tmpl(struct ath12k *ar, u32 vdev_id,
+int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn,
 			struct ath12k_wmi_bcn_tmpl_ema_arg *ema_args);

-- 
2.34.1


