Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE0ECA0FE2
	for <ath12k@archiver.kernel.org>; Fri,  1 Sep 2023 01:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XkIj6RyZz2+WFRlFb5gDXss05hWsG/YmIfIBJhf5S30=; b=JZhxKTifGiLAa/
	C6fKbmUHPh1YCk96YQBEhsNNKJE7V4Nh9PlAG95vXHBP+vRaM67DWf1SA2DA8+hqSl0Ue4TBXZxbd
	SDzWcm6Vpi38EguAlrtNjwWa8e7wuDI+vh0qeOVCumKvSiC2coRlZ3CxHfYe6CDNn4QqCXz+12vnp
	PMfkZwb1n7UTtokcYeVo13RpPY0ToH9SHyhNBglDnmcI1uWxCE0iCW1SE27+JEt6AXaCJb1Ox4ZEd
	x+8m+P3DRftwieIC0PpXMNhzMc0CLyN031Iy/FSzupkb3lf9JcsWSykPfuM5CdPLAXQE3BIzGNEs8
	JdVaBSXJyUI9GJnH6nkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbtOe-00GJMi-0j
	for ath12k@archiver.kernel.org;
	Fri, 01 Sep 2023 01:56:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbtOa-00GJMC-1H
	for ath12k@lists.infradead.org;
	Fri, 01 Sep 2023 01:56:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3811a7vE000495;
	Fri, 1 Sep 2023 01:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=E3TYHH8ZmQq159CeOvwT6Hncz/j96RBmTVyhPVbnJko=;
 b=Nl/cS6PdDDRu1LzOyvW7nDrmIvqQFAtNUoO6T449q3J211a/UQbgnfSJ3tRfGO1XnLiW
 hqcRN2qE0AnIG7N0egr8rYZWV/0C7okW+VNY14rJ2IBt/sy9pMCnnA+xUYWMHLIg1WoT
 QIBrRjs0idRi0YFd4wCjNBV/MStr8kQQOjWqjzTBKk89YNh/q2lhfnX8Do8C0fqBc2nf
 kdiFk5jfwdQ2O4Ovb4tSpW7EqwGqdDulXe8m9laK5clwtEp0J7vyc/77CeQ75+HR53r5
 Vp673bjSsoVBtIvOvmJPpAfsmmzJX8nesWcBgK/1fTBjm4OQK8U750nr3k7WwG54dFwC ug== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stpy9aj4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 01:56:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3811uDja004448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Sep 2023 01:56:13 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 31 Aug 2023 18:56:12 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()
Date: Fri, 1 Sep 2023 09:56:02 +0800
Message-ID: <20230901015602.45112-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JWVhhB-t1XgHKcftEHn41-CkX48ikGfK
X-Proofpoint-GUID: JWVhhB-t1XgHKcftEHn41-CkX48ikGfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=883 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_185624_489690_D3D4FE3A 
X-CRM114-Status: GOOD (  17.50  )
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

len is extracted from HTT message and could be an unexpected value in
case errors happen, so add validation before using to avoid possible
out-of-bound read in the following message iteration and parsing.

The same issue also applies to ppdu_info->ppdu_stats.common.num_users,
so validate it before using too.

These are found during code review.

Compile test only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e6e64d437c47..5189a0690d44 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1555,6 +1555,13 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 
 	msg = (struct ath12k_htt_ppdu_stats_msg *)skb->data;
 	len = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE);
+	if (len > (skb->len - struct_size(msg, data, 0))) {
+		ath12k_warn(ab,
+			    "HTT PPDU STATS event has unexpected payload size %u, should be smaller than %u\n",
+			    len, skb->len);
+		return -EINVAL;
+	}
+
 	pdev_id = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PDEV_ID);
 	ppdu_id = le32_to_cpu(msg->ppdu_id);
 
@@ -1583,6 +1590,15 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
+	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+		spin_unlock_bh(&ar->data_lock);
+		ath12k_warn(ab,
+			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
+			    ppdu_info->ppdu_stats.common.num_users, HTT_PPDU_STATS_MAX_USERS);
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	/* back up data rate tlv for all peers */
 	if (ppdu_info->frame_type == HTT_STATS_PPDU_FTYPE_DATA &&
 	    (ppdu_info->tlv_bitmap & (1 << HTT_PPDU_STATS_TAG_USR_COMMON)) &&

base-commit: a62b0aeb556839fb6abb9835874443b08fe95598
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
