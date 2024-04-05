Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F5BC67861
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZlslQXrDPyewXcVyQPH1dwdKfvA81aXwKxg88r+nIE=; b=FLa+XhgRyypeFconGfJe2wHSTa
	QSP7T4MW/QKhab2xKS2Yn2yl+5k/TtUaJHSqXrxFUH8Y6nUjdf8T3hSK5P0i6y/xsJ413eIoNzvGW
	ebG68dC5RLIa80ZBMCI2miKZE9t5l/77HQti8s7JJWhwHEoKN40iFuxSzMHS+1EwIT5dSFHvH1bh0
	Mp6Fxc8rNKdT2Xdtkt8BcmmyGQxifWuy0TF9iFjGZeErZKriY0itBf3eQrd2fzLObK1RcqDr1eQmu
	N2wy7JkDBVCPmwZx2nO0DtEME/P760q1XpdnFPzi0gSulsvexWazrUYqkbz8Yv3jv8/G9fZlaFZ8u
	WcewyT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskpD-00000007YHR-2jwn
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 14:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskpB-00000007YGu-2GdY
	for ath12k@bombadil.infradead.org;
	Fri, 05 Apr 2024 14:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aZlslQXrDPyewXcVyQPH1dwdKfvA81aXwKxg88r+nIE=; b=h7Zq1iW+szyXk3mmfiRTRLD5BB
	87zXkUzIE2Chm8rqrLucFQMuCudhzT9RhKUHSi4ONsPjuZWccMnCBXyHu2ohw7ddmhq1hQPJMZ/Eq
	U4G+sZICLtftDL8I3943ohXWjFZcrTZVK0973E1LRm7KdPo0GjW5bGhXa8PtLzIrrZftKwc083M9K
	P7yJLxdXULzruyoXdbdlPOX+Ln+ZQ4z10vTMTPQXVFaTmcMAu5D+5DWXt0o7ZSAlrIlL8ZTUoLNoT
	jbSD1XQEKaLj5h9FGdaSulqc6wpt+Entaw73WGlipZiqSfp9DVPk/1qaARmCq5NoXPNakoouy7Ds4
	TLyWSjhg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskp7-00000005gOq-39P2
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 14:45:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435EPv2E001886;
	Fri, 5 Apr 2024 14:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=aZlslQX
	rDPyewXcVyQPH1dwdKfvA81aXwKxg88r+nIE=; b=kQ9NoWZLzXTQVFgN0/mFw61
	x9UW3TdjVS8v+CKkEVMeXHusA/R+/YzR4YZ50O2GZcqFLf7t3rt5nX8pQkxgHEWd
	06Fn8hjP1Lf/9DcZpy1DLsCJjI3xx5T5EdqtnyXWcK05EUaTvbg/glfkkEHwYGBd
	n96Dg9eipJuzSQMB4/JB88I+igK366V45GY3prxRSjVbz6zwxhttYMcT5u1po2hP
	MUoDl9OMAOZ8ruI5HpbvVLXbsL9vF8huXRn08nSePivmWCE0WiVGmc8Wk2nqpyv1
	P/WB0TiUiTP1FKXEMNgjpnpbNtR96bkG+AK7N2eVi/ykX6uoBAq7k3hatzIqzzg=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa7m5hg99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 14:45:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435EjdVR002480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 14:45:39 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 07:45:38 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: correct the capital word typo
Date: Fri, 5 Apr 2024 20:15:24 +0530
Message-ID: <20240405144524.1157122-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vxJ0WVjnF8Rb37Ge1EwQPXd3m7MMjeQa
X-Proofpoint-GUID: vxJ0WVjnF8Rb37Ge1EwQPXd3m7MMjeQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_14,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 mlxlogscore=808 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404050105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_154546_158042_058B515C 
X-CRM114-Status: GOOD (  11.39  )
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

Rename the "ATH12k" word to "ATH12K" for consistent capitalization in the
word.

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 4 ++--
 drivers/net/wireless/ath/ath12k/dp.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 1006eef8ff0c..a0aa8c571867 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1347,7 +1347,7 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_base *ab,
 	u16 ppt_idx, spt_idx;
 
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
-	spt_idx = u32_get_bits(cookie, ATH12k_DP_CC_COOKIE_SPT);
+	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
 	if (ppt_idx > ATH12K_NUM_RX_SPT_PAGES ||
 	    spt_idx > ATH12K_MAX_SPT_ENTRIES)
@@ -1365,7 +1365,7 @@ struct ath12k_tx_desc_info *ath12k_dp_get_tx_desc(struct ath12k_base *ab,
 	u16 ppt_idx, spt_idx;
 
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
-	spt_idx = u32_get_bits(cookie, ATH12k_DP_CC_COOKIE_SPT);
+	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
 	if (ppt_idx < ATH12K_NUM_RX_SPT_PAGES ||
 	    ppt_idx > ab->dp.num_spt_pages ||
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 443e6af619ef..4939aa41dd87 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -245,7 +245,7 @@ struct ath12k_pdev_dp {
 #define ATH12K_CC_SPT_MSB 8
 #define ATH12K_CC_PPT_MSB 19
 #define ATH12K_CC_PPT_SHIFT 9
-#define ATH12k_DP_CC_COOKIE_SPT	GENMASK(8, 0)
+#define ATH12K_DP_CC_COOKIE_SPT	GENMASK(8, 0)
 #define ATH12K_DP_CC_COOKIE_PPT	GENMASK(19, 9)
 
 #define DP_REO_QREF_NUM		GENMASK(31, 16)

base-commit: 4abf087939abe82a32e3cff8a8e48e6fd7d1e907
-- 
2.34.1


