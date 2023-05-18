Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD7C77B7D
	for <ath12k@archiver.kernel.org>; Thu, 18 May 2023 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WXPTQFxe4198IhFL7iS2T9zL0YWS/gFOo6SAf+rMcOI=; b=ZkAdp4rq2CiYsH
	GYRAMgEH1hNv2mJZHEJivuUdzRU25r4HVRl0UgsljFQPDGnztx0pWVZ/QMxi6lHIaErOKDxQKmtWO
	+KdBZ140lW+VHFPMmmvdjVNEbHUF/CiKFH1Gdlyl1pcS2RQWphYgXbKPVyHnk80MqAeeYS6XIjcba
	t5pIgx2+CMcTTNjN3ao90zhJoAN5ERrXgENiwkqzVHm82mPOVl0mGXbplu1zi544bsYy7diRB4wkg
	QAT0X796AOnOiuP7h0c73Mxhj5n9E2w/y7IW7V497N7nGiVd8zP4IgyHVEzYhqF5MDQrXKa8RFIqn
	ynFnTGRZMdWKzCTRIa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbKb-00ChFd-1o
	for ath12k@archiver.kernel.org;
	Thu, 18 May 2023 10:58:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbKY-00ChD9-2M
	for ath12k@lists.infradead.org;
	Thu, 18 May 2023 10:58:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I9jnE4027342;
	Thu, 18 May 2023 10:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=+O8R9+PF1o/LWQjR3Z4t4oslJpzFOKFKZAaUDWtXniM=;
 b=Rn145ReH2vriJ+fnJ+KkvF+ifVdd/ZpuHwdCJMGElKYiSYTH7QkgcWJ46B6+M2NhmWCd
 OGt7UFqoeiUg6Ote0INHf6lI+kdIojjVQTDyQ85HZjtmb8i7tQlCDTxPndKN8xtCyZ6E
 YId/xUEbwiDKLlxZpBF5QkwsaHGrmpFVDLNCBYErE+FXeKj2ASLyp1FNY+x3x5EXBQIx
 CTJCEuRlAA1rMyEzZ0tW11M5MbMX4Kn54ZtsnqhWUS02ANeI1DVlDJyg5mrT91qz75u0
 2E00pqLMR6/V5xxQ00mCWnWflCO7H2f/eIXYFVj1LkmlNZVCxBETdwN8i23sVodB1ChC ng== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnbxqgsg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:57:57 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IAvvWs029784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:57:57 GMT
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 18 May 2023 03:57:55 -0700
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_cjhuang@quicinc.com>
Subject: [PATCH] wifi: ath12k: check hardware major version for WCN7850
Date: Thu, 18 May 2023 18:57:41 +0800
Message-ID: <20230518105741.1281424-1-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4mzUu_X-y5xBKSyKBXCWy11q0mdo0ppL
X-Proofpoint-GUID: 4mzUu_X-y5xBKSyKBXCWy11q0mdo0ppL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_08,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_035758_774865_D2BBBB96 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This is to check the hardware major version for WCN7850 so only
supported hardware is initialized. Now only WCN7850 with major
version 2 is supported.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 9f174daf324c..5990a55801f0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1227,8 +1227,20 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	case WCN7850_DEVICE_ID:
 		ab_pci->msi_config = &ath12k_msi_config[0];
 		ab->static_window_map = false;
-		ab->hw_rev = ATH12K_HW_WCN7850_HW20;
 		ab_pci->pci_ops = &ath12k_pci_ops_wcn7850;
+		ath12k_pci_read_hw_version(ab, &soc_hw_version_major,
+					   &soc_hw_version_minor);
+		switch (soc_hw_version_major) {
+		case ATH12K_PCI_SOC_HW_VERSION_2:
+			ab->hw_rev = ATH12K_HW_WCN7850_HW20;
+			break;
+		default:
+			dev_err(&pdev->dev,
+				"Unknown hardware version found for WCN7850: 0x%x\n",
+				soc_hw_version_major);
+			ret = -EOPNOTSUPP;
+			goto err_pci_free_region;
+		}
 		break;
 
 	default:

base-commit: 610b78b97bad8f3e77c27a15e9a03cbbb4109697
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
