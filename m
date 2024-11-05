Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696A9D3177C
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDNJWPTCdrXeNEdrAJyKZXzGzAiq1Z4H2g2Bwj3ax98=; b=XnYlMFuLEPS7aMeUJc2WdaF9ly
	rJweoCPdlZrGqzVaPQPGCNOYwkrYgGTC34V57+aCjLWd/MIAOe+MB18Z4VrVeFD0BsgQhLZ+0npQ+
	Ka3Zmt9/qKl5M4mCzuEAWBZ0nvuWtVMNGQhbtly75H8Cvp8vMtiI0LZZ4DneFzNFzuItRpwQ/7LSM
	OFNFShtG8F2icB3LehfRSckYo08TO3RcV1EblwegZPLUlgHY6zFjt1MIgKOH8TCFzJkjBp7Zmgj5p
	/3Yv9Ck9ujBJBlnLx1xXv0QORC0tBnJRHnUEBIPWRRAO9pzEWf0HHY3sGczMRxRwJIIFuV9VHyLC2
	hr9yUrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw9-00000000Jf4-0JnV
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 18:05:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nvr-00000000Jb0-47mG
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 18:05:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59cDm0009331;
	Tue, 5 Nov 2024 18:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDNJWPTCdrXeNEdrAJyKZXzGzAiq1Z4H2g2Bwj3ax98=; b=kYaoqOR3tRxTbstK
	w3MsUjwaQSF6UGhMTc95ZFiBWNUz/OV78FFPQIkyYrckMoz939f1KtK2brNXVBfH
	+nGdP+4uHzjOxU7eXit2rK4ZAqIhVQhDfiaHeGnGa+nvp91Khpt8qWkY3CUyPwoy
	CuzEG39iXm+OgNQg+uAPsonK7zAqTqyB/m2YMZYiSYJO3v2Q9Ufse6/VDaBSVsJv
	jQj0t2W0ooi+2tClLY0WEZ35ghyaeXZyKcRi8XqBRvyWOVhmFak/f3k2iSdhP9t4
	OtXW6LKCniEMkB6n0eIti9r8wYcufxD1Qp/dFwnsBV4QaAxaIpVnaEApNO6vKNsD
	moWTcA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4urmw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:05:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5I5Ukm022917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:05:30 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 10:05:26 -0800
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
        Harshitha Prem <quic_hprem@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH v3 2/5] wifi: ath12k: Parse multiple device information from device tree
Date: Tue, 5 Nov 2024 23:34:41 +0530
Message-ID: <20241105180444.770951-3-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-GUID: L9v7LEHckbNyi83G3d-Whk8vsPNU504D
X-Proofpoint-ORIG-GUID: L9v7LEHckbNyi83G3d-Whk8vsPNU504D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100536_197396_7A1E1490 
X-CRM114-Status: GOOD (  30.15  )
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

From: Harshitha Prem <quic_hprem@quicinc.com>

Currently, a single device is part of the device group abstraction.
However, for multi-link operations, multiple devices need to be combined.
This multi-device grouping is done via WSI (WLAN Serial Interface), which
is described in the device tree. Information about different WSI groups
and the number of devices involved in each group can be parsed from the
device tree.

Add changes to parse the device tree and determine WSI information, such
as the different WSI groups and the number of devices per WSI group.
Assign WSI index zero to the WSI controller device (to synchronize the
clock among the devices within the WSI group), and increment the WSI index
of each device in the order of the WSI connection.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Co-developed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 178 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/core.h |   8 ++
 2 files changed, 173 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3f0f44cbdb4c..4170d7fcd438 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -9,6 +9,7 @@
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
@@ -1389,20 +1390,24 @@ bool ath12k_core_hw_group_create_ready(struct ath12k_hw_group *ag)
 }
 
 static struct ath12k_hw_group *
