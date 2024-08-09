Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B373C52D7C
	for <ath12k@archiver.kernel.org>; Fri,  9 Aug 2024 02:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2NmVUDyCVRmjAfSrsrZO+7546SRrJeBMc1+da3F8IU=; b=2GGQP6qQdhDzVF+89Ll8naZjEy
	nIFlzbL7zh3Ebuwep08uIsbQ5dfiPMQ+31wpBMaaxryvLwzsiNqqG1wHoeSZ5Pr+gKGyc9hmtqItb
	CcMGQJMMoI+WM7PHFjm0FBTRFKEA9XdAMNr5LcIeplBtgytNxWG5GyMIHskgK7YU2Z0UvSu0OU9ra
	17qQ9G5wExHBISCAd3ByV6sQR1+KWejRQDAeFl+jWa014nNbYWPC4gjo2DrbxRVLZyWMZxDa5wPIE
	gdsQ/xNB2e1lRmQE8fyw8kmmqHduvxkY4egTa8LlbMqpBz1CRspmwN/MAEaS4K908CQezXZLdjLV7
	YbD0tmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFiv-0000000A4ah-2sTw
	for ath12k@archiver.kernel.org;
	Fri, 09 Aug 2024 02:51:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFis-0000000A4Ze-3mTc
	for ath12k@lists.infradead.org;
	Fri, 09 Aug 2024 02:51:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478LJ7SC016234;
	Fri, 9 Aug 2024 02:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2NmVUDyCVRmjAfSrsrZO+7546SRrJeBMc1+da3F8IU=; b=NE9sGumIHaCFuWh1
	Pdx0nbah1dcY/TuAVPZvLyFVJXX7RqO8x3gcwdK5tfUysixm81UHt+3yqn+xFutm
	KiVoxjb3puMg9cIe6c6oS6oy2ZM1uv1nVo3W/9V+sQ0XHBXJvZNu8rZM/AfpEeE0
	XhKUBdJYmSvoJDHcvVmugZ3cTxqHkrhIlMqFD+6f34tAnSD0rhapcsbsQcJQq+zh
	ZfMdVO1yYGsYQv02kFyfWDp0KbJDwmnjwc48zhX2kwp/BC5Ou00MLMKlpf8uu+gh
	uMqCdrWBACwLXRkNlaVm8mTHpUeWg5ggNfCNlhYslJ638M/M56FOQVH42rs8nZu1
	Bhi6mw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vue3tbx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 02:51:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4792pKt0032349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 02:51:20 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 19:51:19 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v2 1/4] wifi: ath12k: Add support for obtaining the buffer type ACPI function bitmap
Date: Fri, 9 Aug 2024 10:50:52 +0800
Message-ID: <20240809025055.6495-2-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809025055.6495-1-quic_lingbok@quicinc.com>
References: <20240809025055.6495-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8USMBNE5iv_Lfyw-7xzDK2udyt3K_Vp0
X-Proofpoint-ORIG-GUID: 8USMBNE5iv_Lfyw-7xzDK2udyt3K_Vp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=818
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_195123_081150_4D113B63 
X-CRM114-Status: GOOD (  18.41  )
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

Currently, ath12k does not support obtaining the buffer type ACPI function
bitmap.

To solve this issue, change the code to support obtaining the buffer type
ACPI function bitmap.

This patch will not affect QCN9274, because only WCN7850 supports ACPI.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v2:
no change

 drivers/net/wireless/ath/ath12k/acpi.c | 16 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/acpi.h |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index 0555d35aab47..d83f7e58fb7a 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -12,7 +12,7 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 {
 	union acpi_object *obj;
 	acpi_handle root_handle;
-	int ret;
+	int ret, i;
 
 	root_handle = ACPI_HANDLE(ab->dev);
 	if (!root_handle) {
@@ -32,6 +32,20 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 		ab->acpi.func_bit = obj->integer.value;
 	} else if (obj->type == ACPI_TYPE_BUFFER) {
 		switch (func) {
+		case ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS:
+			if (obj->buffer.length < ATH12K_ACPI_DSM_FUNC_MIN_BITMAP_SIZE ||
+			    obj->buffer.length > ATH12K_ACPI_DSM_FUNC_MAX_BITMAP_SIZE) {
+				ath12k_warn(ab, "invalid ACPI DSM func size: %d\n",
+					    obj->buffer.length);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ab->acpi.func_bit = 0;
+			for (i = 0; i < obj->buffer.length; i++)
+				ab->acpi.func_bit += obj->buffer.pointer[i] << (i * 8);
+
+			break;
 		case ATH12K_ACPI_DSM_FUNC_TAS_CFG:
 			if (obj->buffer.length != ATH12K_ACPI_DSM_TAS_CFG_SIZE) {
 				ath12k_warn(ab, "invalid ACPI DSM TAS config size: %d\n",
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 39e003d86a48..7ec7a2e72e40 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -48,6 +48,9 @@
 #define ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE		100
 #define ATH12K_ACPI_DSM_TAS_CFG_SIZE			108
 
+#define ATH12K_ACPI_DSM_FUNC_MIN_BITMAP_SIZE	1
+#define ATH12K_ACPI_DSM_FUNC_MAX_BITMAP_SIZE	4
+
 #define ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE (ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET + \
 					      ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN)
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE (ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET + \
-- 
2.34.1


