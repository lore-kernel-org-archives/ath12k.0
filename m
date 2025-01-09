Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6AE77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ9XyFfGCxHrQXQRtzJEYp6fmUaUdlCy1HARoqkA6Xc=; b=Ro8rqEJco4GOqJdAESVPHOR+PS
	96PKTJlXx+0NSUWeaEk7CSdJk5IOmFK0aEUv0E1CKYBCUe3sQ8DPaNAz+4U8iLnhoSnKtZgQjRft0
	9lA0pLEg81zyuQuV/HIjmDPQJTQk+Dz8Y3twbB1d/kz+ElT32aK+MtKrSPZAeEqNLvxuto69+OQAj
	2tjoSavNbnZkw3EV+HKMIivroMFb9ufvHn1rM52Sh5uvI1CYiCIJtCzRVkLir9em77yYTlU8KDZPW
	mkDC2AGjSWPIerdZ4NVfeFlvCse34BWkrX9vc1D93jWMEhXfgYCge7z14MveforvPJKprDB+FcgoJ
	ntpYVBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7L-0000000Ahiu-03Bz
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:25:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7I-0000000AhhN-2FA8
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:25:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HbYWG011058;
	Thu, 9 Jan 2025 04:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJ9XyFfGCxHrQXQRtzJEYp6fmUaUdlCy1HARoqkA6Xc=; b=aYLtbeLswVCPw47k
	iKkG4h1iXvu7eAszJdSvxPIAtBx3H/AP+nTjo1LXZtveRuIMYZUNw2ri5Hp9YbE8
	KCEBLBjZAnDRzoLZlqnuzHvgTciPwT+x18Q9WcvyiIOB4FHaC4XJbRjVLPonKnGc
	jqnhYq0IvUKjPRK8rkLLG3gRP3qQeB65unVaQAjhpX/hnTvki21J4E4p3T6ypSV2
	kaBsKNY41bjXcENo3bj0pit10J+punktLHfLKlF3qtThPof96HHZAHLJnS3suv5p
	dfb8pUBZANdDBuCMNFn17Ec4sxTHPrP4T0ogJ4zh6yZDxSFNtgj9QaAVgDHKXbDX
	q/vN2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wx619tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:25:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094PrrF012581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:25:53 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 20:25:50 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Thu, 9 Jan 2025 09:55:32 +0530
Subject: [PATCH 04/10] wifi: ath12k: fix firmware assert during reboot with
 hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-fix_reboot_issues_with_hw_grouping-v1-4-fb39ec03451e@quicinc.com>
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
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
X-Proofpoint-GUID: khtI4-J6aXcYuWN3Dt7z7QGiOnuFuM5S
X-Proofpoint-ORIG-GUID: khtI4-J6aXcYuWN3Dt7z7QGiOnuFuM5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_202556_584859_2641E2B3 
X-CRM114-Status: GOOD (  13.32  )
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
index 837be309cd45a2d037ee8c3bba8f7be0f457d6b2..7f6521a56ffc0f1e9687c94d6829a9c1f1887661 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1751,13 +1751,34 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
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


