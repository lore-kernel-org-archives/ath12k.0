Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A680C369AB
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSvFrgXmoUZ6yZ/lnrkYok0/n3BW+BgueyQTjm6pGRA=; b=Xp7/4YUCegFbI8KPUjZKErVIBh
	7rGLd0UeoY2wEED5mwP/CKtBe+qpsgGeAYWKfohKXeZ62TBQrMi1Q1vjObDlgiB6x0TxuSnATLxi5
	YDy6tFKcMGv/HH6hL8ln98kJ1nS8AGPVU63GUkdFV10V7Jsc63z7B6ThXZ+E02VU8C1/ogE4a5xqw
	dTrwmev++gUmbDjoJSKt1QO6tgIxBDdhmY++YZfylG5Xe3TL3Nr9lwCadQOMdUQMqnmFOY15p/EFC
	000XmGjdYSV5OAcp5xIA+3NUUGOJlh7YMkyMLUqUVrLTfUV9mxHjEfgWC7Zb3b2UUqGDeBrx27C/H
	MErTZ+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fn1-0000000FPlp-1BRC;
	Fri, 18 Apr 2025 07:05:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fOj-0000000FIG5-3VEW
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 06:40:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2Opsa015703;
	Fri, 18 Apr 2025 06:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oSvFrgXmoUZ6yZ/lnrkYok
	0/n3BW+BgueyQTjm6pGRA=; b=T9VjrQ5lRsOhXHdn/iZ1UNLpsWMzfb2nx3UwUz
	edhJ/g1WDhHHf+M0fQhO0sbe42DRZu0Iup0DVN1n4lCnyU71sWDN4zZN1DMJ63Kf
	DrZU3nMQE+vDdRSzI3iJMiH5dGM6ScnbrkAqwHweT6SzHMEEo8p9nkjIBz9/4ktA
	5fR3qmAeOrJTa5OtQVbkktjlVRaTERcHHGf8Qqq83eLr81N4JqGSFihr9mMhpYPO
	1GtZa9srAQ5uo4+Pw41osIgWnfMOzD2GEhvkwRWhhGM6Jr1576l7RHEWuSEmVTEt
	s+FO9W3YZvxVKRZA5HWJYlVI38ZAJla79wezQdhqKBLpiohA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqhdw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:40:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6eMrA024860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:40:22 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:40:20 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH ath-next v3] wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion
Date: Fri, 18 Apr 2025 14:40:08 +0800
Message-ID: <20250418064008.7172-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V21cDWxniPq2NoDX3RXAqoHuQ8tMjKIE
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6801f3d7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yPCof4ZbAAAA:8 a=Xb9ag2Io4QILRE6B9DEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V21cDWxniPq2NoDX3RXAqoHuQ8tMjKIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_234025_996056_B6FADB6A 
X-CRM114-Status: GOOD (  12.48  )
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
Tested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d170bca72948..fca004e8564b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9846,6 +9846,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		reinit_completion(&ar->completed_11d_scan);
 		ar->state_11d = ATH12K_11D_PREPARING;
 	}
+
+	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
+		ath12k_scan_abort(ar);
+		ar->scan.arvif = NULL;
+	}
 }
 
 static int

base-commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa
-- 
2.34.1


