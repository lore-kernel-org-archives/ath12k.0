Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F8C47DD9
	for <ath12k@archiver.kernel.org>; Wed, 27 Mar 2024 03:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D00Xce7ztpbry1CSLudg7yMIL+Ch8sPkhjouPgKZw7s=; b=2JcTHoHrO4RtOdt0pqO4nV1RB+
	j5jKwZ5itGlPTNXvvA3uh7K9oSuo4itly8YxEpeO25O8+JshjFV2s6bjXZJ5XKv1ZYUgzKiMXGwyI
	gNWO5ehYze0Ybx7ZgM5dBBBfGHKLjQ82rcl6K0JBUbwN2QKSHBj+YjM9udYIe4cqip7DgYZ9skhxl
	neg53tf/CmqMNlibncSjOKHkbQHc459kBqsA/fnci8lOHyf1NOAEGxUhuowyzdzyL5Q36oe8HKTNU
	lX5rp/zY3DmHmqossRrIv/uFBPXTAk2iw8G4IuRx23NZzJjdaxiY7nN4NdfK+qVKuFy2K4KIXxRxq
	L16hyP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpJuf-00000007Jeb-14gg
	for ath12k@archiver.kernel.org;
	Wed, 27 Mar 2024 03:25:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpJuc-00000007JcO-0Yeq
	for ath12k@lists.infradead.org;
	Wed, 27 Mar 2024 03:25:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42R29t7C014719;
	Wed, 27 Mar 2024 03:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=D00Xce7ztpbry1CSLudg7yMIL+Ch8sPkhjouPgKZw7s=; b=N+
	sh4ew1b+lHy2Jo5iXPv8lcjucMLu+MRIB2FNcAJYLtVG7MFEjx+JK9qGMKEozQd4
	9adUytptpjK+L2wHvFAdcle9Li/6BJtAOfZfWaHjMvRhnTCJF8EC6M+9+XiVwDAh
	ILy/BJN+3UIu1IajM5lSMPgPWIK1he9xIGI1rfjAboYC7UBZnkX+pitBS3rd6uKM
	y9uvBxk+GEaCj8JJljCy8ul8snDwIFOHUspFECg3rUFy/+f+eT9WoeTxL/zwb4MX
	BOhggDgz7zemnkT8tlTHPvAzVO8hRMPlFK+r1adVWegoTcVJrIfusHeHcSmOWM8T
	lXWcD6OXzs3v+gUdWbXw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4780ggac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 03:25:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42R3P8wY028752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 03:25:08 GMT
Received: from hu-deng-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 20:25:07 -0700
From: Xin Deng <quic_deng@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: cfg80211: Clear mlo_links info when STA disconnect
Date: Tue, 26 Mar 2024 20:24:48 -0700
Message-ID: <20240327032448.15098-1-quic_deng@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BLF2axo_HII6VTzA9irJbit2P8PuPQOW
X-Proofpoint-ORIG-GUID: BLF2axo_HII6VTzA9irJbit2P8PuPQOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=962 adultscore=0 phishscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403270019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_202514_308142_53E0D90E 
X-CRM114-Status: UNSURE (   9.88  )
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
 net/wireless/sme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index 82e3ce42206c..86e837f37f8c 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -492,6 +492,7 @@ void cfg80211_wdev_release_link_bsses(struct wireless_dev *wdev, u16 link_mask)
 				 &wdev->links[link].client.current_bss->pub);
 		wdev->links[link].client.current_bss = NULL;
 	}
+	wdev->valid_links = 0;
 }
 
 static int cfg80211_sme_get_conn_ies(struct wireless_dev *wdev,

base-commit: 8027a466a77a288eccd2d11868f504e24231f3b7
-- 
2.17.1


