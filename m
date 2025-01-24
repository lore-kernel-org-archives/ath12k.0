Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FB0C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+VdPkH8MNd89kH0DDEnn488Yrtdw3TlkM78HIsLDW/s=; b=IFBmt76H+NP5ikjuJWP4nomUwb
	YfywCdzL5u/N9pBn4ff32xZvqu5ZRS4thNpLN4q9F8SW/iDSNJYUACpAet7A9/prP69EZB3JhULX5
	2tqXh5+h4vsmyx7bJGMATdjgRhXvZr24TGYtejZ1iIotRyh5cYx/C8ANNulc6iCFpDXn8V+Q7AYLA
	Im4yHY3HDL1bkjXbVLe4YvPVxQa0N8zamDDf2HskAmP92V57HpolwzJhzSBkhy5uCt4xmM8uDkbpI
	g/UrHLPzXweRCkvR/+hdlqFAtZhxVNKrBRjKXjWPlkn/n3noqjHpaEhx1gItVtjNJMjqlXvgF5ph1
	ohpbdPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDNl-0000000E1IP-1mXc
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 06:41:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDNk-0000000E1Hz-0BDW
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 06:41:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O1KvEl021872;
	Fri, 24 Jan 2025 06:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+VdPkH8MNd89kH0DDEnn48
	8Yrtdw3TlkM78HIsLDW/s=; b=IVhUOAeaJE5g86LtM2/K921VEVknP82zCIjkQk
	7juR3drVGrjwPU4jXuMeCNAP5qRsNkGVFO3CLIJ/5oIzp17erj7RvyIc5ca1BlH6
	xsSTNMFittgTYa8u1KrX9CRlQia3ZAh3AbsxtihZUuMYaV7DkgLsw7NQ0t1HRkgQ
	+ttsk8Eu/Vys4hrrWmrZyw56Nmo4uQET9PeURbvIb6Gj8Hx3otaFgM177lpHbjQl
	Kudy8dR3jDdGvcKaBZt+imn2Q+r3xvxZOAuxTJ5juzP8qOlZP3cHRZ5FUs2JQ/eA
	ogA5t/sDR0MS8h5B2+/1eYY5ubIeCWObXaqdnGEbbOef0Q0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c147rkbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:41:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O6fTBi014391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:41:29 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 22:41:27 -0800
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Avula Sri Charan
	<quic_asrichar@quicinc.com>,
        Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Subject: [PATCH] wifi: ath12k: Avoid napi_sync before napi_enable
Date: Fri, 24 Jan 2025 12:11:06 +0530
Message-ID: <20250124064106.3066564-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tnZ318iFMZJqQ2pEm14Mpj5X5GnwyqMS
X-Proofpoint-GUID: tnZ318iFMZJqQ2pEm14Mpj5X5GnwyqMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501240047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_224132_091912_D9E4D751 
X-CRM114-Status: GOOD (  14.05  )
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

From: Avula Sri Charan <quic_asrichar@quicinc.com>

In case of MHI error a reset work will be queued
which will try napi_disable after napi_synchronize.

As the napi will be only enabled after qmi_firmware_ready
event trying napi_synchronize before napi_enable will
result in indefinite sleep in case of a firmware crash
in QMI init sequence.

To avoid this introduce napi_enabled flag to check
if napi is enabled or not before calling napi_synchronize.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/pci.c  | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 86a1eeec64a6..b5adbb21315a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -166,6 +166,7 @@ struct ath12k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
 };
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4a50d7118b3e..24c5ef96baf6 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -483,8 +483,11 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 		ath12k_pci_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -1114,7 +1117,11 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
+
 		ath12k_pci_ext_grp_enable(irq_grp);
 	}
 

base-commit: 376673aa393c1c232299be3e910d7f2e6d974b2f
prerequisite-patch-id: 07c9ff6fcaf4ba464be993caa19eb49113eedbdf
-- 
2.34.1


