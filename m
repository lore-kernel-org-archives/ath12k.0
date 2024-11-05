Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA41AD3177F
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUU3cFi/DqXlj7chCzyg9IJQbxDlJYop7VnNjUMNe9A=; b=4Kjv6Vr73k4D2+SyoES5XNtG+t
	7KrV1lGRbs2F+N+VvO0IDSOfAmupdjyvxQEd+GwYUwDKwW3ADEqrDanymCldN1UJOoV6zI5eBs7EZ
	uO1Mua+F3s9B/JlPJoYofOalQWP/IHfi/kZQYU5d6rPJu4VLwB7oVng4U7lZik1TDOanCpyHV9W3n
	sUgS7zzD0n9PQjmpXyhMoKZYkAWr12OAK73SoaeKeItS5f/TGB0adNz8DWHSRhBB5Q/3Ji2pDganY
	a2WEBLBy3C+vOcN4gujORg2t9ZUxFAlw8MA5BmxI+RQjAMxqjFSXmL5pVcNRySjc23ZvYe6KnPeSC
	YIA+/g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NwA-00000000Jfx-2DOJ
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 18:05:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw0-00000000Jbr-0xOA
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 18:05:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59LldI009101;
	Tue, 5 Nov 2024 18:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUU3cFi/DqXlj7chCzyg9IJQbxDlJYop7VnNjUMNe9A=; b=LXexr+MqRnKC9lXg
	N7G3SSRk03CBjU7AwIb8+TZ0vNn7biWr/zFLpAxEDldkM0hpOqL2HQuQkykbdtED
	tde139cZ/r5tlJxWPU+dQVv73R0U7B1hNPwP9WFRj58h+riOzkQ2J/EaCdZm6u0u
	1ZoDBzJbMPROCq/jIwIkpWCtaLw2rZs2pskUqdMViM+zXzhTLAPUmOp9/+EDTJ2E
	WMrHPGFocQTzoJZyG1xTS87oRIGIn2FK5E5SlXrkREKWoj3oZmMWMZLBMKoY3nC5
	388XXFSR+kd+mdAjOAFyYt4Z6xOeYls6fI2TrNTHpu//bTctHTVxZ5TWUsQyAnjL
	4roXFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4urmwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:05:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5I5dOo009112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:05:39 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 10:05:35 -0800
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
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH v3 4/5] wifi: ath12k: Assign unique hardware link IDs during QMI host capability
Date: Tue, 5 Nov 2024 23:34:43 +0530
Message-ID: <20241105180444.770951-5-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-GUID: kgkoAMOQjHlQQ4KPhZXMu_qMt03_ak46
X-Proofpoint-ORIG-GUID: kgkoAMOQjHlQQ4KPhZXMu_qMt03_ak46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100544_440781_AAC6E641 
X-CRM114-Status: GOOD (  21.89  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

Currently, in the QMI host capability, the device index, the number of
local links, and the corresponding hardware link IDs are sent. The
hardware link ID assignment is based on the local variable `hw_link_id`,
which starts from 0 and ranges up to `num_local_links` in the device.
Starting from 0 is not ideal because it can result in the same link ID
being assigned to different devices in certain scenarios (e.g., split MAC).
Additionally, for multi link operations the firmware expects the hardware
link IDs in the same order as the Wireless Serial Interface (WSI)
connection.

Hence, for MLO to function seamlessly, the hardware link IDs across
devices need to be unique and should follow the order of the WSI
connection.

To address this, a previous change read the WSI index from the Device Tree
(DT) and stored it. Use this WSI index to determine the starting hardware
link IDs for each device, ensuring uniqueness and correct order across all
devices.

While at it, add debug prints to clearly show the MLO capability
advertisement sent during QMI host capability exchange.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/qmi.c  | 40 ++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 619407398a99..a532cfdc7558 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -845,11 +845,13 @@ struct ath12k_hw_group {
 	u8 num_hw;
 	bool mlo_capable;
 	struct device_node *wsi_node[ATH12K_MAX_SOCS];
+	bool hw_link_id_init_done;
 };
 
 /* Holds WSI info specific to each device, excluding WSI group info */
 struct ath12k_wsi_info {
 	u32 index;
+	u32 hw_link_id_base;
 };
 
 /* Master structure to hold the hw data which may be used in core module */
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 689171b7b19f..ab34f4788867 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2016,6 +2016,25 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
 	},
 };
 
+static void ath12k_host_cap_hw_link_id_init(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab, *partner_ab;
+	int i, j, hw_id_base;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		hw_id_base = 0;
+		ab = ag->ab[i];
+		for (j = 0; j < ag->num_devices; j++) {
+			partner_ab = ag->ab[j];
+			if (partner_ab->wsi_info.index >= ab->wsi_info.index)
+				continue;
+			hw_id_base += partner_ab->qmi.num_radios;
+		}
+		ab->wsi_info.hw_link_id_base = hw_id_base;
+	}
+	ag->hw_link_id_init_done = true;
+}
+
 static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 				     struct qmi_wlanfw_host_cap_req_msg_v01 *req)
 {
@@ -2060,7 +2079,17 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_num_chips_valid = 1;
 	req->mlo_num_chips = ag->num_devices;
 
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "MLO Capability advertisement:");
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * device_id: %d", req->mlo_chip_id);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * group_id: %d", req->mlo_group_id);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * num_devices: %d", req->mlo_num_chips);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * Devices info:");
+
 	mutex_lock(&ag->mutex_lock);
+
+	if (!ag->hw_link_id_init_done)
+		ath12k_host_cap_hw_link_id_init(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		info = &req->mlo_chip_info[i];
 		partner_ab = ag->ab[i];
@@ -2074,12 +2103,17 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 		info->chip_id = partner_ab->device_id;
 		info->num_local_links = partner_ab->qmi.num_radios;
 
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "MLO device id %d num_link %d\n",
-			   info->chip_id, info->num_local_links);
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "   * device_id: %d",
+			   info->chip_id);
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "     * num_links: %d",
+			   info->num_local_links);
 
 		for (j = 0; j < info->num_local_links; j++) {
-			info->hw_link_id[j] = hw_link_id;
+			info->hw_link_id[j] = partner_ab->wsi_info.hw_link_id_base + j;
 			info->valid_mlo_link_id[j] = 1;
+			ath12k_dbg(ab, ATH12K_DBG_QMI,
+				   "       * hw_link_id: %d\n",
+				   info->hw_link_id[j]);
 
 			hw_link_id++;
 		}
-- 
2.34.1


