Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B25C4345F
	for <ath12k@archiver.kernel.org>; Sat,  4 May 2024 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0DTNHb5cyoWRdUfdaXHgLkbG2fY5hFJfr8EKDrFk9g=; b=FT6AC7rI6uAw3IC4wiNDnq3DAu
	VB2HwpCXZHOlEijy4cvqFQGI7VcmuhMfIFizOjU972fe7plYGug8wEl8vq6e+RRKOKIpMJ6UontNl
	r35RDpLwqfp9qFEFNkcgYKospFnsGLHORpi3ZZmKR3G2s5LJSo7RiZ1NxFP89cnlWXCPvwcQKqGrQ
	ca3kL7HQ26HCTc5AGDETgtQRVZS0wCBKdjUGfjlcBzdnB9jvt1auuQe6surfV0e4uUF6SaSmNDXk3
	bjt7LArhTB7H+r96L5CspLdQIjnkk8KRqTF1V/saXx9PTJDiOQG9ObiGGjjM0QuBxyNT5v8QvmbZo
	4uiOqhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3NCI-00000002vJz-2fRP
	for ath12k@archiver.kernel.org;
	Sat, 04 May 2024 21:45:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3NC9-00000002vIq-37WI
	for ath12k@lists.infradead.org;
	Sat, 04 May 2024 21:45:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 444LjMex022046;
	Sat, 4 May 2024 21:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=X0DTNHb5cyoWRdUfdaXHgLkbG2fY5hFJfr8EKDrFk9g
	=; b=FPEYMe5PSA8PjwWkG8gn3ckSqeVWN58yw27M+7ol4fwD85FfiYVZGaZ+KZF
	G7FnSfeJTtHPvNlwxAIg7jEwWSM4RTzgil6Qtd5gWWPYdAu+YYM2gBifA47qyLy9
	1DgSi58Roc11WvT0ZSF82RggFfu0Dk1dOPhtorcDBzU64ES3DZrxMj93Ab0VrpUQ
	OsQReHWffBWFI3+pXd5pH0G/JBH9aJJw/tEZJIKkU+SS+1neO6oJW5Y93GI13pAE
	4SvJPmbnNl9EAXUpznthTrQN5I035G7ikqfbg5/do0Q0tkqyslfJ5B8tGO4i+Qr9
	+N317zNv6Xjpiz9J8NYJM01vPuw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwc1c14e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 May 2024 21:45:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 444LjLYF001237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 May 2024 21:45:21 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 4 May 2024
 14:45:19 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 4 May 2024 14:45:18 -0700
Subject: [PATCH 2/2] wifi: ath12k: initialize 'ret' in
 ath12k_dp_rxdma_ring_sel_config_wcn7850()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-2-44d2843a2857@quicinc.com>
References: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-0-44d2843a2857@quicinc.com>
In-Reply-To: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-0-44d2843a2857@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9VRFUXFJNhB7HgPu4ctg6i_cZRCkQx3
X-Proofpoint-ORIG-GUID: C9VRFUXFJNhB7HgPu4ctg6i_cZRCkQx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-04_17,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=895 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405040139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_144525_945562_CB93B5A8 
X-CRM114-Status: GOOD (  11.76  )
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

smatch flagged the following issue:

drivers/net/wireless/ath/ath12k/dp_rx.c:4065 ath12k_dp_rxdma_ring_sel_config_wcn7850() error: uninitialized symbol 'ret'.

In ath12k_dp_rxdma_ring_sel_config_wcn7850() if it were ever the case
that ab->hw_params->num_rxdma_per_pdev was 0 then 'ret' would be
uninitialized when it is returned. This should never be the case, but
to be safe and to quiet smatch, add an initializer to the declaration
of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 2adcb4238c3e..188a4e422909 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -4029,7 +4029,7 @@ int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
 	u32 ring_id;
-	int ret;
+	int ret = 0;
 	u32 hal_rx_desc_sz = ab->hal.hal_desc_sz;
 	int i;
 

-- 
2.42.0