-ath12k_core_hw_group_alloc(u8 id, u8 max_devices)
+ath12k_core_hw_group_alloc(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag;
+	int count = 0;
 
 	lockdep_assert_held(&ath12k_ag_list_lock);
 
+	list_for_each_entry(ag, &ath12k_hw_group_list, list)
+		count++;
+
 	ag = kzalloc(sizeof(*ag), GFP_KERNEL);
 	if (!ag)
 		return NULL;
 
-	ag->id = id;
-	ag->num_devices = max_devices;
+	ag->id = count;
 	list_add(&ag->list, &ath12k_hw_group_list);
 	mutex_init(&ag->mutex_lock);
+	ag->mlo_capable = false;
 
 	return ag;
 }
@@ -1417,34 +1422,173 @@ static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
 	mutex_unlock(&ath12k_ag_list_lock);
 }
 
+static struct ath12k_hw_group *
+ath12k_core_hw_group_find_by_DT(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag;
+	int i;
+
+	if (!ab->dev->of_node)
+		return NULL;
+
+	list_for_each_entry(ag, &ath12k_hw_group_list, list)
+		for (i = 0; i < ag->num_devices; i++)
+			if (ag->wsi_node[i] == ab->dev->of_node)
+				return ag;
+
+	return NULL;
+}
+
+static int ath12k_core_get_wsi_info(struct ath12k_hw_group *ag,
+				    struct ath12k_base *ab)
+{
+	struct device_node *wsi_dev = ab->dev->of_node, *next_wsi_dev;
+	struct device_node *tx_endpoint, *next_rx_endpoint;
+	int device_count = 0;
+
+	next_wsi_dev = wsi_dev;
+
+	if (!next_wsi_dev)
+		return -ENODEV;
+
+	do {
+		ag->wsi_node[device_count] = next_wsi_dev;
+
+		tx_endpoint = of_graph_get_endpoint_by_regs(next_wsi_dev, 0, -1);
+		if (!tx_endpoint) {
+			of_node_put(next_wsi_dev);
+			return -ENODEV;
+		}
+
+		next_rx_endpoint = of_graph_get_remote_endpoint(tx_endpoint);
+		if (!next_rx_endpoint) {
+			of_node_put(next_wsi_dev);
+			of_node_put(tx_endpoint);
+			return -ENODEV;
+		}
+
+		of_node_put(tx_endpoint);
+		of_node_put(next_wsi_dev);
+		next_wsi_dev = of_graph_get_port_parent(next_rx_endpoint);
+		if (!next_wsi_dev) {
+			of_node_put(next_rx_endpoint);
+			return -ENODEV;
+		}
+		of_node_put(next_rx_endpoint);
+
+		device_count++;
+		if (device_count > ATH12K_MAX_SOCS) {
+			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
+				    device_count, ATH12K_MAX_SOCS);
+			of_node_put(next_wsi_dev);
+			return -EINVAL;
+		}
+	} while (wsi_dev != next_wsi_dev);
+
+	of_node_put(next_wsi_dev);
+	ag->num_devices = device_count;
+
+	return 0;
+}
+
+static int ath12k_core_get_wsi_index(struct ath12k_hw_group *ag,
+				     struct ath12k_base *ab)
+{
+	int i, wsi_controller_index = -1, node_index = -1;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		if (of_property_read_bool(ag->wsi_node[i], "qcom,wsi-controller"))
+			wsi_controller_index = i;
+		if (ag->wsi_node[i] == ab->dev->of_node)
+			node_index = i;
+	}
+
+	if (wsi_controller_index == -1) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "WSI controller is not defined in DT");
+		return -EINVAL;
+	}
+
+	if (node_index == -1) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "unable to get WSI node index");
+		return -EINVAL;
+	}
+
+	ab->wsi_info.index = (ag->num_devices + node_index - wsi_controller_index) %
+		ag->num_devices;
+
+	return 0;
+}
+
 static struct ath12k_hw_group *ath12k_core_assign_hw_group(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag;
-	u32 group_id = ATH12K_INVALID_GROUP_ID;
+	struct ath12k_wsi_info *wsi = &ab->wsi_info;
 
 	lockdep_assert_held(&ath12k_ag_list_lock);
 
 	/* The grouping of multiple devices will be done based on device tree file.
-	 * TODO: device tree file parsing to know about the devices involved in group.
-	 *
-	 * The platforms that do not have any valid group information would have each
-	 * device to be part of its own invalid group.
+	 * The platforms that do not have any valid group information would have
+	 * each device to be part of its own invalid group.
 	 *
-	 * Currently, we are not parsing any device tree information and hence, grouping
-	 * of multiple devices is not involved. Thus, single device is added to device
-	 * group.
+	 * We use group id ATH12K_INVALID_GROUP_ID for single device group
+	 * which didn't have dt entry or wrong dt entry, there could be many
+	 * groups with same group id, i.e ATH12K_INVALID_GROUP_ID. So
+	 * default group id of ATH12K_INVALID_GROUP_ID combined with
+	 * num devices in ath12k_hw_group determines if the group is
+	 * multi device or single device group
 	 */
-	ag = ath12k_core_hw_group_alloc(group_id, 1);
+
+	ag = ath12k_core_hw_group_find_by_DT(ab);
+	if (!ag) {
+		ag = ath12k_core_hw_group_alloc(ab);
+		if (!ag) {
+			ath12k_warn(ab, "unable to create new hw group\n");
+			return NULL;
+		}
+
+		if (ath12k_core_get_wsi_info(ag, ab) ||
+		    ath12k_core_get_wsi_index(ag, ab)) {
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "unable to get WSI Info from DT, grouping single device");
+			ag->id = ATH12K_INVALID_GROUP_ID;
+			ag->num_devices = 1;
+			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
+			wsi->index = 0;
+		}
+		goto exit;
+	} else if (test_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags)) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "group id %d in unregister state\n",
+			   ag->id);
+		goto invalid_group;
+	} else {
+		if (ath12k_core_get_wsi_index(ag, ab))
+			goto invalid_group;
+		goto exit;
+	}
+
+invalid_group:
+	ag = ath12k_core_hw_group_alloc(ab);
 	if (!ag) {
 		ath12k_warn(ab, "unable to create new hw group\n");
 		return NULL;
 	}
