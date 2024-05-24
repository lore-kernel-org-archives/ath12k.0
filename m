Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB149C25B7C
	for <ath12k@archiver.kernel.org>; Fri, 24 May 2024 02:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQn+T/EMfzff9DRLEGG4a3XpLdiQQhF+wEH1ZsZ0KeQ=; b=dwOP9gSL8sKprcSK/WQdBu2csy
	xBrHFT7NIKBP8G8pvVeK0OtIk0rKjAvre6WGdh5gFLcrbZHnhude1AIza11OMxvUQcqZMpSsutr2n
	GxuVDeeJWwEQygyva/NA91GAzif6sBBiR+69yCA0R8u8QUqogH4g6MdnzVnBbweJX3P9u9ocAQXL9
	hJ25cZmjOEMF35AP2QmFOGSBYqWlzscMcvStqaXIbrew+Ds3Ix7zM6r2s9OCoY4BO/8eeaDcWz2A7
	pKgTF3FyxUI5qvclmKeEWTsa8ZGjR1Q74ca23a+//iLlHTS5XCfqUwQ5Mo4hrtqAjm6AMYP5QoAON
	5Yb/uKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKnl-00000007rZu-0W7i
	for ath12k@archiver.kernel.org;
	Fri, 24 May 2024 02:37:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKnh-00000007rZT-2lAh
	for ath12k@lists.infradead.org;
	Fri, 24 May 2024 02:36:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNQks3023667;
	Fri, 24 May 2024 02:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uQn+T/EMfzff9DRLEGG4a3
	XpLdiQQhF+wEH1ZsZ0KeQ=; b=RLUiM60is82iR1WPYuQgu+nkeOManpeVeU5nge
	ZImEP/a+G+94g6lT0MaLrodXq8qGtkmyBo96/06Ckdb2sQGNJtdypqn9kW9KGqIT
	HGKBNZo92rmyffLaG/e9hY0R7fwPWsewTeDZCz7l3yaN3mvdTNDaOFq/eNDaZMLG
	5k7+mTK8Q1tQ33qV5Jnkc9I6dVVPi5fPlPMAaBbQYF9IYwDCZpYQ4dl9mqZKRIPz
	nBPWmWjIjmAZgXoowo3GZ7FiaBxV+jXuG3W2ORfUXkqUw7sQff5s3+TlDgLY2oX5
	KFjJTJmffa4owzM2yZsFkIA97Rf83vkHSvPNt3gQJzXjYk7g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9u0xv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:36:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O2aqcu030545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:36:52 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 19:36:50 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix race due to setting ATH12K_FLAG_EXT_IRQ_ENABLED too early
Date: Fri, 24 May 2024 10:36:42 +0800
Message-ID: <20240524023642.37030-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pKBQiQfpHmABER4iKJVZTm4_SbzbrsAX
X-Proofpoint-ORIG-GUID: pKBQiQfpHmABER4iKJVZTm4_SbzbrsAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=654 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_193657_840184_83164AA7 
X-CRM114-Status: GOOD (  15.89  )
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

Commit 5082b3e3027e ("wifi: ath11k: fix race due to setting
ATH11K_FLAG_EXT_IRQ_ENABLED too early") fixes a race in ath11k
driver. Since ath12k shares the same logic as ath11k, currently
the race also exists in ath12k: in ath12k_pci_ext_irq_enable(),
ATH12K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
In cases where only one MSI vector is allocated, this results
in a race condition: after ATH12K_FLAG_EXT_IRQ_ENABLED is set
but before NAPI enabled, CE interrupt breaks in. Since IRQ is
shared by CE and data path, ath12k_pci_ext_interrupt_handler()
is also called where we call disable_irq_nosync() to disable
IRQ. Then napi_schedule() is called but it does nothing because
NAPI is not enabled at that time, meaning that
ath12k_pci_ext_grp_napi_poll() will never run, so we have
no chance to call enable_irq() to enable IRQ back. Since IRQ
is shared, all interrupts are disabled and we would finally
get no response from target.

So port ath11k fix here, this is done by setting
ATH12K_FLAG_EXT_IRQ_ENABLED after all NAPI and IRQ work are
done. With the fix, we are sure that by the time
ATH12K_FLAG_EXT_IRQ_ENABLED is set, NAPI is enabled.

Note that the fix above also introduce some side effects:
if ath12k_pci_ext_interrupt_handler() breaks in after NAPI
enabled but before ATH12K_FLAG_EXT_IRQ_ENABLED set, nothing
will be done by the handler this time, the work will be
postponed till the next time the IRQ fires.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index ac75e8e3916b..11b95d037051 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1107,14 +1107,14 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 {
 	int i;
 
-	set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
-
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		napi_enable(&irq_grp->napi);
 		ath12k_pci_ext_grp_enable(irq_grp);
 	}
+
+	set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
 }
 
 void ath12k_pci_ext_irq_disable(struct ath12k_base *ab)

base-commit: fae0804439b5833308ab7d8563c643edb0fa174c
-- 
2.25.1


