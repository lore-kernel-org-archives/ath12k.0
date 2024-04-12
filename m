Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D468C04FFE
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HUqW0g3dBDZuUgtkY+5SomlQdIkoT9yzaHjR3Z7/0w=; b=HkF/LwQSZAM2hc6iyj9n/5NU44
	NubNGPmlisQEIopICjoTRgVVGijUoE1HfvyZdPiC8wpcManoqI0pT1qRLW8h8n2k9PYllhk4TU3DH
	NPFNl3nAdjSyPYq48ctg741MRNRBEsmJRMbhR7o5eILvQLNS7quJ501OMgIxrVuhzOS3lzDyQb9DD
	k7nh51faNp4hEto8au5P4MGTvpB0w7OfZtA1EsZCw0WWz4QXM4lbkXcTyp/c9qAWdbueeLl+88JFZ
	OFxgvC0DTNnGiPemINwFXv9dzc0AkPRZUjxnlXfD3JVp8HS4EPAAVe/Pgks4QwHsmXupforFnC9H6
	0jPnQN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3p-0000000FV8U-2GeN
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3k-0000000FV4u-2jKj
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C4hV26022257;
	Fri, 12 Apr 2024 06:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=8HUqW0g3dBDZuUgtkY+5SomlQdIkoT9yzaHjR3Z7/0w=; b=Rr
	3QBx4Z4UwVv6GbsoLReKAB/MXKyS53xVYa9UuVB7iOcR6t8+KsJ6Bc2qX7fjswds
	z6pnIma4hQrUT24c85Uv3ETeX5ufxquSCmARwFlA2uZgCbLH6Gc7J+rLG+VJH93N
	gmAGtf9y3MAYtsUCg3zGxw6azc1LdzYXum25vHNKDi6mvuSlNwLbSdAcBzK6vxjC
	dz7s/PPaP3sG0G71k8kpmoVYTzEecZfqfvmtGftZWB+xoWgsnpG19HAn0q4V/eKP
	e7e6BFkov76Fij/ORh+GCsaTAoLiwzPVetvSYRVV2T0HdgUJuoIs4/CF96fzx/9A
	X0lDqiaAPMIJ+EvlN+MA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebqxb5km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66lNr008362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:47 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:46 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 08/10] wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
Date: Fri, 12 Apr 2024 14:06:18 +0800
Message-ID: <20240412060620.27519-9-quic_bqiang@quicinc.com>
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
X-Proofpoint-GUID: sghHdIAN7K3Rkc13tN2rpfa-0KHJiDR6
X-Proofpoint-ORIG-GUID: sghHdIAN7K3Rkc13tN2rpfa-0KHJiDR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=816 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230648_817823_98420E3C 
X-CRM114-Status: GOOD (  12.11  )
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

Currently when resume ath12k_core_restart() calls
ath12k_core_pre_reconfigure_recovery() where mac80211 queues are
stopped by calling ieee80211_stop_queues(). Then in
ath12k_mac_op_reconfig_complete() those queues are not started
because ieee80211_wake_queues() is skipped due to the check on
reconfig_type. The result is that mac80211
could not deliver any frame to ath12k to send out, finally making
connection fail.

[84473.104249] PM: suspend exit
[84479.372397] wlan0: no VHT 160 MHz capability on 5 GHz, limiting to 80 MHz
[84479.372401] wlan0: determined local STA to be EHT, BW limited to 80 MHz
[84479.372416] wlan0: determined AP 00:03:7f:12:b7:b7 to be HE
[84479.372420] wlan0: connecting with HE mode, max bandwidth 80 MHz
[84479.580348] wlan0: authenticate with 00:03:7f:12:b7:b7 (local address=00:03:7f:37:11:53)
[84479.580351] wlan0: send auth to 00:03:7f:12:b7:b7 (try 1/3)
[84480.698993] wlan0: send auth to 00:03:7f:12:b7:b7 (try 2/3)
[84481.816505] wlan0: send auth to 00:03:7f:12:b7:b7 (try 3/3)
[84482.810966] wlan0: authentication with 00:03:7f:12:b7:b7 timed out

Actually we don't need to stop/start queues during suspend/resume,
so remove ath12k_core_pre_reconfigure_recovery() from ath12k_core_restart().
This won't cause any regression because currently the only chance
ath12k_core_restart() gets called is in reset case, where ab->is_reset
is set so that function will never be executed.

Also remove ath12k_core_post_reconfigure_recovery() because it is
not needed in suspend/resume case. This is also valid due to above
analysis.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index aeb7f9e43cc4..380a3c8f7201 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1045,9 +1045,6 @@ static void ath12k_core_restart(struct work_struct *work)
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, restart_work);
 	int ret;
 
-	if (!ab->is_reset)
-		ath12k_core_pre_reconfigure_recovery(ab);
-
 	ret = ath12k_core_reconfigure_on_crash(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to reconfigure driver on crash recovery\n");
@@ -1056,9 +1053,6 @@ static void ath12k_core_restart(struct work_struct *work)
 
 	if (ab->is_reset)
 		complete_all(&ab->reconfigure_complete);
-
-	if (!ab->is_reset)
-		ath12k_core_post_reconfigure_recovery(ab);
 }
 
 static void ath12k_core_reset(struct work_struct *work)
-- 
2.25.1


