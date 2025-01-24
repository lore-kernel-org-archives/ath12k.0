Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A8AC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gt2pOZ57xswNedZ7vIhU/kb8DQrJZE/z0BM6k0VstjQ=; b=bXhu/3mO0U7qUphXSf1pfjvTah
	5AyBeSesJiERzhtMHtsYDZ+35ig5gMsEzJ8eOeJfaUQM2gaIGNDHMTUQxoIVdYRSnpZkzGGEuXsgx
	sGJFHWUFtz/dbqvRClDtb/7Dje7FcU0XEjalNgeyTpNATsxM/FXBPCvJhWxJc76wzujePFZrMwREM
	PVT7/J3ArTSKNTCM9IkxvJRqtJneKqrbxpSoqvjlU4QKSGxsWMd4DaO/BVHvolTbisGQwd85sjnw/
	r4k/imNzHswq9f29P9D/gkqeUgRa+EQ52QO2TK5Ont8+ggHuYy61mcjjcrBKtGGQJHE+LVl914V7/
	6274d5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbG5F-0000000EN2W-49zs
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 09:34:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbG5E-0000000EN2A-2GGr
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 09:34:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6lRxW027809;
	Fri, 24 Jan 2025 09:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gt2pOZ57xswNedZ7vIhU/k
	b8DQrJZE/z0BM6k0VstjQ=; b=UL1V9ethfjwFjruXZhMPSrNrh9dObjTDlPtg2n
	7bIUs9/WwSy2cYvOgORPYqRtiA7/vJjCDJXE+Low5hcLO9cigRBlY/+OKcfMapGS
	rSYiOXgcvbgfbBnPrsoYCgGFWjOVIx/+TVq2x8vtBDUF8yV52+ARIWBYCkxzLEoM
	F5+ZkY4XQCsGKC0A+WuUnzwfvAgFAOKnOljDhbLdZU9hYtbMydTrmZYSmrzk23Ol
	bzJ11nuqKv+4hTdeHwzeHXFmeskbH7q2Wbk4BeAx6lq3FOSls/U1mUa0Rv7dtGVn
	uty8u/PWK3anxx/gFVOT0Xw8YSk8GI2hJxFu+9EDDLdtbKww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c5wfgeh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 09:34:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O9YX1l011863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 09:34:33 GMT
Received: from lingbok.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 Jan 2025 01:34:31 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH] wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion
Date: Fri, 24 Jan 2025 17:33:52 +0800
Message-ID: <20250124093352.481-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UXbCyJNDXAurKMYb7ez3omNv1s268Ifm
X-Proofpoint-ORIG-GUID: UXbCyJNDXAurKMYb7ez3omNv1s268Ifm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=969 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_013436_590262_4075DCE2 
X-CRM114-Status: GOOD (  12.19  )
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
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 329c05003721..cdce88787182 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9333,6 +9333,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
 		ath12k_mac_monitor_stop(ar);
 
+	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
+		ath12k_scan_abort(ar);
+		ar->scan.arvif = NULL;
+	}
+
 	ath12k_mac_remove_link_interface(hw, arvif);
 	ath12k_mac_unassign_link_vif(arvif);
 }

base-commit: 376673aa393c1c232299be3e910d7f2e6d974b2f
-- 
2.34.1


