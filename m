Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570F6C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G3zrctaFCDSY3o51Uq6vw7ZK/2OcFFnfziKUSc1zao=; b=vUMJcLqM7jOnI8KdvceVhir9oN
	ewZbkPbAlD0hSodb6AV7Qww+zW2DYAB6HbJ3O+OmxZfNAUUoB6k2W3LdU1E/flJoTMuDj8J9hJpod
	+IDYq4ZC8x/EF1merGkkqkRZY6+MtoiCcU2yXLNJpjJ13QAe3aP0JhqaQ2yGEFMo5rM7jZTWN42VE
	RCOcF7w7V9dADOtCzP7FUSrY9xpaUSZ0S9Sayxi/iXCwoi3EGR+34gxmIgDGkI+X59YkArfdDSeaC
	+C50w96Z80SjWPRlxLQ8sHMHu2BAs+Anoo5U1AQOB4Ui/absW92+LLoFHGiZa59zm6pMdG6hJiAhA
	LOeiBCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAz-00000001vnn-3yxF
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 08:15:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAx-00000001vlz-0rmp
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 08:15:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T6b8sQ026312;
	Mon, 29 Apr 2024 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=9G3zrctaFCDSY3o51Uq6vw7ZK/2OcFFnfziKUSc1zao=; b=St
	ojCLmAgekiDo5dRDVfxyaXuHP4YxeiiX5vLLwUHywmiNtLpYSf09SGJr95Ki2eZP
	pW2HvagHc2YOzCiEcvVRz5VH38xeWs7lAEYUTHr0HlFZMCWb21/gEsN5KHUj+dTa
	s2vngxOA/XOFO0X+yM9T6fgb9OYOiODQ99TG5tGFCwhAQtdNoMO/VHkFLYe2zGyq
	MS770ZNpmZT1ZUPc5RF55k4Mm+0PaYjwvpEq1+rDBtA4i6DPx5IroYtIUvJxIGIz
	rcSr+uRMcsshYFcwqkfFYm7F/ClKr1knpCBWWNP6jSv/e36vzIFVlwovC7RS/R6+
	4VK/dolfPWpSUhWGv+rQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt2sernu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 08:15:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T8FmVq006919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 08:15:48 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 01:15:47 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 2/5] wifi: ath12k: avoid duplicated vdev stop
Date: Mon, 29 Apr 2024 16:15:22 +0800
Message-ID: <20240429081525.983-3-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20240429081525.983-1-quic_kangyang@quicinc.com>
References: <20240429081525.983-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6OWU0iPGA0qFE8WM5XB1RCzQrA702RIB
X-Proofpoint-ORIG-GUID: 6OWU0iPGA0qFE8WM5XB1RCzQrA702RIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_05,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=847
 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_011551_394442_5A55779F 
X-CRM114-Status: GOOD (  10.49  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

ath12k_mac_op_unassign_vif_chanctx() will do vdev stop in
ath12k_mac_monitor_stop(). This ath12k_mac_vdev_stop() will do vdev stop
again, then might trigger firmware crash.

So add judgement to avoid duplicated vdev stop.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: c9e4e41e71ff ("wifi: ath12k: move peer delete after vdev stop of station for WCN7850")
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3e9a7dec7eba..4f553f2a7165 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7369,7 +7369,8 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		arvif->is_started = false;
 	}
 
-	if (arvif->vdev_type != WMI_VDEV_TYPE_STA) {
+	if (arvif->vdev_type != WMI_VDEV_TYPE_STA &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
 		ath12k_bss_disassoc(ar, arvif);
 		ret = ath12k_mac_vdev_stop(arvif);
 		if (ret)
-- 
2.34.1


