Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1297CE7719D
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIL7ueByHD0px9a2UImpi/RFfI6tawt4b1lWCTaL0KM=; b=TB7KrZYP7ltgPgjg7fRTAz/s5L
	h1m4l4AcRAmEWYeCHGOK/MHCeECVfMi40YiPDsp2VUa4D68C4ybTsZHgA8FW8fQax8Teb6XZaDo88
	cnV80Yd00Weq6miGgBBHpWDlueT5smytcLwWA7k2+nMMlmhwxRGJ5R+wjluVsxbeMnoSJky4AZQqm
	0vogH4RmojV3VL9J9z9i60Sy2y0YDHUe8U+iE7ueja1JOExBmi6hD9FdbjW9+d/Ki/iLihAdf2gCV
	eeD40aapdVlteUoyoX9nmdqFntceaU/a0Hu/Ei7lRN/0uXCo1wkrJFGcWDV/dpH9Y6/nRDrKdeiyf
	ztDP4ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2o-0000000F5Nm-3RB4
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 11:19:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2l-0000000F5LM-3550
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 11:19:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A67VCh009608;
	Fri, 10 Jan 2025 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eIL7ueByHD0px9a2UImpi/RFfI6tawt4b1lWCTaL0KM=; b=n1qhEJXC4Qxntxi9
	lK9PU/0H+aPfJJw7L3wMFwxrKjfU4381QNg2GKn5ZkBs3TRqwGJRxh7g93TcEJtD
	bwbRhmyFCgnRTELwXw9PhiN8XSQHLFJv0xCf8xRZsQMjPAb7o4b1wlc4eCQfEiIx
	74yz5Nz3E3i2UMB6bbEM8rg/y9MxixtMm1inejhoYaPDAEz46vJ04vhk/Yu5FIpV
	tCYNW2MDP0ritn4lj8qhIILP7zw2YmvvLgLx00OkaJr9RFStHPh8+4UgicLk7hPi
	0iLUUPbhWmsZ0MESegI7XGM5ynj3pmMbWqdP/nqyBj9yVv2ZMKLQiqWcVMe9wLnh
	+v3LdQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442x0r8t1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 11:19:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ABJAs4019644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 11:19:10 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 10 Jan 2025 03:19:08 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>,
        Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH v8 4/5] wifi: ath12k: Fill pdev id for fw test cmd
Date: Fri, 10 Jan 2025 16:48:44 +0530
Message-ID: <20250110111845.2920741-5-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
References: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rFxKIyErEZrujBP3W9zrgXoFBFDgLqsI
X-Proofpoint-ORIG-GUID: rFxKIyErEZrujBP3W9zrgXoFBFDgLqsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031911_778608_A906A755 
X-CRM114-Status: GOOD (  13.50  )
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

Currently pdev id is not set properly. That can cause a crash
if pdev id is not equal to the pdev id when firmware test
command is run during AP bring up or ping.

Set pdev id in function ath12k_tm_cmd_wmi to resolve this
issue.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/testmode.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/testmode.c b/drivers/net/wireless/ath/ath12k/testmode.c
index ac9ffa765ef6..18d56a976dc7 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.c
+++ b/drivers/net/wireless/ath/ath12k/testmode.c
@@ -301,9 +301,10 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
 {
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct sk_buff *skb;
-	u32 cmd_id, buf_len;
-	int ret = 0;
+	struct wmi_pdev_set_param_cmd *cmd;
+	int ret = 0, tag;
 	void *buf;
+	u32 cmd_id, buf_len;
 
 	if (!tb[ATH_TM_ATTR_DATA])
 		return -EINVAL;
@@ -321,6 +322,12 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
 
 	cmd_id = nla_get_u32(tb[ATH_TM_ATTR_WMI_CMDID]);
 
+	cmd = buf;
+	tag = le32_get_bits(cmd->tlv_header, WMI_TLV_TAG);
+
+	if (tag == WMI_TAG_PDEV_SET_PARAM_CMD)
+		cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_TESTMODE,
 		   "testmode cmd wmi cmd_id %d  buf length %d\n",
 		   cmd_id, buf_len);
-- 
2.34.1


