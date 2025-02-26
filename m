Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6718AC021BF
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4jayubKMT7OfdwXuym9RzIryglZnRB1ZIpcAbGkWZ0w=; b=C5sX4O8E1OPxZ49PS5WiCkvwTk
	xOhZNoPwcFC4yqdmaEUl/UeFyWLk3eyvZrL8v3LmpFlGn8A8NusQEqiRcaYjyoYpCxOTldBiecNlr
	npXj6rirRTrpGaXe+HGzNeDU+a/tvAsRJNU+00CEPG6wgF6tDTStMTFuCeHjII0zlHO+NvS6LtqWg
	bOJVUNM+LAV2Ab9ZzGVaPP0kyfBSGodPkmgDPEWJjw7Mpmu/RgmCHAfRy3Di4jV+7aLFB0m8iEe6C
	EYlz1vQwnHcv3kpw7QsA5yIS6wTgMzDiXYWLbTA8d9G8lxsoyPmVin6ecvddqrXvomUMTkNAt0/JH
	r6AKdsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPb-00000003qFJ-07mm
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 13:25:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFdU-00000003UD6-1S09
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 11:31:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAxSpu002104;
	Wed, 26 Feb 2025 11:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4jayubKMT7OfdwXuym9RzI
	ryglZnRB1ZIpcAbGkWZ0w=; b=osZXZ8oao0MKAAiRGuwn6mcNP1HXyoh636+bZZ
	Zm/xzOM9XfHZQ7qwvDouUhiZsAP5frhE9E4JbghXtI2wKOVEXCsahBR6xfCEmgLG
	72J0XP4eZAbowo2kgj+gySSMmafAm8X5CDud01i98745nT8Csqvl6AN/YzC0LCbn
	rXCc/+iQygEq8TStVKjQkgEyxI9ttwhUbMwkFMRZQ5rFcr+FunDRYVv8b0MxBgSF
	JSiubQBGLebSpi6y/KPVfSGltRK5roYqh7cnIwXPkFVw1cX0R2SXcOx9KfKJB90f
	SSiZVLCznYVbL4HBV5fWXjO6nscWsj/Xgv8xPvDvAtNkPFXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4521ph82nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:31:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QBVUhL023541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:31:30 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:31:28 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion
Date: Wed, 26 Feb 2025 19:31:18 +0800
Message-ID: <20250226113118.7626-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9wgbGwOPqpEIWiIolDB14SvQS0dds2_w
X-Proofpoint-ORIG-GUID: 9wgbGwOPqpEIWiIolDB14SvQS0dds2_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_033132_395818_DD65BE08 
X-CRM114-Status: GOOD (  12.61  )
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

Currently, when ath12k performs the remove link interface operation, if
there is an ongoing scan operation on the arvif, ath12k may execute the
remove link interface operation multiple times on the same arvif. This
occurs because, during the remove link operation, if a scan operation is
present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
from the firmware. Upon receiving this event, ath12k will continue to
execute the ath12k_scan_vdev_clean_work() function, performing the remove
link interface operation on the same arvif again.

To address this issue, before executing the remove link interface
operation, ath12k needs to check if there is an ongoing scan operation on
the current arvif. If such an operation exists, it should be aborted.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
1.rebase to ath-next

 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3e3afdc56fc9..551133483f44 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9578,6 +9578,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	if (ahvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
 	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
 		ath12k_mac_monitor_stop(ar);
+
+	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
+		ath12k_scan_abort(ar);
+		ar->scan.arvif = NULL;
+	}
 }
 
 static int

base-commit: e180a01bf2c4a67db13d70d2d91410a8c6f74be3
-- 
2.34.1


