Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD936C35FF4
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trhAx7gj3oFDcuv2GSzeqcX3ro9FbeBPsaw0WhNGBIA=; b=x6kBBH14ntcDBAljVJCc8qMSsk
	DlBLfyermWzYvAi6jtDFupo7ZhERj6lsq0lCiUkU7TZrREK77vge8i7F7pSz9niLTrrvYWvSO6nYi
	1f+Pp/ExgA5JQMf31y8j3MsSdjDj4WcAy3lpNg1+JnRvXoUW4Cp/+QNnys/JA4fK71OV9yPt7KAcN
	aZo9OMmL0YFK+Irl3pCXSKhyStIPuh5EDFWzl+Bz9a3eWOqxnaSvtDScuokMnVpbNNds1l+HTTJkn
	1SdVTugYvfbvZoAZQ/wo+GRCvo0Z6eH23mhIjZ3UX8wU76D5eFtee72Q6YQkq1Uuq7Ionu5dSiPDU
	m4dBg3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8o-0000000BxIf-1ahs
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 17:14:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslJR-0000000BoNX-3eIQ
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 16:21:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DA57dP016250;
	Thu, 13 Mar 2025 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trhAx7gj3oFDcuv2GSzeqcX3ro9FbeBPsaw0WhNGBIA=; b=FsABZJbI/Q9vNKy7
	2uuuLcSTCClSYjudMXjp3uCNxdRtNtUiR8v/zMtbd1njedtwvMxJagZ9XR/5+H0e
	vfkb8ucPN3GFywwd+hvlG0rgTbgfXUZxS+s7DPW6tdSvnZ+Rub+PdjMv150OyLgR
	v4vCLIGrogKOiZ8yOmMr2a06ZzimUYfwvgPuol4tFUwtpGQQpH6RJJSs3StGbGQs
	+t/vkd5dET44j3ugRGjYW+xVeO+MwUnNE+0yvD1gC5g84lQCixiLFwYalayEbT0+
	/4CM+/yGPGAJDcHClrFaE6pu+3ypNtChBK7V5Kpub2pME57srx44XbkgsYBUrGCi
	zAj8TQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nxg8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 16:21:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DGLaDr004823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 16:21:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 09:21:34 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH v9 8/9] wifi: ath12k: Refactor the monitor channel context procedure
Date: Thu, 13 Mar 2025 21:50:59 +0530
Message-ID: <20250313162100.2364049-9-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313162100.2364049-1-quic_periyasa@quicinc.com>
References: <20250313162100.2364049-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o2rfwy4KAXL8YHGBfNCTvq_oMRiz3pl2
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d30611 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ix54J4PnvFNUGTDFoFUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o2rfwy4KAXL8YHGBfNCTvq_oMRiz3pl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=749 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_092137_915231_6132ED23 
X-CRM114-Status: GOOD (  12.55  )
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

Currently, the monitor start procedure use the iteration callback to pick
the last available channel definition in the mac80211 hardware. This
approach is incorrect for the single wiphy model, as it holds multiple
radio/link channel contexts within the same mac80211 hardware. To fix this,
change the iteration callback to pick the specific channel context for the
given radio/link. This approach makes the monitor start procedure
compatible with both multi wiphy and single wiphy models.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index acc775960adf..302db61710bf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1336,19 +1336,9 @@ static int ath12k_mac_monitor_vdev_delete(struct ath12k *ar)
 	return ret;
 }
 
-static void
-ath12k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
-				struct ieee80211_chanctx_conf *conf,
-				void *data)
-{
-	struct cfg80211_chan_def **def = data;
-
-	*def = &conf->def;
-}
-
 static int ath12k_mac_monitor_start(struct ath12k *ar)
 {
-	struct cfg80211_chan_def *chandef = NULL;
+	struct ath12k_mac_get_any_chanctx_conf_arg arg;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -1356,13 +1346,16 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
 	if (ar->monitor_started)
 		return 0;
 
+	arg.ar = ar;
+	arg.chanctx_conf = NULL;
 	ieee80211_iter_chan_contexts_atomic(ath12k_ar_to_hw(ar),
-					    ath12k_mac_get_any_chandef_iter,
-					    &chandef);
-	if (!chandef)
+					    ath12k_mac_get_any_chanctx_conf_iter,
+					    &arg);
+	if (!arg.chanctx_conf)
 		return 0;
 
-	ret = ath12k_mac_monitor_vdev_start(ar, ar->monitor_vdev_id, chandef);
+	ret = ath12k_mac_monitor_vdev_start(ar, ar->monitor_vdev_id,
+					    &arg.chanctx_conf->def);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to start monitor vdev: %d\n", ret);
 		ath12k_mac_monitor_vdev_delete(ar);
-- 
2.34.1


