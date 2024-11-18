Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C0D10F57
	for <ath12k@archiver.kernel.org>; Mon, 18 Nov 2024 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5SM4qePpwJAEthYdNn/T1sz6mV6vX99a4Ks6FbdRCJE=; b=sePDnw/yEjGLjPCdJVg8VAaf9K
	KTQaku/QYfwohoSWUBgKUVhkZf0IpXlLdIRTWGn88K5TP45vZtKSoid4zQxTvKlhNUoqzDQunbm+B
	SrrI47rz6vPLQ5sRA9BIhSCwwgybA7Vg7d2b+D/Kevs52ny3fMF0FXkBk9Rdtphsc5EAxWC9Ilyxr
	sybsujh9zv3kJpRc7ckm6It0Cg4jJTPlHv/reWMHtzU8Dy/kr2YsGGC0S3vpV6D3Jge98r+/kXJxs
	MJJD+zOysS7OjQWDZwt5dukFSTJbq6UBE8dQaiBjXOCCZAhmkZOZ5r1omxJStO4wZa/qP9rBj0XVo
	CcCceMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCstY-00000008H37-1yxD
	for ath12k@archiver.kernel.org;
	Mon, 18 Nov 2024 03:57:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCstW-00000008H2a-1ooT
	for ath12k@lists.infradead.org;
	Mon, 18 Nov 2024 03:57:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI0k2TP006984;
	Mon, 18 Nov 2024 03:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5SM4qePpwJAEthYdNn/T1s
	z6mV6vX99a4Ks6FbdRCJE=; b=GAiO3AY+l9vLyQ6SOMkhYqz3aN8h1s2meNrR4w
	2IZL+VKussnXzwQ1g0bGziCtYSCU+IrTaWJXPKB0pU7G2VYTK21UPAewBFSpS7j9
	8Hjx6G8DT0fJA+R7UAQWVnaUM1IFEI3zi5TuPscghQTstqyhqWdJTTDcVMrkJoAi
	IAordgr4mRnp0ZHnKn6uvDfYY7BCW6reaeqjB0bWNOgaAbqkOzu7ukTVFySPeoYk
	l2JmWLa4Z+JmAk7J6NyCoHGjNuruYZhNGJoSl/dmYEa/t0Z5MwyHgB+/AkeHC97I
	0UtJmw3TO3ssmv1Bu4dmkM8Cl7y/cpbMCgvPcVXbWo7ncxog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xktak9jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 03:57:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI3vguX011351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 03:57:42 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 19:57:41 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fix inappropriate use of print_array_to_buf_index()
Date: Mon, 18 Nov 2024 09:27:22 +0530
Message-ID: <20241118035722.1755373-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r0PqtoXMWjFJUHSmeCwRUr1bMyZtkTyz
X-Proofpoint-ORIG-GUID: r0PqtoXMWjFJUHSmeCwRUr1bMyZtkTyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=885 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_195746_602529_48C3C976 
X-CRM114-Status: GOOD (  12.51  )
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

Currently in ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv() the
htt_stats_buf->ul_mumimo_grp_best_usrs array is printed using
print_array_to_buf_index() with a stats_index of 1. This is meant
to convey the semantic that first entry in ul_mumimo_grp_best_usrs
is associated with user 1. However, unlike some of the other "usr"
arrays which have that semantic, ul_mumimo_grp_best_usrs does not
have that semantic. Instead the first entry corresponds to user 0.

Fix the issue by calling the API - print_array_to_buf(), instead of
print_array_to_buf_index().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 43ea87e981f4..e0ee014ac79e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2277,9 +2277,9 @@ ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv(const void *tag_buf, u16 tag_len,
 	len += print_array_to_buf(buf, len, "ul_mumimo_grp_best_grp_size",
 				  htt_stats_buf->ul_mumimo_grp_best_grp_size,
 				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
-	len += print_array_to_buf_index(buf, len, "ul_mumimo_grp_best_num_usrs = ", 1,
-					htt_stats_buf->ul_mumimo_grp_best_usrs,
-					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+	len += print_array_to_buf(buf, len, "ul_mumimo_grp_best_num_usrs = ",
+				  htt_stats_buf->ul_mumimo_grp_best_usrs,
+				  ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
 	len += print_array_to_buf(buf, len,
 				  "ul_mumimo_grp_tputs_observed (per bin = 300 mbps)",
 				  htt_stats_buf->ul_mumimo_grp_tputs,

base-commit: 0ea161de5e5afa1323e982adc8f59bf4af99a84b
-- 
2.25.1


