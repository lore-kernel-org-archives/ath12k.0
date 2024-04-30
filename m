Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC9BC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoG6O88QwWOX2mC7RY8Vl2PhxJ61CVCdrGl5iBudFXE=; b=unvTf60vvlTzN6pkzGyeP+kCRA
	TQUkZBwE2Y/BCI/VhaxISPqYw8X4xXcOOs4dTDanIHLYWjQ96p0SnDSnujlotNxlqDTBz4ecoc8hw
	/n5jFdhjG05MnXauTEz7m6h+RPBFmvVjwfO4Y53hXeDhs+KJU0MXL/PgxZTgh3ufEtWb6FW+WjSsN
	R+479y/cRc5EEk3bW98/Z9hM3KjfV2Kq9cgq7hnDV2vTzYNb5BwHbzOq6uuKk7XwPWPW25k7vc76t
	Xv1vuADnfFX54ibzvdAIpK/bjZw8LnE91QmhoaHKLFnnBKLUX26K5nthghJnVjVSeBuoWRvZmp+3y
	PpfAUhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZe-00000005mQf-1r12
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 09:14:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZc-00000005mMo-19Yh
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 09:14:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U5rkat023778;
	Tue, 30 Apr 2024 09:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=xoG6O88QwWOX2mC7RY8Vl2PhxJ61CVCdrGl5iBudFXE=; b=Dq
	YJf0u5aO1PAAEy26hrw3+97oBSwRCrh1IP9WSpyhoJ0iTZqQi2HKuTT+WGtxAYtJ
	wXKV3hGj1SY4gN1cnmNrT6c3ho3lEKMoCZP/Ye81Yp0EpGuUtaNFhG3fSHCCHT/c
	wklvnOJ6nSP3vw+hJ8eikCwBVIQ27Re1CHItIbaFKlSmqKPy3pDRtpvUyDhYckpU
	tCdz4y3hIXMef36SHUjh/ZqRkq3qG9vH14WCk4oWmlb3gfWcXDLHwW1RXTqHlDRK
	TJK9djRHlUXahvFyOgNOv1pYlz6Nm6CWc2ob6hPRRglOYWFilcXstp4vSsCsc5Qt
	LptW+PiJWZj85DVohrCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xttw3gdm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U9EaXQ018985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:36 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 02:14:34 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv4 3/3] wifi: ath12k: Remove unused tcl_*_ring configuration
Date: Tue, 30 Apr 2024 14:44:14 +0530
Message-ID: <20240430091414.2486196-4-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
References: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qh35rVjCgoTZcVRmrecfPMetPTAfTww9
X-Proofpoint-ORIG-GUID: qh35rVjCgoTZcVRmrecfPMetPTAfTww9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=1
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=955 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_021452_447027_E9E88B95 
X-CRM114-Status: GOOD (  12.90  )
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

Currently memory allocation for multiple hardware rings done
in host as these memory will be used by firmware/hardware.
But in case of tcl_cmd_ring and tcl_status_ring neither firmware
nor hardware uses host allocated memory and it uses memory
allocated by firmware itself. So avoid tcl_cmd_ring and
tcl_status_ring setup in host.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 16 ----------------
 drivers/net/wireless/ath/ath12k/dp.h |  2 --
 2 files changed, 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 963b9ad4dc82..d91d5c308210 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -457,8 +457,6 @@ static void ath12k_dp_srng_common_cleanup(struct ath12k_base *ab)
 		ath12k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
 		ath12k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
 	}
-	ath12k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
-	ath12k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
 	ath12k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
 }
 
@@ -479,20 +477,6 @@ static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 		goto err;
 	}
 
-	ret = ath12k_dp_srng_setup(ab, &dp->tcl_cmd_ring, HAL_TCL_CMD, 0, 0,
-				   DP_TCL_CMD_RING_SIZE);
-	if (ret) {
-		ath12k_warn(ab, "failed to set up tcl_cmd ring :%d\n", ret);
-		goto err;
-	}
-
-	ret = ath12k_dp_srng_setup(ab, &dp->tcl_status_ring, HAL_TCL_STATUS,
-				   0, 0, DP_TCL_STATUS_RING_SIZE);
-	if (ret) {
-		ath12k_warn(ab, "failed to set up tcl_status ring :%d\n", ret);
-		goto err;
-	}
-
 	for (i = 0; i < ab->hw_params->max_tx_ring; i++) {
 		map = ab->hw_params->hal_ops->tcl_to_wbm_rbm_map;
 		tx_comp_ring_num = map[i].wbm_ring_num;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5cf0d21ef184..21afdb51b6e6 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -327,8 +327,6 @@ struct ath12k_dp {
 	struct dp_link_desc_bank link_desc_banks[DP_LINK_DESC_BANKS_MAX];
 	struct dp_srng wbm_idle_ring;
 	struct dp_srng wbm_desc_rel_ring;
-	struct dp_srng tcl_cmd_ring;
-	struct dp_srng tcl_status_ring;
 	struct dp_srng reo_reinject_ring;
 	struct dp_srng rx_rel_ring;
 	struct dp_srng reo_except_ring;
-- 
2.34.1


