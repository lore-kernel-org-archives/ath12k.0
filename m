Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC1AC0218B
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 04:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EnnFZH2awo5EQWEOuRjB5KQyArOcOpqfYYRzOLPRPY=; b=enGILiH3tuFX3315ypzoIQnsLS
	LMntbeKSdIlE2Y5vumA5eCPNx2UfKg+tWSlRYIDS6iOdarXMdo/BEU7TVzHL+H01C9e/D8sy404N5
	M+bOdtdtlrUB60NaJwa/cmHFdYDcKW45vUqOfV/cd7CF+mcbfgIGE13w4A/aSyduOdVEYJUPD5Ic/
	N566Ehf5aGR9bbMMgDsDRJb4M47021msCmVK39uQnDnngToHHtDq4Cd4EGu12mDeHZO/R+Jk/E3Pa
	dU0GJ5bAXAzTmsSf8QWKzLXyauW5OpHsk/63lJf/ccQVYzf4HJZFkBwumFiAUBvLvgWcJ6pzqB/F8
	Bwu3ykrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBWP-0000000Dtuh-3mRI
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 04:42:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBWM-0000000DtsQ-3sQj
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 04:42:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O1Klu5021737;
	Fri, 24 Jan 2025 04:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EnnFZH2awo5EQWEOuRjB5KQyArOcOpqfYYRzOLPRPY=; b=h9OGr9ngK1O7aYy2
	4abzCcmFRuj6fkLw6EO7GL+sSjhA++8q7Z65KGVGHjq37shnQzfYYEw+CtW0qLMD
	Bi8Jm9WV2P8B7jrVDzdFdPHFIC62WBmeZ+bWF3W5VBnUYytS8F1tJT4ppPaDtbym
	pIW5DJNVdKF7DFvieKzoZuySsHREyqhNkY3DFqwN1u/RWytHjfjivcU/OxzuDpc6
	RgKBNjp5JmaDnu1EAITzEczi+bUofRE4n+eXk92ENG35i27BdTvdSTQOwKC1CF7e
	TkAbOULJp4XMOH3gSLBEg2ghN030nZ4dmPLGb3utTnM5NO2uJxvREUH4qJ2Q4lIU
	QAu6cA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c1488c1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:42:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O4gG0u031191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:42:16 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 20:42:13 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 10:11:32 +0530
Subject: [PATCH v3 09/10] wifi: ath12k: handle ath12k_core_reset() with
 hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-fix_reboot_issues_with_hw_grouping-v3-9-329030b18d9e@quicinc.com>
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
X-Proofpoint-GUID: 4YYy2RpJ9mQXKTN1fp-PJBWmr5bsdpf1
X-Proofpoint-ORIG-GUID: 4YYy2RpJ9mQXKTN1fp-PJBWmr5bsdpf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204218_970672_B8410C0F 
X-CRM114-Status: GOOD (  15.52  )
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

Currently, in ath12k_core_reset(), the device is powered up immediately
after a power down. However, with hardware grouping, when one device
asserts, all partner devices also asserts. If there is a delay in
processing these asserts, by the time this device powers up, other devices
might still be asserting, leading to an overall recovery failure.

To prevent this issue, ensure all asserts for a group are processed before
initiating the power-up sequence.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 95478b69af25448428d1621b163da794520672eb..03860f635d0226e6f6c83aed7f316a1011bb46a7 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1432,7 +1432,8 @@ static void ath12k_core_restart(struct work_struct *work)
 static void ath12k_core_reset(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, reset_work);
-	int reset_count, fail_cont_count;
+	struct ath12k_hw_group *ag = ab->ag;
+	int reset_count, fail_cont_count, i;
 	long time_left;
 
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
@@ -1491,9 +1492,32 @@ static void ath12k_core_reset(struct work_struct *work)
 	ath12k_hif_ce_irq_disable(ab);
 
 	ath12k_hif_power_down(ab, false);
-	ath12k_hif_power_up(ab);
 
-	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	/* prepare for power up */
+	ab->qmi.num_radios = U8_MAX;
+	ab->single_chip_mlo_supp = false;
+
+	mutex_lock(&ag->mutex);
+	ath12k_core_to_group_ref_put(ab);
+
+	if (ag->num_started > 0) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "waiting for %d partner device(s) to reset\n",
+			   ag->num_started);
+		mutex_unlock(&ag->mutex);
+		return;
+	}
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_hif_power_up(ab);
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	}
+
+	mutex_unlock(&ag->mutex);
 }
 
 int ath12k_core_pre_init(struct ath12k_base *ab)

-- 
2.34.1


