Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FD0C83F3E
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIuu68jNcBoXSRML9smPLADGiTbPCj3O7xVlY9DIJHo=; b=RGBl2LtU7Qtqxi
	8bUFruc1CI7uUlA9goTXfL4Z0qAVN5rQxKUBfVFLyP422W6uoAaiZ1boZtwUDZSQrQUvF3fizewj7
	15rmUgiLWafubGUVUXjwcQ4JJyYfi65fX6/pKFjcUI5skBcEEaE6qKiv+LEGg+uNnyzew22etRvJ4
	ajYND0JTNbezh1Am02/KfUlrIWH8etscY/1GhVOMhLiazgOU4gNphz409EgwSiBfbyY64HPAoBwfT
	LECBlVUp4VLwSz680pDUtHfJK+7YkTc498MLxHzNASQvd6O/Tc5G+uolrULnfOjD4kdQvDBiC1t3l
	VdLaF8tvvHl4Elr6nTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTjv-005rYn-0f
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 10:56:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTjs-005rXv-0G
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 10:56:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385AIXCJ018441;
	Tue, 5 Sep 2023 10:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=+PiwhJHPxLVQYK8aBv67jk8ZBMQmgjfOHtHEhSfTDIc=;
 b=B/QUijK3Xi2eT4sz7pJkiK7aDzO6xxsI8qNsy+DIiy+QFvS19hxd7n7W41b/N6iFFsVH
 6l6mzYcfuUJfN9IhIhjtPRfqJyMOJze9auS7V/xMu6+BBUSBEm9jL/dsivTXypg+vSG1
 wozRPsp+WXDIF1A5QWkw5eD6dQGHhLYsEYAeJ+SW8Pp1gJvVvMDGK0af/61RyaO3qxL8
 ShdiqiC0w5hdKInSbKAkvYvkqtd53D6M8QGuaNJbpj5Yjl30O/iESB8dpRtosaO3TNs4
 HX5/VATgx+fAZQXCTnYuBj6lnnYshZPUfw8g6sbLke2PzAHqSWJhtJ3VQVyU3IC3hYx6 ZA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swmxwsbjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 10:56:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385AuqmU011351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 10:56:52 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 5 Sep 2023 03:56:50 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: add read variant from SMBIOS for download board data
Date: Tue, 5 Sep 2023 06:56:37 -0400
Message-ID: <20230905105637.10230-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z9Qzvjm29gPUTrkbtLMyHUUmdvdl1ykB
X-Proofpoint-ORIG-GUID: z9Qzvjm29gPUTrkbtLMyHUUmdvdl1ykB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_035656_158879_BA2270F6 
X-CRM114-Status: GOOD (  23.64  )
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

This is to read variant from SMBIOS such as read from DT, the variant
string will be used to one part of string which used to search board
data from board-2.bin.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 69 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h | 20 +++++++-
 drivers/net/wireless/ath/ath12k/qmi.c  |  5 ++
 3 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3df8059d5512..6350e2cf71ee 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -377,6 +377,75 @@ static void ath12k_core_stop(struct ath12k_base *ab)
 	/* De-Init of components as needed */
 }
 
