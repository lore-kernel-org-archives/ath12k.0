Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EA8C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRFcpXVNOD995PB4K/wG8/Iyn227BDybTQ8ptYNTGYM=; b=HhX9DnuBVErkDRaIMyKgn21kHI
	QNKfoZxZ0McLXlySWNc79JHuU0bdHZ1lBd6O/2TT+SyAboFZ2jKekmkFcxYD8OwjWN7IuUuZaoLim
	B2TFeGbz1TGImrwvCJdX7sFSVgN8TH864e2MQMs5SjFxX2Yp0B36Uyk8zNg1Ti2hgJ3wcWCvMcS94
	RCjrQKqGcD4dELy9zWiTKTT4NOVFs2JY21HhGUF7FpQWpZWkw9F3gW2F2qT79z0G7OhFJCE5BpIks
	v2ptJE+jl004DqydzpOfDBeUNDHGaOQj+JwS1w6eNLHIcw4V492PE6CznPQN+3iTOni/A2pdISxjX
	2rNSZGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3f-0000000FV1E-06HZ
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3c-0000000FUzl-068b
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C2pC91019922;
	Fri, 12 Apr 2024 06:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=pRFcpXVNOD995PB4K/wG8/Iyn227BDybTQ8ptYNTGYM=; b=I7
	MpYg+9EoyXxeVoI7kYa/Fi/H4XRBNWbz1qT2EX6eIG1hKO0zyFO3z3BmGDx1VMxD
	kJBaXBK54rXLFw0/XigsqgmpdC23Zr9mMlhEiAA6QuJhEqoSBH+RDlo1FdpLbRXK
	dyZ5/90u68zph15KTvRCz40aZVuZTC7SYLSFhCT+N3BqwiizSC/EdxFJf8gYEo7B
	5Cc1q6fr2Ak4Mm1sbVeokRDKagZ3OcEXsIl3uAlC8rZIcfcwg6ry3SZTXHCc7lKN
	wlMIJPtAWJM6PK5J/OGTO8P4WIwwxoP6QyHiiAShoUvq/Byh1eCPxAnNQ2XOB/U1
	pYzviD3E2YQQ6zba7Sdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeskt0n7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66bB6031852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:37 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:36 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 01/10] wifi: ath12k: rearrange IRQ enable/disable in reset path
Date: Fri, 12 Apr 2024 14:06:11 +0800
Message-ID: <20240412060620.27519-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: okI0-Nlwn17i-5Pbj4lldUj1M3sEjUzZ
X-Proofpoint-ORIG-GUID: okI0-Nlwn17i-5Pbj4lldUj1M3sEjUzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=842 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230640_092964_C2D4D22A 
X-CRM114-Status: GOOD (  10.00  )
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

For non-WoW suspend/resume, ath12k host powers down whole hardware
when suspend and powers up it when resume, the code path it goes
through is very like the ath12k reset logic.

In order to reuse that logic, rearrange IRQ handling in the reset
path.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3c522a4b3e9b..28663cf4db30 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -879,9 +879,8 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 	int ret;
 
 	mutex_lock(&ab->core_lock);
-	ath12k_hif_irq_disable(ab);
 	ath12k_dp_pdev_free(ab);
-	ath12k_hif_stop(ab);
+	ath12k_ce_cleanup_pipes(ab);
 	ath12k_wmi_detach(ab);
 	ath12k_dp_rx_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
@@ -1136,6 +1135,9 @@ static void ath12k_core_reset(struct work_struct *work)
 	time_left = wait_for_completion_timeout(&ab->recovery_start,
 						ATH12K_RECOVER_START_TIMEOUT_HZ);
 
+	ath12k_hif_irq_disable(ab);
+	ath12k_hif_ce_irq_disable(ab);
+
 	ath12k_hif_power_down(ab);
 	ath12k_qmi_free_resource(ab);
 	ath12k_hif_power_up(ab);
-- 
2.25.1


