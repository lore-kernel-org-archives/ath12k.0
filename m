Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E1AC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 05:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/3ZE7OKDAMMRzmdSaJRPraIPqXd9bNiUxmfhwEheS8=; b=lvCOd8SORstYstuZoM1SzoQJF+
	JKeKgGNKcJqiizhW6bBE56lQq4A7ORo/lV86EVLDib5+cTGL9+sMBrCPgroGNyMjW0QmeVjoTelxI
	OcCkBknqzq+ggkeRcIXNDz6V8hFQnsNT/wYgzjDLPJQWGUsjYDrpVeiO5Vii8TmCNzJbwx0VX4EAg
	VFV7qDB4KCmvPSrxc/uSxgmve0No6Y++XpiBSiAr/UuJinZjncZ12kLy/ckI92qvNjs1iAw7mQT2j
	7WsqFgYonasmGmKsslBNCKeh6QBPwkBULG10HcTj2uow++Cy5UEOQi9XhAsXwkE35EcOWf9HzNzuE
	grMYJRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLr-00000005BTL-0bBc
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 05:48:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLn-00000005BSC-3WBT
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 05:48:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U4T7tu032242;
	Tue, 30 Apr 2024 05:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2/3ZE7OKDAMMRzmdSaJRPraIPqXd9bNiUxmfhwEheS8=; b=TF
	HvqNzEyODf7/nOrLBNL7gSu9hss/dXx7ncV2WfskDZllbQCyPB+KCUQJgJPNc2jr
	A+f4myrBJ724W/Tmq7o9DpzBomiiLWr5uLiGd79F+44AI/HcyyWSte7mPvD02M+7
	iI11o5LyAMAgOtMJ6vvzURotnG4CLZmAU/bYqLSvC7tQVn0/YaydJ9OQfm38r3VO
	vcjQJugwWYrONYgXEAMilsScqzJ8FQt0jbIhnl8T6j1T5RmXqeTPxi2L0Z0rAbJs
	e/+Vslcj/H0lCy6qRSUO0e5GcMzsADs6uyXXhB40Sf77ifkEwbEMS1yBGMNlKNv8
	XypvHBZmpeLvCzwB1RNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtsnm86qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U5mM1d013474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:22 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 22:48:20 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 4/4] wifi: ath12k: add multi device support for WBM idle ring buffer setup
Date: Tue, 30 Apr 2024 11:17:59 +0530
Message-ID: <20240430054759.722620-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430054759.722620-1-quic_periyasa@quicinc.com>
References: <20240430054759.722620-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 18cwh1pTeIiJbfYCi865oOBF-b8xMb6K
X-Proofpoint-ORIG-GUID: 18cwh1pTeIiJbfYCi865oOBF-b8xMb6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_02,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=869 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_224823_915903_C78EC642 
X-CRM114-Status: GOOD (  11.90  )
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

Currently, inter device MLO is not supported. Therefore, the WBM idle ring
buffers choose the implicit return buffer manager (DEV0_IDLE_DESC_LIST).
However, this implicit return buffer manager design not meeting the
requirements to support inter device MLO. In inter device MLO, multiple
devices participate. The device specific WBM idle ring buffers transmit
to multiple device REO rings. To distinguish between device specific WBM
idle buffers, the setup configuration need to choose a different return
buffer manager based on the unique identifier (device index).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 9b9e86cdb380..5812df436d53 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1582,6 +1582,24 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 	return 0;
 }
 
+static enum hal_rx_buf_return_buf_manager
+ath12k_dp_get_idle_link_rbm(struct ath12k_base *ab)
+{
+	switch (ab->device_id) {
+	case 0:
+		return HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST;
+	case 1:
+		return HAL_RX_BUF_RBM_WBM_DEV1_IDLE_DESC_LIST;
+	case 2:
+		return HAL_RX_BUF_RBM_WBM_DEV2_IDLE_DESC_LIST;
+	default:
+		ath12k_warn(ab, "invalid %d device id, so choose default rbm\n",
+			    ab->device_id);
+		WARN_ON(1);
+		return HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST;
+	}
+}
+
 int ath12k_dp_alloc(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
@@ -1598,7 +1616,7 @@ int ath12k_dp_alloc(struct ath12k_base *ab)
 	spin_lock_init(&dp->reo_cmd_lock);
 
 	dp->reo_cmd_cache_flush_count = 0;
-	dp->idle_link_rbm = HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST;
+	dp->idle_link_rbm = ath12k_dp_get_idle_link_rbm(ab);
 
 	ret = ath12k_wbm_idle_ring_setup(ab, &n_link_desc);
 	if (ret) {
-- 
2.34.1


