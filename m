Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D124BC3ABBC
	for <ath12k@archiver.kernel.org>; Mon, 12 May 2025 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6EFIMFrkjfiGZ4uCgxNtU2JG99itvrATn2wS6zRAws=; b=bQTEjSUl+H2iisqS4YJzZnBDFG
	bOg89mRcIhBaZetsehWOzqD5ycxlvAvfMGeAc071AJ5svE5bVbk47hR9xTC2PAOEqPMexR1c/uK7w
	nLulRDrNyUzjdg8d/ZxfzSOAAOkHVBH1ccQc+4+CzziBZzyxf7QVOaLWyReuIz3Zyqvn6gXJlfIkO
	OZtOCpzDQyqJpDHcuHwPT2QKwEmqNdu5uw+hrCrb8KdJ9jMEsifcDoNQZ1rhsLZmu745E5fjPlK+v
	nTzI8fJDGoVmqqs++WAXvTkSM7yP8fMRJ+35hlV++la8wbQlEPp7yFwLcrzSI7eKm/5eoLTFJk6tk
	8goprTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN8Z-00000008ZzR-23M8;
	Mon, 12 May 2025 06:59:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN8X-00000008Zz1-0Jz8
	for ath12k@lists.infradead.org;
	Mon, 12 May 2025 06:59:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C06cjH031462;
	Mon, 12 May 2025 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N6EFIMFrkjfiGZ4uCgxNtU
	2JG99itvrATn2wS6zRAws=; b=GWnK2/RjMDZWaU3ZBZ2lnDqvcuDnP8vbBH8noF
	h1VcNFke0s8As9R7ZUcryd5pSfh246LuoTT7sjcuD0CPLCRN4/lYllxEmh7s2QUF
	bSQ/wahC8kFkoG+VbzbTls0FHeolpE0J9k+SeFODKkJHqfgrqrSY4jSrtjs7i4sp
	EO1ANqcYyybu/h7ogkdVW5m2TA9IbDh1jTs0RhFNdENmoJFKu1uskC77MgvXj0r+
	kgobZKFkGg45LaM8u1hjcR4hSCCyvc8ZxcqA2fDuI/LrX+Ltht530WCByCU1h0As
	QjPp+OA72Lq2H2d79ryzatv24M1U13jCdSnaOfOz3XM0v8xw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghbk5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:59:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C6xcan003811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 06:59:38 GMT
Received: from hu-vignc-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 May 2025 23:59:37 -0700
From: Vignesh C <quic_vignc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Vignesh C <quic_vignc@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix scan initiation failure handling
Date: Mon, 12 May 2025 12:28:49 +0530
Message-ID: <20250512065849.2833232-1-quic_vignc@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gNe3UMECcwwwmk4dEAz0qMjv9UdfzM2G
X-Proofpoint-ORIG-GUID: gNe3UMECcwwwmk4dEAz0qMjv9UdfzM2G
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=68219c5b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VIDGliHIJPvldr3RAkwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA3MiBTYWx0ZWRfX8eQ8Alu3Em3T
 tJXK+QhHDFMh4v0XzEkxFCetbXpMhjz6UJwBpqP4bR3zl8v/nqm5CiHfPLCdq6MOEPs/2YwZzdT
 KKijDZM2KNU/3DGSaBwI6ED0LXj9ViuKM4YTZuJ3rTMQyf3Xjlp6LWq74FL5v+b9izX1/OX33ZA
 HKIjCRoJ52gikZCSAr4GXPb4uL5ITvb8vb61tI5xJGzPs7gMzZKp97bVOYvMQSz67pYgx9fPAfX
 J+arhLcW84CLJ9xobxFF0VayNAdVS8vUP7zrJvHSwPHfCNBRQk0OCETBcSzbLTYPkbgup8oTdLC
 uo2zUXMnCwF8vFXBYMCJCQ3pXML3fqWjubp9xQ6KPlu0+Y2VO/fCFWHj3PfJazfJ9CdZGTAbpku
 G05zQU/zAztDFyEzFBYPTdv6WW5fV/iNIaHCq6oC7ecyZh5AdRVmlRLzh6n0QcwNq0tcx6si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_235941_810493_B60963D4 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

During a code review, it is observed that in the scenario
where scan initiation fails, the current code schedules the
ar->scan.timeout workqueue which is not necessary.

In the scan initiation failure scenario, exit the code instead
of scheduling the ar->scan.timeout workqueue.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Vignesh C <quic_vignc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4dae941c9615..0cf2b3d06c3b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4647,6 +4647,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH12K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
+		goto exit;
 	}
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac scan started");

base-commit: 3a64d6def8733e75909abcfab983efae92dc4102
-- 
2.34.1


