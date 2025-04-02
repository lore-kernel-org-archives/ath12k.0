Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E4C36018
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 02:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQjFM/nIPEFn+3L5RBVOoUah50QGHftoxKFV7OrU2eo=; b=fLix6vrOfFKh6BtMPEnl2uJ+Wn
	fnK8iLiP5u0p7EtOW6xRqOoJAF8XxeVIm5o/vYs/NR/X4ng7zXoXHvJNDk8opg6ewyNGbax9IPyvm
	cmghdIO8IUJNG5747cbQgO8RfFmKDt4MjiLE2tZb+GOY7o+51ZYjtVeAzUIdvkixxUAp0Sxt55VhB
	zCelqKVpKeMOsau3qSJxR0tW+g9zulLb35KfoQSUoBis6NTQSuEEi+fleLBfm34Pp2aBDkLQVYg58
	Bqw/3BoDJ+z4bHNNmecvlsCItHu+ojgfqxaJbuWYr9ZnSs5D5zLsNFix2zrDLSEiW9VEuQbalfuD9
	Ll4rQrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzo7S-00000004xzo-3McM
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 02:46:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzo7O-00000004xyJ-20XL
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 02:46:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531NSN50025870;
	Wed, 2 Apr 2025 02:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQjFM/nIPEFn+3L5RBVOoUah50QGHftoxKFV7OrU2eo=; b=DzSrNiEH7LzoyG02
	OpMR0RFd5c+FlJZC63L8Qzh2pka14POayZFC1VNVQB12d7kW8ejUxYmhjoLtRAy9
	p1YFrIwaSUQNrs5XUFn5Gtu8QRoyjawCVTSCMU7ZlKuTHJgc3Za21LHY8gXmmy/4
	NAmVbf6GNUoosftPfDsP+KpWldcEo0r3kEDc583zsMVGThtnmouRhHRXZrF71Q1e
	PGcaj80S/e3dJ8+8onGuC3giovCWY/83oxwcFCztLECYrHhGgBfAlmcfT92NgbE/
	vcotI8OjpzhF2UBaSWceMBJpFwRjnHvF4ZM3jqXl1w/+jFL55aBajhlI/ZjmAuFc
	1M+lWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bsu2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 02:46:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5322kEtX006086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 02:46:14 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 19:46:12 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 2 Apr 2025 10:45:40 +0800
Subject: [PATCH ath-next 1/9] wifi: ath12k: introduce
 ath12k_fw_feature_supported()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250402-ath12k-wcn7850-mlo-support-v1-1-bad47cf00704@quicinc.com>
References: <20250402-ath12k-wcn7850-mlo-support-v1-0-bad47cf00704@quicinc.com>
In-Reply-To: <20250402-ath12k-wcn7850-mlo-support-v1-0-bad47cf00704@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c2JEdPSrbcdihHWxviZPuqGf4mrfis7S
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67eca4f6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=qqn00rXgNp02u2b5aRIA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c2JEdPSrbcdihHWxviZPuqGf4mrfis7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=985 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_194618_732698_B84ACFA2 
X-CRM114-Status: GOOD (  14.77  )
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

There are several places checking if a specific bit set in
ab->fw.fw_features, and in an upcoming patch additional check needs to be
added at all places.

Introduce a new helper ath12k_fw_feature_supported() to avoid code
duplication.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 drivers/net/wireless/ath/ath12k/fw.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/fw.h   | 3 ++-
 drivers/net/wireless/ath/ath12k/pci.c  | 4 ++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a0618f9cad4cc24eded302cc74ddc16e25928dde..7641e66c165be9974030d74a06910105c209a0c3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1954,7 +1954,7 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 		/* even if 1 device's firmware feature indicates MLO
 		 * unsupported, make MLO unsupported for the whole group
 		 */
-		if (!test_bit(ATH12K_FW_FEATURE_MLO, ab->fw.fw_features)) {
+		if (!ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MLO)) {
 			ag->mlo_capable = false;
 			return;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 5be4b2d4a19d8920042b7b05460aecf380490c4f..af8b87ca4ccbe748974d17955397b4b23b52e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -169,3 +169,8 @@ void ath12k_fw_unmap(struct ath12k_base *ab)
 	release_firmware(ab->fw.fw);
 	memset(&ab->fw, 0, sizeof(ab->fw));
 }
+
+bool ath12k_fw_feature_supported(struct ath12k_base *ab, enum ath12k_fw_features feat)
+{
+	return test_bit(feat, ab->fw.fw_features);
+}
diff --git a/drivers/net/wireless/ath/ath12k/fw.h b/drivers/net/wireless/ath/ath12k/fw.h
index 273c003eff3ba709a248fed799fb64326c1e3e92..7afaefed5086f19a742e0d6b5af04f210c0fd5a9 100644
--- a/drivers/net/wireless/ath/ath12k/fw.h
+++ b/drivers/net/wireless/ath/ath12k/fw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_FW_H
@@ -32,5 +32,6 @@ enum ath12k_fw_features {
 
 void ath12k_fw_map(struct ath12k_base *ab);
 void ath12k_fw_unmap(struct ath12k_base *ab);
+bool ath12k_fw_feature_supported(struct ath12k_base *ab, enum ath12k_fw_features feat);
 
 #endif /* ATH12K_FW_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 7f1bb150f326b317157f6721d990d61a27f38d6a..3c550497f74a32ce30f6c86e6727ef2dfd14e7bb 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -718,7 +718,7 @@ static void ath12k_pci_init_qmi_ce_config(struct ath12k_base *ab)
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
 
-	if (test_bit(ATH12K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)) {
+	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID)) {
 		ab_pci->qmi_instance =
 			u32_encode_bits(pci_domain_nr(bus), DOMAIN_NUMBER_MASK) |
 			u32_encode_bits(bus->number, BUS_NUMBER_MASK);
@@ -1468,7 +1468,7 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 
 	ath12k_pci_msi_enable(ab_pci);
 
-	if (test_bit(ATH12K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features))
+	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
 	ret = ath12k_mhi_start(ab_pci);

-- 
2.25.1


