Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88349C47073
	for <ath12k@archiver.kernel.org>; Thu,  4 Jan 2024 03:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9v2ZP1k0c5hthkxa9jD80MJ9s4xzIMCTnZvo+O4jYs=; b=E4YdQqD1H3zuB9GOSmU1FsULMo
	3YyUES2vSVXwN/OFmN0owHiNEcRKQmugau+YB1sPir11jfYRZd4om4vo2XZbtBly2m0TphnCMBQf3
	g4tLn0AL2Zs5dSklR4v/jmBKOie90esytVQVU7Qoj6eug5dihJbOX7uLpiDDCdWtwsglkFQN3z2Pn
	yJTiXR31kqazvi8lQ7Y4MZatmAG5e9yHYioJePllv5+HghkSAtNgvGnJp2TUa4nECpYNRoAqYrT8H
	Sex0o5AAYePlT5Cr1I2ZVUTzaDentSIeY92e5gOawA+6jKG1t4fjDh/DEgUEzGJ1bDu3ES2/BQcUj
	C4WubWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLECn-00CiJK-0J
	for ath12k@archiver.kernel.org;
	Thu, 04 Jan 2024 03:15:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLECj-00CiFg-2U;
	Thu, 04 Jan 2024 03:15:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4042l1PH017866;
	Thu, 4 Jan 2024 03:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=F9v2ZP1k0c5hthkxa9jD80MJ9s4xzIMCTnZvo+O4jYs=; b=VU
	Nu6a7ZiA75gAi+ab+UPphAqF5FaHFvgxR7ly6KLQk1LZ5KW56vGl/luCcIKUgjGf
	yNLmA5WmlS7ln7xzXa7OJQL0XAg/7sJ1cJYzjsTKPwkAJcvOseFsuowWmUkQSuZg
	j+kRVJdqmZgsz4iDixVv2+ei3U4QrA5a9QPZeV8Nn/ievsIqqzW4QR9shEfrbvSF
	8oCb9i4VSPjIsdP9muIH9j/onGX8PPWpt4nfabIrGd9I2yqOqsr881mrxyC9UorL
	XSvYqssJTRXInpLhKTM+bt6NDDE1yMR7pccC7Ly4s9FYoqcXCHQNSbls7WRNIqKd
	HP1J6rANFsWWaR4QICzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd37yaekt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 03:15:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4043FV2Z012765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 03:15:31 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 3 Jan 2024 19:15:29 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP
Date: Thu, 4 Jan 2024 08:45:09 +0530
Message-ID: <20240104031509.366302-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104031509.366302-1-quic_periyasa@quicinc.com>
References: <20240104031509.366302-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Sw3QULprTVk3KI_Szw6H58Pbu4xUZ34v
X-Proofpoint-ORIG-GUID: Sw3QULprTVk3KI_Szw6H58Pbu4xUZ34v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=926 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_191533_931344_E5EF01F8 
X-CRM114-Status: GOOD (  15.86  )
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

ENOTSUPP is not a standard error code, don't use it. Replace with
EOPNOTSUPP instead.

No functional changes, compile tested only.

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 v2:
  - Modified the copy rights

 drivers/net/wireless/ath/ath10k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath10k/htt.c     |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c     |  6 +++---
 drivers/net/wireless/ath/ath10k/pci.c     | 10 +++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  7 ++++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 12 ++++++------
 6 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892f..9ce6f49ab261 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -3613,7 +3613,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	default:
 		ath10k_err(ar, "unsupported core hardware revision %d\n",
 			   hw_rev);
-		ret = -ENOTSUPP;
+		ret = -EOPNOTSUPP;
 		goto err_free_mac;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index 907e1e13871a..dbaf262cd7c1 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/slab.h>
@@ -381,7 +382,7 @@ static int ath10k_htt_verify_version(struct ath10k_htt *htt)
 	    htt->target_version_major != 3) {
 		ath10k_err(ar, "unsupported htt major version %d. supported versions are 2 and 3\n",
 			   htt->target_version_major);
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 090bcf148d0c..fc503db2fd8e 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "mac.h"
@@ -4056,7 +4056,7 @@ static int ath10k_mac_tx(struct ath10k *ar,
 		    !(skb_cb->flags & ATH10K_SKB_F_RAW_TX)) {
 			WARN_ON_ONCE(1);
 			ieee80211_free_txskb(hw, skb);
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 		}
 	}
 
