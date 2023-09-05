Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FF9CA1008
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLfFDXiTmpdNhR1b15NdyWMmBbPVNEg5BJZXEKPjHI4=; b=b6pMSjYogzMCwU
	HW7Qr1EeutQmV+KQjYHqZXtPRPhWQNet7qP3/esfAfJ7JCI/kFWvV+AKsDOpVQL18fuAqw78lA4x7
	beYArh2HEJoib15twjrI6THiifSudTgK8VduTdApunoXVlQUbR/bPCttwoq5g6hv8zm7xFggTzpgd
	QJvi8kLfInLUCAgNcD80cJ9fXboajkii4i0nkyIRCUPQVVd4nEgX5QmT8RHE5FaVLVcPtCA7eZE1A
	S9CLIrwE1AingPGzAIVwprPk46Tom1GqWF/m3l2CrfgBHrdQhslM5RfS8JvsB86sCrWzhsLG1PzaE
	Dsyu7FcuKDjqDUwDQ1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qddm5-006lvB-0C
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 21:39:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qddm3-006luS-0s
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 21:39:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385JPRwM022989;
	Tue, 5 Sep 2023 21:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=QLCZeJmP+8FVnWoQVzQw0ttWKSbb0QiAN1JR6PAmcaY=;
 b=TGEPrqNYUOdyNICjp1eUghxlQsj+HS8NU62Dv0Ch95+1YwR55rWy8qskEfhopkh+5pur
 c3x+FRrg/QvOQUXwx1RIKG2dG8l6ppBEvCu7rE4fQ5am3QsWwWqqy6xCx+1bg08ID2UE
 2p/KoYoUYv9xNuNtOuBpAMqfyu00/Oh1W2R2cBKTIie4t3mCYSxE0iv1K/jgg3TQY97O
 lXv7JHOdXVK16iW18q+CLQ25qC8ifylq+G+msBU0eXJxhLPSyfrzQVz5gXdvt2MpaAiL
 cKiMZHW6WSLfEC2WbLuGDt2TYxfLGqkst+ixJ6t1pvZjtuC3wUWQ08t9Fa//pYEHD5us Cw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swsp5adgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 21:39:46 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 385LdjDO013914;
	Tue, 5 Sep 2023 21:39:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3sux4ky9ex-1;
	Tue, 05 Sep 2023 21:39:45 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 385LcW7v013054;
	Tue, 5 Sep 2023 21:39:45 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-sidhanta-lv.qualcomm.com [10.47.205.116])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 385LdjJo013906;
	Tue, 05 Sep 2023 21:39:45 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4194996)
	id D0F9450017D; Tue,  5 Sep 2023 14:39:44 -0700 (PDT)
From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sidhanta Sahu <quic_sidhanta@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: Set default beacon mode to burst mode
Date: Tue,  5 Sep 2023 14:39:43 -0700
Message-Id: <20230905213943.12275-1-quic_sidhanta@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z49P9fYDczGLLdPZd_iMiyaKiu6uwn4f
X-Proofpoint-GUID: z49P9fYDczGLLdPZd_iMiyaKiu6uwn4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=947 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_143951_449597_A2F67D4E 
X-CRM114-Status: GOOD (  14.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, firmware does not like when beacon mode is set as staggered
mode for more than one beaconing vifs. Beacon mode for multiple
beaconing (transmitted) vifs are expected to be in burst mode. So set
beacon mode to burst mode by default.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
---
v2: Modified the debug log.

 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1bb9802ef569..d38b85eaed37 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2314,7 +2314,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
-		param_value = WMI_BEACON_STAGGERED_MODE;
+		param_value = WMI_BEACON_BURST_MODE;
 		ret = ath12k_wmi_pdev_set_param(ar, param_id,
 						param_value, ar->pdev->pdev_id);
 		if (ret)
@@ -2322,7 +2322,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id);
 		else
 			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-				   "Set staggered beacon mode for VDEV: %d\n",
+				   "Set burst beacon mode for VDEV: %d\n",
 				   arvif->vdev_id);
 
 		ret = ath12k_mac_setup_bcn_tmpl(arvif);
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
