Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EDFC369CB
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp29iO7wYDz/sKhKncYba5qpme5gs7HJpcHcrRQPRyk=; b=ryAOa3OxUFjbq53CTU0cu6L8kA
	aeYzg3WmfM0h8jju5lO//sL/vfKMZM+qEvWQ4Po2fnTsIQtkw2qcV3ECd3W1J5230rGD37YnloSQn
	S47mvmFbbQO4GBuEPbCOIVsZ5wB9G8fPPCIJbQL+yBXaOQh1eP0V7W/OHv4xpaZ0k0lKR8mge21tC
	BFvapZ+6k8dUmS0dffGZ3n+i5ECBJJPMa8m/69qhuChAHjJY+FxvlLnA//Gaia3hjufFPgTtxGjgp
	dYgXwTknLGGukf9ZN7cobQqsYHNcqivjTTQK7MraL4sn/TRpgESThh5XKlyDviy4CncRSZB8nXPbM
	tbbmZMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsI-00000009G7x-1JGv;
	Wed, 23 Apr 2025 05:42:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsE-00000009G6n-367m
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:42:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAit013403;
	Wed, 23 Apr 2025 05:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wp29iO7wYDz/sKhKncYba5qpme5gs7HJpcHcrRQPRyk=; b=NAkGE6mOhFsbDGQA
	ZBo9s8KUw4RilkkS/18iNkCHmJjtxZ5YTME2gk8HchMcfgEpLPBfaK1iT+xYPi8o
	lFOC5CGkfk2Xdddbg88wNS2LAAGdT4C1OVERjzTw4ft0QGezDvxhSFP91r8757t+
	fW/VftZ9IS/Z9w4gXwjzngWI5u1tdcnppIb6PuhUYRyDy0T1621+C/+H/fyGsDet
	e1E6+Y7m5FpmEanfbQJbW8OqFCK4pJ53BVGE3tIi74dgisOASx/AihatLzSzhUbV
	V6mG4fOUmImOzHBrpt5zjPsasBRGnVv2QAmk9xqQ8qi7vpMSmb+kwC7itXEhupOp
	FtMPqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh38ygp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5gHe3000525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:17 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:42:16 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <jeff.johnson@oss.qualcomm.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Miaoqing
 Pan" <quic_miaoqing@quicinc.com>
Subject: [ath-next 2/2] wifi: ath12k: support usercase-specific firmware overrides
Date: Wed, 23 Apr 2025 13:41:52 +0800
Message-ID: <20250423054152.2471568-3-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250423054152.2471568-1-quic_miaoqing@quicinc.com>
References: <20250423054152.2471568-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzNiBTYWx0ZWRfXyyBnx0g7OXUc 3jHHrQcb/hwos0VYAFfambECwkyxlCDUgWidaa20d1Y5AjTEQXWSBJcTqqY1ekbwwnhCqkh6v5y GMmPzntpoPwZ4VXvAVVMbjbaYwGUP5fCUsQqIVKCYvHUDDQ05v0GNXtjQTsaiAZNhJg8HNJENou
 ANxeBZpDHpfcVUjzfzD8uX5Na9/Z3MbF28ccU4jfnZ4reFqyI/adna4LnErj4k5Inhavj0Vv/IL vmAvDXzhAUi9rxhCCqOwnmjAdZiIh4kYQlj/ns4eP0RJyuvmf506GbfaA1RcoXObsNguPa7aKr5 WMB3ZP6qTXBQWpy0hhDO5owZdwm8wGht+1/ja6ymXvOPGTzukpUJLpx4Jew3teizVNL9kq5eOtS
 0aXNl+ZmEPcqkNn8BB4E9tp5siQiLHv61sOtcOnh9jaT2MA+lf0Ps6S4J86WFpenCFXbIegh
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68087dba cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jX1nYg6MY8bSXAgjlsoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q_xyy2CDW0Ok7DFg2UC16Vvc6vZChLFx
X-Proofpoint-GUID: Q_xyy2CDW0Ok7DFg2UC16Vvc6vZChLFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_02,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=796 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_224218_782044_88231A81 
X-CRM114-Status: GOOD (  14.17  )
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

Introduce 'firmware-name' property to allow end-users and/or integrators to
decide which usecase-specific firmware to run on the WCN7850 platform. This
is necessary due to resource limitations such as memory capacity and CPU
capability, or performance and power optimization for different application
scenarios.

Currently, there are two firmwares, both files can be executed
interchangeably.
For example:

- ath12k/WCN7850/hw2.0/amss.bin,
  ath12k/WCN7850/hw2.0/m3.bin
  ath12k/WCN7850/hw2.0/board-2.bin

- ath12k/WCN7850/hw2.0/ncm825/amss.bin,
  ath12k/WCN7850/hw2.0/ncm825/m3.bin
  ath12k/WCN7850/hw2.0/board-2.bin

The former is the default firmware, suitable for most WiFi 7 STA functions.
The latter adds support for commercial-quality SAP and optimizes power
consumption for IoT applications. And both use the same BDF/regdb data
within the main board-2.bin.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b8f434e3e9a..cfe1ef156c34 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -17,6 +17,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/panic_notifier.h>
 #include <linux/average.h>
+#include <linux/of.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -1342,8 +1343,16 @@ static inline void ath12k_core_create_firmware_path(struct ath12k_base *ab,
 						    const char *filename,
 						    void *buf, size_t buf_len)
 {
-	snprintf(buf, buf_len, "%s/%s/%s", ATH12K_FW_DIR,
-		 ab->hw_params->fw.dir, filename);
+	const char *fw_name = NULL;
+
+	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
+
+	if (fw_name && strncmp(filename, "board", 5))
+		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH12K_FW_DIR,
+			 ab->hw_params->fw.dir, fw_name, filename);
+	else
+		snprintf(buf, buf_len, "%s/%s/%s", ATH12K_FW_DIR,
+			 ab->hw_params->fw.dir, filename);
 }
 
 static inline const char *ath12k_bus_str(enum ath12k_bus bus)
-- 
2.25.1


