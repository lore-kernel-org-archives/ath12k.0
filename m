Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE688C4167B
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFdZfJWoL1eU7iscFMRRXjiWfLCyRWTMK5dLgBxuq2o=; b=BSBLY3gJ0cDfMtnk2Mmbe8SqDb
	Uq90JoRscnUoIdVGEVEkpwc/VKbMEsUfrOUTfXtDTHxj/aJ83un1AE/ENh1NAvoLciwY3qTYu5xYJ
	sXGjBENm2UQSVG94GYT39XJObsh3CALHjx71UPdjpyoMa5Ft1UmrIVSbTnazGp5qjlYWdnG8f3GM6
	7e6pY1wyS09nSE7DylWF2v1/SIEi6fnmNYVf8f8UwO1/q54tbJHxEpRr1rRvp+l8PWH0ijnWEVMSJ
	WJLp3aTUDnama16TM5gVfJAFwZDtT5mBoqJkCQnrWSPjzLSqikUa7czxkq5geUToR9+Vlgdl32JY+
	IsTkMcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rENkg-005X4C-15
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 06:02:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rENkd-005X31-2X
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 06:02:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BG5vAG9031029;
	Sat, 16 Dec 2023 06:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=rFdZfJWoL1eU7iscFMRRXjiWfLCyRWTMK5dLgBxuq2o=; b=Fk
	3nJWcSiS1jiE2MfEl431qBCQW9AOWHJhcAO6hQY5uPu99hm5RyaxgWl/mgU7tuQ8
	wtFQ9wHngcMyBbct0nbpN+ycnNw3JkQJjDeYLGOz5DEo9J3i3rn5REl0zlUI8CV9
	Aj5o0kXQao4Y9R5CYA+ZAZP2wfqyUzy86WiGdkajZk1V1TLvshGLvv0SJA5xsNko
	NFkQdVy6VX9bfg3FwHKgWp/E5oDh+TxAiMNZ585rDYdxyKA26kPayXjSnvN/UK9L
	8zxTG19EOKe9waBLufnF22pn4wKUkqRtXn6Y0hR7IsodHrLR/A0RejkIuhmpT8wv
	vJNjsT2k6yjmc9OwpeHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v14vj83sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 06:02:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BG62EmA007077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 06:02:14 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 22:02:13 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 3/5] wifi: ath12k: remove unused ATH12K_BD_IE_BOARD_EXT
Date: Sat, 16 Dec 2023 14:01:38 +0800
Message-ID: <20231216060140.30611-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231216060140.30611-1-quic_bqiang@quicinc.com>
References: <20231216060140.30611-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WxOn_iu6p4q4dShD5IHvkJ7yePTA1mEf
X-Proofpoint-GUID: WxOn_iu6p4q4dShD5IHvkJ7yePTA1mEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=764 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_220215_826229_0BCB7910 
X-CRM114-Status: GOOD (  10.13  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Currently ATH12K_BD_IE_BOARD_EXT is not used, so remove it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index d2622bfef942..130d99f7e426 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -245,7 +245,6 @@ enum ath12k_bd_ie_board_type {
 enum ath12k_bd_ie_type {
 	/* contains sub IEs of enum ath12k_bd_ie_board_type */
 	ATH12K_BD_IE_BOARD = 0,
-	ATH12K_BD_IE_BOARD_EXT = 1,
 };
 
 struct ath12k_hw_regs {
-- 
2.25.1