+	ag->id = ATH12K_INVALID_GROUP_ID;
+	ag->num_devices = 1;
+	wsi->index = 0;
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "Single device is added to hardware group\n");
 
+exit:
+	if (ag->num_probed >= ag->num_devices) {
+		ath12k_warn(ab, "unable to add new device to group, max limit reached\n");
+		goto invalid_group;
+	}
 	ab->device_id = ag->num_probed++;
 	ag->ab[ab->device_id] = ab;
 	ab->ag = ag;
-	ag->mlo_capable = false;
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT,
+		   "WSI info: group-id: %d, num-devices: %d, index: %d",
+		   ag->id, ag->num_devices, wsi->index);
 
 	return ag;
 }
@@ -1511,6 +1655,14 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
 		return;
 
 	mutex_lock(&ag->mutex_lock);
+
+	if (test_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags)) {
+		mutex_unlock(&ag->mutex_lock);
+		return;
+	}
+
+	set_bit(ATH12K_GROUP_FLAG_UNREGISTER, &ag->flags);
+
 	ath12k_core_hw_group_stop(ag);
 
 	for (i = 0; i < ag->num_devices; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index cde35616ba56..619407398a99 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -211,6 +211,7 @@ enum ath12k_scan_state {
 
 enum ath12k_hw_group_flags {
 	ATH12K_GROUP_FLAG_REGISTERED,
+	ATH12K_GROUP_FLAG_UNREGISTER,
 };
 
 enum ath12k_dev_flags {
@@ -843,6 +844,12 @@ struct ath12k_hw_group {
 	struct ath12k_hw *ah[ATH12K_GROUP_MAX_RADIO];
 	u8 num_hw;
 	bool mlo_capable;
+	struct device_node *wsi_node[ATH12K_MAX_SOCS];
+};
+
+/* Holds WSI info specific to each device, excluding WSI group info */
+struct ath12k_wsi_info {
+	u32 index;
 };
 
 /* Master structure to hold the hw data which may be used in core module */
@@ -1026,6 +1033,7 @@ struct ath12k_base {
 	struct notifier_block panic_nb;
 
 	struct ath12k_hw_group *ag;
+	struct ath12k_wsi_info wsi_info;
 
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
-- 
2.34.1


