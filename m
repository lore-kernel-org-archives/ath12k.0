Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C99C0218B
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 04:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2M3nYMBsn8GMd/Oc3+XTojCq+G9Z/vw/A5szHksgek=; b=Dvei6LU33O2BPd3q5/yYXGEM3j
	BmCT6t52NZ3dwaWGpEL3eYQScMIclf7MubXg80S9Ltz3hcS6a3SKIOU30mu9Mxt6BS4Z5SBMZ03bH
	x0BlzIZRX/qLjiv4qwaPdKTpROT4bJikgLCAsDm76yvLu98mZt0ZNKkZWQRefXGq6MK3H0YT1YhE2
	yFe9z91SjGsBwdLk3v64uzLXs2h482nfmJRAGtxOXcXgfEBl8R5T6fWW6i5/JzUSv8HZuzGIqfYop
	rvmV2TxRJP9oxCKcBjeebmuGghYLZTJA1xwZQuF6SoIHzRtmW99txGHsEO3muXpNYW4QbEnW2TBuB
	dumr9Lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBWA-0000000Dtjp-0hDX
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 04:42:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBW7-0000000DtiZ-1f0a
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 04:42:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NG3mu5011267;
	Fri, 24 Jan 2025 04:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2M3nYMBsn8GMd/Oc3+XTojCq+G9Z/vw/A5szHksgek=; b=AtXR4WqCmYXaI61x
	Ng3Mk8rSn3XHHYSTSNjWDSjoQqXgBliXkOWLcXFRBzuP1KwKPuhK8PkQDd38+5+O
	bITj7VhSCjkJ7BTDpY4jIOhzq4PkHaQjaoac2skOTUfQNOnQJgnwaxJjTz4bgI4U
	A7vqbmeIjj3I8qMLwczDGnuFBX8S1vA27GKveDCOn2cBi+dGeHRZ0NFl8Mt0S+cz
	1RztzqUOxJcultOWvie+2iGf7Y2FgqgHDsflJjDrxF7YNZwHse+s5r9h0Y6KRqj5
	8GgEm1JtVqU/CghqmOwNcGN9ereZ4Zn9myWSbFhYIsbtACOtccUlcQXAXc3LdlJ+
	0/ATzg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bry6sctq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:42:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O4fxqg031228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:41:59 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 20:41:56 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 10:11:27 +0530
Subject: [PATCH v3 04/10] wifi: ath12k: fix firmware assert during reboot
 with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-fix_reboot_issues_with_hw_grouping-v3-4-329030b18d9e@quicinc.com>
References: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
In-Reply-To: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<quic_kvalo@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UzbE2XA3hQNKp2LBw69k30J2P37SN4Wh
X-Proofpoint-GUID: UzbE2XA3hQNKp2LBw69k30J2P37SN4Wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204203_558770_5EB82B9A 
X-CRM114-Status: GOOD (  13.07  )
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

At present, during PCI shutdown, the power down is only executed for a
single device. However, when operating in a group, all devices need to be
powered down simultaneously. Failure to do so will result in a firmware
assertion.

Hence, introduce a new ath12k_pci_hw_group_power_down() and call it during
power down. This will ensure that all partner devices are properly powered
down.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 9aa6ce6e9f92461833ec2e0eead20fff2ccbc663..d7e6c2c843223890eac9da8145d732ed2c74e907 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1752,13 +1752,34 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	ath12k_core_free(ab);
 }
 
+static void ath12k_pci_hw_group_power_down(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	if (!ag)
+		return;
+
+	mutex_lock(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_pci_power_down(ab, false);
+	}
+
+	mutex_unlock(&ag->mutex);
+}
+
 static void ath12k_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ath12k_base *ab = pci_get_drvdata(pdev);
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
 	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
-	ath12k_pci_power_down(ab, false);
+	ath12k_pci_hw_group_power_down(ab->ag);
 }
 
 static __maybe_unused int ath12k_pci_pm_suspend(struct device *dev)

-- 
2.34.1


