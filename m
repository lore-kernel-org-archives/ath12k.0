Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24A1D206A3
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRwXD7R3mzPZortojiT3FQbsvCj/pIMgKNgBSSGCNPo=; b=4YJlFxaJSG258dqXe2xWGLgyzx
	ENAn1DtzletaCwFRsJ3zv03EqWaJsrwwdUUNLMQ4ryQecNVt2R99C2qFWIiEHeV0stD4cEESBDWIt
	6OmetvAVBZ8nQlbp4NnG/Z9+7hjkoGhgj/gqSNNUhY9viaEaJvGxrVRyp4FuwzYtJElFpvAFc2zIj
	3beHukqhxwh1CtZBbPyJf1ZYf5SsD8MVds7lI+Agl2X3t1PPAkNzaCrMUho9JBDFkmQg9IVhS6iyD
	5c0sG1hrCdBH9payhAxupvv+JuqeomAS3Vi6fDuhANMbnTC08Bma5IiJWmfuR7qax/OWmtxRcGz4E
	wgPmDavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1x-0000000Allr-15MX
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:01:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyU-0000000Akjo-1KpW
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:57:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G3Vfe0013650;
	Wed, 16 Oct 2024 06:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRwXD7R3mzPZortojiT3FQbsvCj/pIMgKNgBSSGCNPo=; b=cBylEz7IgYBJp9dX
	KO5a5H4Nwde990C8791fd3P5vnvS2GdPJhIQVRe1WIYi+lgvyKaEXSq3fxWI8AmF
	toK2v5iuPoi5dqJR2OOdKZPPQqET7DtvxLuRX58bYIsjqtfQN81PNVoqIBV67ttB
	80PfcQt8FWGsUp0FZ3Yi+K91KJzoV45z1AvqN9O3S0FuZlYR6ILgFOqCTAarTQE4
	D5TRNp6b0j5+dYbjuUOfKtuOrcrIN7dcwn3aA2oaHbyECmGolfwpVzsD4hZ5A7sU
	rkjCRPFMjuJkaZi8uDtNLjN7Y/4EUMiUFNjnoGrVOoq8rTk2aQ7AMR/KR5rscwII
	o2wGWA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429uapa9y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G6vbe4019087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:37 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 23:57:35 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 08/11] wifi: ath12k: delete NSS and TX power setting for monitor vdev
Date: Wed, 16 Oct 2024 14:56:57 +0800
Message-ID: <20241016065700.1090-9-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241016065700.1090-1-quic_kangyang@quicinc.com>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ll3LcVDOC3t2Z7EpmatiJ01v5x3runR8
X-Proofpoint-GUID: ll3LcVDOC3t2Z7EpmatiJ01v5x3runR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=690
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235738_384409_D691773C 
X-CRM114-Status: UNSURE (   9.09  )
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

ath12k_mac_monitor_vdev_create() will set NSS and TX power for monitor
vdev. But this is not needed for monitor vdev.

So delete them.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a145cb217cbd..e4412f7a35b4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1068,7 +1068,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
 	struct ath12k_wmi_vdev_create_arg arg = {};
 	int bit, ret;
 	u8 tmp_addr[6];
-	u16 nss;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -1108,19 +1107,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
 		return ret;
 	}
 
-	nss = hweight32(ar->cfg_tx_chainmask) ? : 1;
-	ret = ath12k_wmi_vdev_set_param_cmd(ar, ar->monitor_vdev_id,
-					    WMI_VDEV_PARAM_NSS, nss);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to set vdev %d chainmask 0x%x, nss %d :%d\n",
-			    ar->monitor_vdev_id, ar->cfg_tx_chainmask, nss, ret);
-		return ret;
-	}
-
-	ret = ath12k_mac_txpower_recalc(ar);
-	if (ret)
-		return ret;
-
 	ar->allocated_vdev_map |= 1LL << ar->monitor_vdev_id;
 	ar->ab->free_vdev_map &= ~(1LL << ar->monitor_vdev_id);
 	ar->num_created_vdevs++;
-- 
2.34.1