+static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
+{
+	struct ath12k_base *ab = data;
+	const char *magic = ATH12K_SMBIOS_BDF_EXT_MAGIC;
+	struct ath12k_smbios_bdf *smbios = (struct ath12k_smbios_bdf *)hdr;
+	ssize_t copied;
+	size_t len;
+	int i;
+
+	if (ab->qmi.target.bdf_ext[0] != '\0')
+		return;
+
+	if (hdr->type != ATH12K_SMBIOS_BDF_EXT_TYPE)
+		return;
+
+	if (hdr->length != ATH12K_SMBIOS_BDF_EXT_LENGTH) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "wrong smbios bdf ext type length (%d).\n",
+			   hdr->length);
+		return;
+	}
+
+	if (!smbios->bdf_enabled) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "bdf variant name not found.\n");
+		return;
+	}
+
+	/* Only one string exists (per spec) */
+	if (memcmp(smbios->bdf_ext, magic, strlen(magic)) != 0) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "bdf variant magic does not match.\n");
+		return;
+	}
+
+	len = min_t(size_t,
+		    strlen(smbios->bdf_ext), sizeof(ab->qmi.target.bdf_ext));
+	for (i = 0; i < len; i++) {
+		if (!isascii(smbios->bdf_ext[i]) || !isprint(smbios->bdf_ext[i])) {
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "bdf variant name contains non ascii chars.\n");
+			return;
+		}
+	}
+
+	/* Copy extension name without magic prefix */
+	copied = strscpy(ab->qmi.target.bdf_ext, smbios->bdf_ext + strlen(magic),
+			 sizeof(ab->qmi.target.bdf_ext));
+	if (copied < 0) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "bdf variant string is longer than the buffer can accommodate\n");
+		return;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_BOOT,
+		   "found and validated bdf variant smbios_type 0x%x bdf %s\n",
+		   ATH12K_SMBIOS_BDF_EXT_TYPE, ab->qmi.target.bdf_ext);
+}
+
+int ath12k_core_check_smbios(struct ath12k_base *ab)
+{
+	ab->qmi.target.bdf_ext[0] = '\0';
+	dmi_walk(ath12k_core_check_bdfext, ab);
+
+	if (ab->qmi.target.bdf_ext[0] == '\0')
+		return -ENODATA;
+
+	return 0;
+}
+
 static int ath12k_core_soc_create(struct ath12k_base *ab)
 {
 	int ret;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4389ff40b49d..6c1468f64401 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -11,6 +11,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/bitfield.h>
+#include <linux/dmi.h>
+#include <linux/ctype.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -32,6 +34,15 @@
 /* Pending management packets threshold for dropping probe responses */
 #define ATH12K_PRB_RSP_DROP_THRESHOLD ((ATH12K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
 
+/* SMBIOS type containing Board Data File Name Extension */
+#define ATH12K_SMBIOS_BDF_EXT_TYPE 0xF8
+
+/* SMBIOS type structure length (excluding strings-set) */
+#define ATH12K_SMBIOS_BDF_EXT_LENGTH 0x9
+
+/* The magic used by QCA spec */
+#define ATH12K_SMBIOS_BDF_EXT_MAGIC "BDF_"
+
 #define ATH12K_INVALID_HW_MAC_ID	0xFF
 #define	ATH12K_RX_RATE_TABLE_NUM	320
 #define	ATH12K_RX_RATE_TABLE_11AX_NUM	576
@@ -129,6 +140,13 @@ struct ath12k_ext_irq_grp {
 	struct net_device napi_ndev;
 };
 
+struct ath12k_smbios_bdf {
+	struct dmi_header hdr;
+	u32 padding;
+	u8 bdf_enabled;
+	u8 bdf_ext[];
+} __packed;
+
 #define HEHANDLE_CAP_PHYINFO_SIZE       3
 #define HECAP_PHYINFO_SIZE              9
 #define HECAP_MACINFO_SIZE              5
@@ -789,7 +807,7 @@ int ath12k_core_fetch_bdf(struct ath12k_base *ath12k,
 			  struct ath12k_board_data *bd);
 void ath12k_core_free_bdf(struct ath12k_base *ab, struct ath12k_board_data *bd);
 int ath12k_core_check_dt(struct ath12k_base *ath12k);
-
+int ath12k_core_check_smbios(struct ath12k_base *ab);
 void ath12k_core_halt(struct ath12k *ar);
 int ath12k_core_resume(struct ath12k_base *ab);
 int ath12k_core_suspend(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b2db0436bdde..fd1bf53c2502 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2213,6 +2213,7 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	struct qmi_txn txn = {};
 	unsigned int board_id = ATH12K_BOARD_ID_DEFAULT;
 	int ret = 0;
+	int r;
 	int i;
 
 	memset(&req, 0, sizeof(req));
@@ -2297,6 +2298,10 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 		    ab->qmi.target.fw_build_timestamp,
 		    ab->qmi.target.fw_build_id);
 
+	r = ath12k_core_check_smbios(ab);
+	if (r)
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
+
 out:
 	return ret;
 }

base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
