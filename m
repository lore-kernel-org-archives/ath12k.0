Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25A9CD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 03:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=guxfdpP/7sTWwuRs/bJeCcUC8QIT+TmO1i4ZfTAxiro=; b=rnLK9y3F/O/wyXH/nSi0q/5jLc
	Mlx4rxIhumgFYE+OHP8pVxc0iqHCSjECjpdmEJ+MKmtnGb2FV/ZIjxbGM54JwW7BenZvcEkn6vTn2
	UfpuDNJS52D+Ptqnf+9jS4CXEDbfFSq2kXAq4hY8S5h4AU/Ip0ZjCVJh/7dM/Q7Y/CZ9W+oij1Jzf
	y5IhG8MSaYxCwPgP/1VP1fUj6PQKWfKsG5PsHHG6jh40qp9DnozRX7YceiHYoqD11+4Iz0xDOvz1v
	dB9SrCHJEHVQeRQaUeoUPfRfS0tW4aGJKEzDg9l4LaQC1UfXTMlNOP/Lyv5AAK2FmLayt4W/lfqKI
	Qwt37DLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruOMq-00000004qJl-2vIk
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 03:11:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruOMn-00000004qIl-3Wbt
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 03:11:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43A1XLvI028103;
	Wed, 10 Apr 2024 03:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=guxfdpP/7sTWwuRs/bJeCcUC8QIT+TmO1i4ZfTAxiro=; b=aA
	2I9CncDxzDS/aVx1LiBRhAweQF+/mQaBfoJJLARCqt1NmMG6QWJe7Pv+quJ6s2Wh
	yl4S6eqjJSNYeTTvEPjj+rYK7kJvImJkYU+//tiOt0JmiprUAYjVnBkMgcs+Wc1i
	K+t99y+ZiwS8I7sLHz3SsSxlKBjzDvUazo77cSWC8GPAhKY5nc6tw001m8r3WhTV
	35rm1bYnLWvJhGo2lv2h+KiOqqSbKz33IpKxPTPLvgEoukHhB5kTRuGzC8meZMSE
	F+zwVSM/0pXnixIJBX+GUZwYIK5Tj5GGuIxzDR04L4CRBIAM1952NmmvId0j8nRB
	Pw2uvornmvEs2sLjO1aQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdh6qgcbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 03:11:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43A3BEXr006311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 03:11:14 GMT
Received: from hu-deng-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 20:11:14 -0700
From: Xin Deng <quic_deng@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] wifi: cfg80211: Clear mlo_links info when STA disconnect
Date: Tue, 9 Apr 2024 20:10:48 -0700
Message-ID: <20240410031048.23372-1-quic_deng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5UatMNzqWOAPkQO4zwSOvZ34q50q49jO
X-Proofpoint-ORIG-GUID: 5UatMNzqWOAPkQO4zwSOvZ34q50q49jO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=978 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_201118_092440_C24524E0 
X-CRM114-Status: GOOD (  10.09  )
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
 net/wireless/sme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index 82e3ce42206c..6a08f9d35eb2 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -477,6 +477,7 @@ static void cfg80211_wdev_release_bsses(struct wireless_dev *wdev)
 				 &wdev->links[link].client.current_bss->pub);
 		wdev->links[link].client.current_bss = NULL;
 	}
+	wdev->valid_links = 0;
 }
 
 void cfg80211_wdev_release_link_bsses(struct wireless_dev *wdev, u16 link_mask)

base-commit: 8027a466a77a288eccd2d11868f504e24231f3b7
-- 
2.17.1