@@ -7065,7 +7065,7 @@ static int ath10k_mac_set_tid_config(struct ath10k *ar, struct ieee80211_sta *st
 
 	if (sta) {
 		if (!sta->wme)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		arsta = (struct ath10k_sta *)sta->drv_priv;
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3de2de6d44bc..5c34b156b4ff 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/pci.h>
@@ -889,7 +889,7 @@ static u32 ath10k_pci_targ_cpu_to_ce_addr(struct ath10k *ar, u32 addr)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
 	if (WARN_ON_ONCE(!ar_pci->targ_cpu_to_ce_addr))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return ar_pci->targ_cpu_to_ce_addr(ar, addr);
 }
@@ -2668,7 +2668,7 @@ static int ath10k_pci_safe_chip_reset(struct ath10k *ar)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
 	if (!ar_pci->pci_soft_reset)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return ar_pci->pci_soft_reset(ar);
 }
@@ -2808,7 +2808,7 @@ static int ath10k_pci_chip_reset(struct ath10k *ar)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
 	if (WARN_ON(!ar_pci->pci_hard_reset))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return ar_pci->pci_hard_reset(ar);
 }
@@ -3594,7 +3594,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		break;
 	default:
 		WARN_ON(1);
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	ar = ath10k_core_create(sizeof(*ar_pci), &pdev->dev, ATH10K_BUS_PCI,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 0ce08e9a0a3d..aed97fd121ba 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include "core.h"
 #include "debug.h"
@@ -1351,7 +1352,7 @@ static int ath10k_wmi_tlv_op_pull_svc_rdy_ev(struct ath10k *ar,
 	    __le32_to_cpu(ev->abi.abi_ver_ns1) != WMI_TLV_ABI_VER_NS1 ||
 	    __le32_to_cpu(ev->abi.abi_ver_ns2) != WMI_TLV_ABI_VER_NS2 ||
 	    __le32_to_cpu(ev->abi.abi_ver_ns3) != WMI_TLV_ABI_VER_NS3) {
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	arg->min_tx_power = ev->hw_min_tx_power;
@@ -2123,9 +2124,9 @@ static int ath10k_wmi_tlv_op_get_vdev_subtype(struct ath10k *ar,
 	case WMI_VDEV_SUBTYPE_MESH_11S:
 		return WMI_TLV_VDEV_SUBTYPE_MESH_11S;
 	case WMI_VDEV_SUBTYPE_MESH_NON_11S:
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static struct sk_buff *
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0cfd9484c45e..9e2f0a50aaea 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/skbuff.h>
@@ -8733,9 +8733,9 @@ int ath10k_wmi_op_get_vdev_subtype(struct ath10k *ar,
 		return WMI_VDEV_SUBTYPE_LEGACY_PROXY_STA;
 	case WMI_VDEV_SUBTYPE_MESH_11S:
 	case WMI_VDEV_SUBTYPE_MESH_NON_11S:
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int ath10k_wmi_10_2_4_op_get_vdev_subtype(struct ath10k *ar,
@@ -8755,9 +8755,9 @@ static int ath10k_wmi_10_2_4_op_get_vdev_subtype(struct ath10k *ar,
 	case WMI_VDEV_SUBTYPE_MESH_11S:
 		return WMI_VDEV_SUBTYPE_10_2_4_MESH_11S;
 	case WMI_VDEV_SUBTYPE_MESH_NON_11S:
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int ath10k_wmi_10_4_op_get_vdev_subtype(struct ath10k *ar,
@@ -8779,7 +8779,7 @@ static int ath10k_wmi_10_4_op_get_vdev_subtype(struct ath10k *ar,
 	case WMI_VDEV_SUBTYPE_MESH_NON_11S:
 		return WMI_VDEV_SUBTYPE_10_4_MESH_NON_11S;
 	}
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static struct sk_buff *
-- 
2.34.1


