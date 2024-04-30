Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523EC25B10
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRx07PeP42Xu6oKZNz8pFA5EA7fQkStcMuP0sznf570=; b=SZeYqoinvNT7F47XQrOrMn0Snp
	WsFOdcCZ5YknMHVWAHxUDqe7bAnxpd5yJTNUAayWyWf37x6P0FItNb36ubGg5rPSGGbDtWczhBQCp
	P92cemKst2hg8expl8FKXW6hRiWTTx0rjIYTs7SU/WGQOogTmoJC90J0aYtN7OYZiI9t7ZFbHiv4v
	yYyNuVck7TXHpxTGd2sXLSguTFMy8G6Z6NNSEKBBWPjypp3P5n84a2lZ+gHzLM/iGLaJfUbZOSAh6
	PKX+Tu/LiAakrNzX3uMQLF0QqvipLCEqMXAQ0tbuPQ839VJPWUP9nSPtgi7pU4sNVulgZYTHkE2vw
	3YI4ppAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLo-00000005BSb-1oDM
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 05:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLl-00000005BRG-2zKD
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 05:48:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U50tTF019456;
	Tue, 30 Apr 2024 05:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=gRx07PeP42Xu6oKZNz8pFA5EA7fQkStcMuP0sznf570=; b=iU
	07EfEXIB3MfWHFSN3U2mvawOi72ms+qW5ul5jUxRVF0qW5QCZ5KaQdLGZyRvrwWr
	yv8FED5ehNGgGne2odI7tSZEFKa7Mi5rZLV0ktyqzYNupMSoKOwZ1AjIfW++fizo
	ciVt8QSvfD4jnZEJJexEALd1Pof7nU1JOVQvvqlWm8xdSdWdOJ3UJ8HDGBPamu7Z
	jRbHRBiT/RH6FEH8ZOaqTy7tLVYv3Rk5u5kFl+dKRW2RK2NocnR6dN1v+W7Xgk7X
	2FG0X4huAgu4jFvYcj59EvqyIunXzJ+bbza5dOjiTRKnQY+QMWnLcDbV8e37TPBZ
	978X/K3LgcbOrmxjKZqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtaf2mngb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U5mKp8015407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:20 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 22:48:18 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 3/4] wifi: ath12k: use device index to advertise MLO parameter
Date: Tue, 30 Apr 2024 11:17:58 +0530
Message-ID: <20240430054759.722620-4-quic_periyasa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XqsYjIRN6b1env4eTNqavI2e0RSVC0JG
X-Proofpoint-GUID: XqsYjIRN6b1env4eTNqavI2e0RSVC0JG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_02,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_224821_789975_B9EF922B 
X-CRM114-Status: GOOD (  14.78  )
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

Device index parameter is used as unique identifier for devices involved
in Inter-device MLO. It is also used to configure the MLO parameter within
the QMI host capability send request. While currently set to zero, future
logic will be added for inter device support to populate this parameter
with non-zero values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b304895ee295..e82442540697 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1562,6 +1562,16 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->qmi.num_radios = U8_MAX;
 	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
 
+	/* Device index used to identify the devices in a group.
+	 *
+	 * In Intra-device MLO, only one device present in a group,
+	 * so it is always zero.
+	 *
+	 * In Inter-device MLO, Multiple device present in a group,
+	 * expect non-zero value.
+	 */
+	ab->device_id = 0;
+
 	return ab;
 
 err_free_wq:
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b37ab6244931..a9946f0f6bd8 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2041,7 +2041,7 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_capable_valid = 1;
 	req->mlo_capable = 1;
 	req->mlo_chip_id_valid = 1;
-	req->mlo_chip_id = 0;
+	req->mlo_chip_id = ab->device_id;
 	req->mlo_group_id_valid = 1;
 	req->mlo_group_id = 0;
 	req->max_mlo_peer_valid = 1;
@@ -2053,7 +2053,7 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_num_chips = 1;
 
 	info = &req->mlo_chip_info[0];
-	info->chip_id = 0;
+	info->chip_id = ab->device_id;
 	info->num_local_links = ab->qmi.num_radios;
 
 	for (i = 0; i < info->num_local_links; i++) {
-- 
2.34.1


