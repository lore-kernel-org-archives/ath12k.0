Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C27C3DA42
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17Zssr5EYiZXtjPyPQRAQVBY4Zlely9AAaHIs+ZPpRY=; b=ftSBueXBezQ2GnWi9f6wsCSbV3
	qMRtgSQNn2pLVqsRlGTM84QO5qfxbPn17Sf9gQHAwa1kS629rrQblva4AiqfZlYhO6SjkwrXP+Wmg
	HtizJxMDuxp/NJuoD8p3La3mRXeuyzy6xFPI0597GNqB97tNIAwxpJQVP6EnJtIenxomy7DntWQ69
	CxB182iKjuIIBMDvkvECmqML2YN2qw6TF+h+fQYsPx1c3WBwywaDGpa3dshjkLMq9vvvq6go2nIwV
	2oxWVTVXzQQqkjre2daWYR6z8gVNNyJuoQ+phw3B9c9g/67Qc5IlRHJPp99FeNNhO66OV2jYEoanD
	2apOG+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2YZ-0000000DaEG-3Xvy
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 11:10:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2YQ-0000000DaAK-1Dbb
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 11:10:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H7O7ok029106;
	Wed, 17 Jul 2024 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17Zssr5EYiZXtjPyPQRAQVBY4Zlely9AAaHIs+ZPpRY=; b=PYbH+09s8CiIvyg5
	R+7TIGs5o17RPtOHTGDiqDpLOu9Lg8NeMsFyCdgJ2Bdd5Ei0ZswN6w/04a8In1E4
	wcrY0sCkXUBwIsJRAbsRac/Cm4ciU/4jHw5NJmDT7ERYNHfCRPpSfsFM4h5heQnN
	WGubnMT3CS5Ub+ZpvhwL3Nk2WFFBgdltCnRK9m2K/BcrI624WOeBzy6lbXE14WH2
	E4PezWvCOId4gsq8EmfFumcfYXIza/nPf+LBOLlL+3uMRI0wTXLMKiLN+tuKQfZc
	pryK6Jc9J/+hoG17oc2Z01ZY/KyivOL3Yq8hQ5N3amUrUU5taC9Xe5kBAEmLOW9Y
	sSrB6A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1j4u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:10:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HBAbti028275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:10:37 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 04:10:35 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 1/4] wifi: ath12k: Add support for obtaining the buffer type ACPI function bitmap
Date: Wed, 17 Jul 2024 19:10:20 +0800
Message-ID: <20240717111023.78798-2-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717111023.78798-1-quic_lingbok@quicinc.com>
References: <20240717111023.78798-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cNjd7NP0iprwpsv1FvC3ZDzuX1pnBXLZ
X-Proofpoint-ORIG-GUID: cNjd7NP0iprwpsv1FvC3ZDzuX1pnBXLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_041038_359662_60675AF0 
X-CRM114-Status: GOOD (  17.65  )
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


