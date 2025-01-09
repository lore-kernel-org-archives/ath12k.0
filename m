Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89C3E7719A
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgoDrtc5xPKmJuhAFx+eLRurUBvA0O2Nm9s+2snvxhE=; b=RQpZ91hFu2VvvwoQfQvQDVDIyo
	jqGaHsPjWFQCwRQrRAYBOS4jX7Pp/dBzO0D6UzVV9YiA1TPLdV/7Fzhge2lVOCBN8mB0EzY8PKzdb
	BwOZwm+T4MrH9P9LACfPxTOIt+DpR3KA0BxSZP8jkhMF9uvVNJ/4nlKKVKaQRv6B5q29qCR0LLijb
	o1S7Gvr3X/tkFIECchERrwUpqcgxpgBZqUPt4BStsD+zxXj9EoEu+fxM56XOZFzFskatt5QRilj2W
	q2UYkgyBVQft94d359tY5vmjICiD130gfdum3SnLZCZ2hugymS2ngwHmq6tPCy8WLXV2WarOJqsbL
	IWf/Btew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxOU-0000000CzES-1rTf
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 18:36:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxOP-0000000CzCC-0Tyb
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 18:36:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D87h9010367;
	Thu, 9 Jan 2025 18:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgoDrtc5xPKmJuhAFx+eLRurUBvA0O2Nm9s+2snvxhE=; b=ovJPRm4qS1TFS+t9
	wnscAVXCamk35tao78auX2S/tAnL+SpEAlMitsGvlMZjJV377yvnUQ92KOiC/OHo
	wPvBwDF59pVYKj3/lfMemOwWhIUO3pelUylB0heEJn5IK3E6WpoqGgAMkaz5G33w
	jElPSK6zjhRwi+fR48q+UX5LudRYdQ4pfsaI18qSL8eJDjrhqagj/tdBGAJEfgTk
	jTDThgtMqjQfz86EkNIm0J5OJDX/nvVyCaTVynVmV/BybYg0kML0h0J0Rbza6KpO
	GHDch559A+Jg1/EGwC2fSKPd9FUvfrmTzy+ybFbujJKogcme+IHllfC0krCjBJ47
	mLxYkw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2krsfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:36:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509IaB3s002983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 18:36:11 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 10:36:10 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v6 2/5] wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
Date: Fri, 10 Jan 2025 00:05:48 +0530
Message-ID: <20250109183551.1028791-3-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GAdylM3eiF5VNet4m9TnySPs64SfwNTB
X-Proofpoint-ORIG-GUID: GAdylM3eiF5VNet4m9TnySPs64SfwNTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=879 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103629_158045_F8E5FDE2 
X-CRM114-Status: GOOD (  12.45  )
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

Export ath12k_wmi_tlv_hdr() to further use in the testmode command
processing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4dd6cdf84571..246b8aab49a9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -173,7 +173,7 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
 };
 
-static __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
+__le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
 {
 	return le32_encode_bits(cmd, WMI_TLV_TAG) |
 		le32_encode_bits(len, WMI_TLV_LEN);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b6a197389277..00d024d4eb2c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_WMI_H
@@ -5754,6 +5754,7 @@ int ath12k_wmi_set_bios_cmd(struct ath12k_base *ab, u32 param_id,
 			    const u8 *buf, size_t buf_len);
 int ath12k_wmi_set_bios_sar_cmd(struct ath12k_base *ab, const u8 *psar_table);
 int ath12k_wmi_set_bios_geo_cmd(struct ath12k_base *ab, const u8 *pgeo_table);
+__le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len);
 
 static inline u32
 ath12k_wmi_caps_ext_get_pdev_id(const struct ath12k_wmi_caps_ext_params *param)
-- 
2.34.1


