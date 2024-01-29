Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF10C47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc8L+zh6LekZybqZ7+u/JVOV3mwJlzaeIdqeTTQmflQ=; b=0neHomV5aLJqAhiZYplEBrCDIB
	Yvf7aUDHCWNPpwy8MbyyNLJQovp5yo6BcKGwcd1A2tSS6tf2gt24M+7nelZP3SK7KOjH4HedS+sfT
	TbSFRnw5xrK1pvuySH9FjwPI9HW3Ep8Mf6tJFOiTB2CcCHiOzVcY0tW3GAagVHdnDBYwRXwV26//8
	DS+k01ZUZEQxJ8KfEUi0QSD2AxBoWJhC3slGIn+QvYA9Qxvp7HsSAuIsouW5b+3rojQsGVFoTbT0I
	waVxbnQVEaI2SZpm28M4uvqioinqZDTr++TWpuydIvnIHAp+zET9Q+EFKgE4YL7BhtccNGrktMFuP
	qnnaBiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOfq-0000000CBb9-2Uzr
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 10:15:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOfm-0000000CBXh-1yMD
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 10:15:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T4j1Wi005191;
	Mon, 29 Jan 2024 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Cc8L+zh6LekZybqZ7+u/JVOV3mwJlzaeIdqeTTQmflQ=; b=bj
	UHBQiMrRQZyzAvdr8gPWpx2uFaAzRhVYgMvqyi2V9lL1UbKrzp8Ttf2KIyNw4v3J
	euD77ixgl8BYkrC7wAntXdtTbnuRFEsKG2V/KhouiA/xRxUutH00KkT+G1pzEbqe
	7WsLEdAmfWsxt2PXP1Vc+o/jpUEZXSFB7Lw82s6ecraIKwjOOh5vgdHx07SgZdgt
	WLwoJGjVXDv9VBuNiiJuTIY963YQk2SlsD9Z7T3vV6IOzhhHcBWG6ywxplqXyUVx
	EU9QskzifkyXC+qeBzTIEl1it94Dg7RXdtJOu9DHvA9kwW1kY/svB8OiAogyK1Jh
	gNLG30pmUlcpIJkxh2fQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx3rqgqb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TAFODm027362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:24 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 02:15:22 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 08/11] wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
Date: Mon, 29 Jan 2024 18:14:50 +0800
Message-ID: <20240129101453.368494-9-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129101453.368494-1-quic_kangyang@quicinc.com>
References: <20240129101453.368494-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5vmgoFhafGBpW788eszfZcZNvMjnwvWb
X-Proofpoint-ORIG-GUID: 5vmgoFhafGBpW788eszfZcZNvMjnwvWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=980 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_021526_695787_D854CC68 
X-CRM114-Status: GOOD (  12.54  )
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

During calculate vdev_stats_id, will compare vdev_stats_id with
ATH12K_INVAL_VDEV_STATS_ID by '<='. If vdev_stats_id is relatively
small, then assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.

This logic is incorrect. Firstly, should use '>=' instead of '<=' to
check if this u8 variable exceeds the max valid range.

Secondly, should use the maximum value as comparison value.

Correct comparison symbols and use the maximum value
ATH12K_MAX_VDEV_STATS_ID for comparison.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v5: 
    1. rewrite commit log. 
    2. move position.
v4: new patch.

---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4ad23bc9381c..1377b710bdcb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5473,7 +5473,7 @@ ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
 	do {
 		if (ab->free_vdev_stats_id_map & (1LL << vdev_stats_id)) {
 			vdev_stats_id++;
-			if (vdev_stats_id <= ATH12K_INVAL_VDEV_STATS_ID) {
+			if (vdev_stats_id >= ATH12K_MAX_VDEV_STATS_ID) {
 				vdev_stats_id = ATH12K_INVAL_VDEV_STATS_ID;
 				break;
 			}
-- 
2.34.1


