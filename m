Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D8C4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y52I8yqUlHZXuNfAKwgYP+RZJDHeHYFVqQTggR8bgNc=; b=uQgfvwycXpIPjl
	3zTE3x36Z/Zn0069XCUpGH/XSvRHY8kV2j7lyLTRgEJkCB8DyuQpJU4VT78Y0LuzGOZImJJfQfsw7
	wGrTY04bjtTLFUX7UCbU4bnO35cjekMma6dMjB5LTWa1EA/4alr/AIGtG6Ky7JsPlzg4cTGwxnI0o
	dUVu1/aB7u55eQVNjgyp+iF7GpCLr7mNMmtooAffsgKochOWaypaXnXXTMaA2kCCSkPJB28g1H1qu
	weOCS8jf/e3NIlV+nhkBdQuqAvdEjr/cndyOKon9CMvfXMxkRv9GIvMlbFCC+IHOPKdY9Nmxo1lK5
	MwmYFvbIgjXyU3sovARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxNdC-002po1-2K
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 08:28:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxNd9-002pms-31
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 08:28:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U4tM53009824;
	Mon, 30 Oct 2023 08:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xSK7YHdJ+PsgPiOou7lPkrHtVKy//d5OYC6LjiMUUOc=;
 b=WoClO1XukVwdhQ4147iKNpq2zTodeTLf9i/EEy+OQQWzxvqbC8KafE1chHinPSjm0R+5
 UE8mUOGjIRu75gvPFWBTjjBlnfqeOlEfiNCpdb+yNZp46YLXPdbD+mXIWLEqlmDJn4/H
 RT+N1ODb8cDdJNqjKUjHS7AbLnzd0XV+MCsuy2teY9A67x4P9CFFf7yCg+Ox1rGgsSd2
 G+WJOwqVyzP+VThcsfwQGiRg+5R1O2R9l6kjMtZCQ9EdA1c6E6WBwGcXYBNtQDr9Li8R
 5aMl7zZfR7ErMKP53GPqj/AmcsJqOhM91AdoFbV5qQyh/wvzJ8XwkGDsEiFyHqAxWHyW XA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0smrkcad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 08:28:15 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39U8SEMU026575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 08:28:14 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 01:28:11 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 2/4] wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
Date: Mon, 30 Oct 2023 13:57:47 +0530
Message-ID: <20231030082749.17855-3-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
References: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GuITEdJ2Weky_YSnQh1lGoNVc2qlGAnA
X-Proofpoint-GUID: GuITEdJ2Weky_YSnQh1lGoNVc2qlGAnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_06,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=895 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_012816_090037_C88C776D 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Export ath12k_wmi_tlv_hdr() to further use in the testmode command
processing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00126-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ef0f3cf35cfd..d586697bee3a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -162,7 +162,7 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_vdev_delete_resp_event) },
 };
 
-static __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
+__le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
 {
 	return le32_encode_bits(cmd, WMI_TLV_TAG) |
 		le32_encode_bits(len, WMI_TLV_LEN);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index c75a6fa1f7e0..06f97678d694 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_WMI_H
@@ -4912,5 +4912,6 @@ int ath12k_wmi_probe_resp_tmpl(struct ath12k *ar, u32 vdev_id,
 			       struct sk_buff *tmpl);
 int ath12k_wmi_set_hw_mode(struct ath12k_base *ab,
 			   enum wmi_host_hw_mode_config_type mode);
+__le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len);
 
 #endif
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
