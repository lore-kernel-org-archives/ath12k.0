Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5098D3177D
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZ6szvlA0Ilv5PHdmu4JIiqAYVgmeX9bYSCSHXNxfuA=; b=pk8uA3dZglzf0jQ1xLP7cPX39N
	HC8WOYqRmK+rST+HUkMez81hBXBIpZhrm74BQwIt8Vn+LY0MI+GLbf3a6h03muHT3Ox5xr+6803Nx
	zNMHsO4C49faUnc63wNLW+v/hJJ1TEs2fGD3P2hvP8mJkWopexRnMiJSqfNQyYspu5gojd2/PKtlF
	+nowzTi80R3WP/wIm/hufEnS1RD/hEeMoQtQAdWfqSic/DUs/7aj4twNwQBCgPWmAE9/zpv5FNs3r
	oi+wmnAlL6S1l6YFEe0dY7L9VRYnNIk9WTfIF3V+v2dTrUlWIryxT/7S+XwxaJeszr25n9TCRNrVP
	dxJ2RFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw9-00000000JfG-2F1o
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 18:05:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nvv-00000000JbS-3mbK
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 18:05:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5FUm3q013150;
	Tue, 5 Nov 2024 18:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ6szvlA0Ilv5PHdmu4JIiqAYVgmeX9bYSCSHXNxfuA=; b=cxxcuey1Hs0PMyo3
	b5b+FuIuJbT9O6eI1CA4Xs3OaTbk6THVSAjyFyNIiB8x6EgUMUINlFGsf4hjENm7
	kg21V3FLVzlVhLZxhR5S1r8GnwZ2fSvJ4/9oSQ/SdX6laV6qpWfr3N9+ly3bW+PN
	mkbzc7Rhv7unbzW97PkkiwxH/BW2pdXvfPcJAzzpTLI5lc2OC4U+6qDi1TR98Vw7
	Gi65R1WiQpJ03YBd7Oz8503z1FZCYVPWt60qbR+4hpNgfWRciZW6EKESx7wtmhiL
	Od9+uq8O7AgHNPCf5f3D66+jwS0PrTPbMgzGT9TevHUHxH/nt3ByHxmPaVyFSkWX
	dwnMQg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rrfbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:05:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5I5ZYD009069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:05:35 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 10:05:31 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH v3 3/5] wifi: ath12k: Send partner device details in QMI MLO capability
Date: Tue, 5 Nov 2024 23:34:42 +0530
Message-ID: <20241105180444.770951-4-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nBqpx6xclnKTEEd-pcWftTKIqxK63n9G
X-Proofpoint-ORIG-GUID: nBqpx6xclnKTEEd-pcWftTKIqxK63n9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100540_107840_FBB75D49 
X-CRM114-Status: GOOD (  19.96  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, QMI MLO host capability is sent with the details of
local links and hw_link id only for particular device but in case
of multi device group abstraction, it has to include the details
of hw_link_id, num_local_links of every partner device that is
involved in the group during QMI MLO capability exchange.

Add changes to send partner device details in QMI MLO capability
exchange.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 86 ++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5ebfe13b5313..689171b7b19f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2016,17 +2016,19 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
 	},
 };
 
-static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
-				      struct qmi_wlanfw_host_cap_req_msg_v01 *req)
+static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
+				     struct qmi_wlanfw_host_cap_req_msg_v01 *req)
 {
 	struct wlfw_host_mlo_chip_info_s_v01 *info;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_base *partner_ab;
 	u8 hw_link_id = 0;
-	int i;
+	int i, j, ret;
 
-	if (!ab->ag->mlo_capable) {
+	if (!ag->mlo_capable) {
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "MLO is disabled hence skip QMI MLO cap");
-		return;
+		return 0;
 	}
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
@@ -2035,7 +2037,13 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "skip QMI MLO cap due to invalid num_radio %d\n",
 			   ab->qmi.num_radios);
-		return;
+		return 0;
+	}
+
+	if (ab->device_id == ATH12K_INVALID_DEVICE_ID) {
+		ath12k_err(ab, "failed to send MLO cap due to invalid device id\n");
+		ret = -EINVAL;
+		return ret;
 	}
 
 	req->mlo_capable_valid = 1;
@@ -2043,27 +2051,71 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_chip_id_valid = 1;
 	req->mlo_chip_id = ab->device_id;
 	req->mlo_group_id_valid = 1;
-	req->mlo_group_id = 0;
+	req->mlo_group_id = ag->id;
 	req->max_mlo_peer_valid = 1;
 	/* Max peer number generally won't change for the same device
 	 * but needs to be synced with host driver.
 	 */
 	req->max_mlo_peer = ab->hw_params->max_mlo_peer;
 	req->mlo_num_chips_valid = 1;
-	req->mlo_num_chips = 1;
+	req->mlo_num_chips = ag->num_devices;
 
-	info = &req->mlo_chip_info[0];
-	info->chip_id = ab->device_id;
-	info->num_local_links = ab->qmi.num_radios;
+	mutex_lock(&ag->mutex_lock);
+	for (i = 0; i < ag->num_devices; i++) {
+		info = &req->mlo_chip_info[i];
+		partner_ab = ag->ab[i];
+
+		if (partner_ab->device_id == ATH12K_INVALID_DEVICE_ID) {
+			ath12k_err(ab, "failed to send MLO cap due to invalid partner device id\n");
+			ret = -EINVAL;
+			goto device_cleanup;
+		}
+
+		info->chip_id = partner_ab->device_id;
+		info->num_local_links = partner_ab->qmi.num_radios;
 
-	for (i = 0; i < info->num_local_links; i++) {
-		info->hw_link_id[i] = hw_link_id;
-		info->valid_mlo_link_id[i] = 1;
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "MLO device id %d num_link %d\n",
+			   info->chip_id, info->num_local_links);
 
-		hw_link_id++;
+		for (j = 0; j < info->num_local_links; j++) {
+			info->hw_link_id[j] = hw_link_id;
+			info->valid_mlo_link_id[j] = 1;
+
+			hw_link_id++;
+		}
 	}
 
+	if (hw_link_id <= 0)
+		ag->mlo_capable = false;
+
 	req->mlo_chip_info_valid = 1;
+
+	mutex_unlock(&ag->mutex_lock);
+	return 0;
+
+device_cleanup:
+	for (i = i - 1; i >= 0; i--) {
+		info = &req->mlo_chip_info[i];
+
+		memset(info, 0, sizeof(*info));
+	}
+
+	req->mlo_num_chips = 0;
+	req->mlo_num_chips_valid = 0;
+
+	req->max_mlo_peer = 0;
+	req->max_mlo_peer_valid = 0;
+	req->mlo_group_id = 0;
+	req->mlo_group_id_valid = 0;
+	req->mlo_chip_id = 0;
+	req->mlo_chip_id_valid = 0;
+	req->mlo_capable = 0;
+	req->mlo_capable_valid = 0;
+
+	ag->mlo_capable = false;
+	mutex_unlock(&ag->mutex_lock);
+
+	return ret;
 }
 
 static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
@@ -2111,7 +2163,9 @@ static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 		req.nm_modem |= PLATFORM_CAP_PCIE_GLOBAL_RESET;
 	}
 
-	ath12k_host_cap_parse_mlo(ab, &req);
+	ret = ath12k_host_cap_parse_mlo(ab, &req);
+	if (ret < 0)
+		goto out;
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
-- 
2.34.1


