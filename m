Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D2C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=czEYNIOf1KwJm+opD9kgX945vx9cWNbmsN5hmQ+rB48=; b=WlAcH/899PXTe1UYf2afEGBiNW
	H0AFZiZFL66UD7mFK4/urDF68HSb0Xqg77T73wjZcCw46/ZtYUv0hPjhA+2s/7isD40nMs11lF7Zu
	66iUsjDvtdZ4h+9Vw0Se9NuN9KJ/u2AXzqxmu2DZoRMuicae4G05OLiJg5WGvlZx2/e62r7a861DG
	xnpFlf/qp4TcaSgW0UmOR0nwDUGWxWTwdHU8o/z0Mg8DxQ2hIub3doCD2DOXAy3LOoN88AOWVjl9P
	6BB0ewxey3zVTqH/Fu3OZLjDRY+Omg3QDG2ldoXb5CM2gzM9nB8RjhwV6PhS35SrE4nHLXdbXz06J
	jA8w/6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Hpp-0000000Bu6K-302V
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 09:25:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Hpm-0000000Bu53-440r
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 09:25:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q8jJRT010019;
	Fri, 26 Apr 2024 09:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=czEYNIOf1KwJm+opD9kgX945vx9cWNbmsN5hmQ+rB48=; b=Lh
	s7L8qrS4Z7zHZZC/rKUBrJpXF2zv9pQNvpAL0U3V8mSUnXjMeD7ox2OHinCkZstA
	nqz5VG1xS4QAhMehdvdmAfrtUxlVA4LE4E0yZSqekbsle2Ft/f82DGOcQTJcwDV3
	89T/mHlNh5GG3MOXDGlcBRCYYJl0SXyDZuNJI/Map8PRL9jQoOLLr6r9yYTyATMf
	X6CA4doSY5aWVOoIUTvI4zHreYfZQP+QSIhetmSTWUbszQpI0WrmkFAObsOOlrpv
	Zuo3F8NyBB/PtT+/z9RR9FQRmvDZQ/v6QXLDbD9gZmidVvU0pzY/vLoyMGmfFQuQ
	Nnr2Kz7/6idqelAp3eBg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr3591d3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 09:25:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43Q9PSaW008776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 09:25:28 GMT
Received: from hu-deng-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 26 Apr 2024 02:25:27 -0700
From: Xin Deng <quic_deng@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_deng@quicinc.com>
Subject: [PATCH v3] wifi: cfg80211: Clear mlo_links info when STA disconnect
Date: Fri, 26 Apr 2024 02:25:01 -0700
Message-ID: <20240426092501.8592-1-quic_deng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fdxBifZ78GzdNDDPC9asGb4ap06TOhch
X-Proofpoint-ORIG-GUID: fdxBifZ78GzdNDDPC9asGb4ap06TOhch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_09,2024-04-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404260060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_022535_146467_700AAFAC 
X-CRM114-Status: UNSURE (   9.77  )
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

wdev->valid_links is not cleared when upper layer disconnect from a
wdev->AP MLD. It has been observed that this would prevent offchannel
operations like remain-on-channel which would be needed for user space
operations with Public Action frame.
Clear the wdev->valid_links when STA disconnect.

Signed-off-by: Xin Deng <quic_deng@quicinc.com>
---
v2:
        - Change wdev->valid_links = 0 to cfg80211_wdev_release_bsses();
v3:
        - Change wdev->valid_links = 0 to __cfg80211_diesconnected();
---
 net/wireless/sme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index 82e3ce42206c..a8ad55f11133 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -1353,6 +1353,7 @@ void __cfg80211_disconnected(struct net_device *dev, const u8 *ie,
 		return;
 
 	cfg80211_wdev_release_bsses(wdev);
+	wdev->valid_links = 0;
 	wdev->connected = false;
 	wdev->u.client.ssid_len = 0;
 	wdev->conn_owner_nlportid = 0;

base-commit: 8027a466a77a288eccd2d11868f504e24231f3b7
-- 
2.17.1


