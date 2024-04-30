Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFF9C19F4F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR2S1D+7zab4VhFFndHQwPkoeFx0rCa61KfvTBUrGVo=; b=aeNNmXvL0hcUxRMvZuHuJg9LZi
	a2G6+WVHVCZA8vbAclKrsVvtThp/sioVW7ic7KOvIGBtrhU/esC2NYrB+pIvj9VlfkdR1DAI0HVGr
	qpfmMqFsJWESy9B48Xkg3wUh6ViVkTyW6eiYPhkt4IGIMyQ3z3X1E2+XF6p7mnUlmwZDaylyEn3CM
	t/6p060ea7Fxvx8/x7vEfMKvgZMxS1pQTaENuC54TKWKl9xwuQk8gb7pPQ51YyWGw46wb6XSJZX5r
	aEWshLh1L3tZv/uoYDeDEoFNGdSbn0+EqkK/F0c/V0FDY5zMQEUPvovJfPRQlY9RXyL1Y5QR3pGAd
	yKyH0jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qoT-00000007L8o-0UMh
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 16:58:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qoQ-00000007L6m-1W4E
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 16:58:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UDhqxr007544;
	Tue, 30 Apr 2024 16:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=BR2S1D+7zab4VhFFndHQwPkoeFx0rCa61KfvTBUrGVo=; b=m4
	y5nBL0a6afHwoxxLHZ9mCPYVupOBKkJMjF1ZxT9RgKKEFDeY9r5Z21929htDCBjl
	LTIQg+1ez2mVvI/DgQYWof4KASSloilqO+m2qKH4waIweQLlYnt9SgjCvwW1f21g
	dmmcQ5iYxnjhk82SAceVK66a5KpHmVKu+LP5TH6E81L4ojMn5L8XxXIy97BTspz1
	fSC8BTJAgtfNG3p71o5rdvwdAVTdOd6cB9rEe5GYkftzDqj1mQKy81GeBAkfGY7D
	QNmTZ/wlqkfoLULRdCfg7al7Phr0z7LOfHik+4VyaN9KcIj4WmvaDLCywyvve3ZK
	ds3KCy4AMoBZgVYp2QPg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtm3uk0yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:58:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UGwaUj024737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:58:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 09:58:34 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 4/4] wifi: ath12k: add multi device support for WBM idle ring buffer setup
Date: Tue, 30 Apr 2024 22:28:11 +0530
Message-ID: <20240430165811.1377182-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a47X6v1pBIoYfg7ECHu3Of7ZKIXZNYsD
X-Proofpoint-GUID: a47X6v1pBIoYfg7ECHu3Of7ZKIXZNYsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_10,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=869 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_095838_548490_5CAD729A 
X-CRM114-Status: GOOD (  11.61  )
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
index f41b3f9dac3d..72ea9baaf8d7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1589,6 +1589,24 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
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
@@ -1605,7 +1623,7 @@ int ath12k_dp_alloc(struct ath12k_base *ab)
 	spin_lock_init(&dp->reo_cmd_lock);
 
 	dp->reo_cmd_cache_flush_count = 0;
-	dp->idle_link_rbm = HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST;
+	dp->idle_link_rbm = ath12k_dp_get_idle_link_rbm(ab);
 
 	ret = ath12k_wbm_idle_ring_setup(ab, &n_link_desc);
 	if (ret) {
-- 
2.34.1


