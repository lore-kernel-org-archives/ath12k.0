Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1908C2BD05
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5Ok3/YUEA1dxlNhErGVuf45xc2wzgskokZg+IK3IR0=; b=T6mCY+9hq2UhEh162VhRVD+7y3
	Bd+X9rl5PzHNh3kApnNji64n4fQdy0rS+XuqKWF1zQroDZvemSR3sbV0DOSYOdudOoM8fRq1R2jF4
	Eh0hEwRA94tTA7EZjj4gPA/MRt4wB/W5vMzXQ94iR3iUtiDB8xUGD1TUJbbi0qciRw8imFL+suse9
	HJNoTekqUN0fCrxioe0Wg4+VFHccaHJreBvuyscBD5QKepYBCGUKOHfHf6GcC9sBhz2z78DUC1g/W
	fCDaf7alMB2WDTyTO6zcj2ClHa9O94MD8kkxgzMzvdO80ZK1E/xJ9+wBOXOBre9n8CrD7Xgd4ZvM0
	U0LLT2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgOF-0000000GJnt-2fKi
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 09:53:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgOD-0000000GJlz-0PXB
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 09:53:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8Ygu1014016;
	Mon, 24 Jun 2024 09:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5Ok3/YUEA1dxlNhErGVuf45xc2wzgskokZg+IK3IR0=; b=FAm+b3L/tVGCBZjX
	9HwgWomzKK3ludjstCkmwVjiR8j0cXcfVSE2BeGK6k6EvjyCQTJAyb+ydb/KjI8d
	q4D0czZX7TmUKLBsrRGhFFICaKIUKyU/xBSa2srIx7luU0H56Iu/TqGoea0Z0xP5
	pPjeqok3324XJGipCyJSmB/HJNu7LTTwq8+TKfyuNFqF6v1pR7rBDeBTH8V5sNVL
	AjP0UeP5iQe8gQ/0ZcxQL4uYvwA0RLSjAb0JYT/A7ldIEn1gVLPqO8/9zqtBSJt8
	kcY3kqSbQhF1VYYQO6mfycXsumhb2rd5awq6WQfjmwkgD7plBqAlMDqd7oXpiGo+
	3c/arw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnxgu6f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 09:53:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45O9rUFA011348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 09:53:30 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 02:53:28 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH v5 4/4] wifi: ath12k: Fill pdev id for fw test cmd
Date: Mon, 24 Jun 2024 15:23:05 +0530
Message-ID: <20240624095305.37189-5-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VgzYJkrPGHXULJVflpkmEwVhE9dLhIfv
X-Proofpoint-ORIG-GUID: VgzYJkrPGHXULJVflpkmEwVhE9dLhIfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_025333_384257_A84C56C7 
X-CRM114-Status: GOOD (  11.87  )
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

From: Rajat Soni <quic_rajson@quicinc.com>

Currently pdev id is not set properly. That can cause a crash
if pdev id is not equal to the pdev id when firmware test
command is run during AP bring up or ping.

Set pdev id in function ath12k_tm_cmd_wmi to resolve this
issue.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Co-developed-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/testmode.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/testmode.c b/drivers/net/wireless/ath/ath12k/testmode.c
index c334d64e839b..4d81ff2a174c 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.c
+++ b/drivers/net/wireless/ath/ath12k/testmode.c
@@ -321,9 +321,10 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
 {
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct sk_buff *skb;
-	u32 cmd_id, buf_len;
-	int ret;
+	struct wmi_pdev_set_param_cmd *cmd;
+	int ret, tag;
 	void *buf;
+	u32 cmd_id, buf_len;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -348,6 +349,12 @@ static int ath12k_tm_cmd_wmi(struct ath12k *ar, struct nlattr *tb[])
 
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


