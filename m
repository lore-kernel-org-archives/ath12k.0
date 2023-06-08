Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212BC7EE29
	for <ath12k@archiver.kernel.org>; Thu,  8 Jun 2023 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uyUb/JENQSMnuxDZ3C0ldS7A+zV33WHK0AIvtrQFIG4=; b=w6iPaYjX4ywTjA
	gDimi4sHcj7l38ByZzPjJ4/Oyi8gCxQ3/PINkO2oOXVUMS3F4yLJcgUprbbz0h4aLgpIuDwyX3kFR
	i4nnWmLPXJE7mIomvWKGDmRxYxhyu/H5NcCwkdEbnL+MmVS350lTYWL9AQTofD41Ayid9DkMGg2vz
	i/5AUHzFEcwjL06C3VpY+klJECbm8gEK6DX3FeJYT5w21w8AbzdihjCJBGeBOgAzcuO0EKDkUQbGJ
	E+biZ973odX5kA/fVEu34HQtJZll2f5IuTwZqjT67O9iVQIcWw3MvmCgLqoVXRyH11otcOhvjIagi
	HIubxEsXqTqDjNW3JLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7D8e-008wuy-0v
	for ath12k@archiver.kernel.org;
	Thu, 08 Jun 2023 10:45:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7D8b-008wqG-12
	for ath12k@lists.infradead.org;
	Thu, 08 Jun 2023 10:45:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358AVfvC010297;
	Thu, 8 Jun 2023 10:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=sXR/KTOVzWTPEE33qcIo/B5p7AYPQ5VgOxwa6AMawWo=;
 b=cwhFFbEN4sYVLLLa5Im5UYMY1IoCFGfIZwl48gNyOBH0NpHSdHHjzTenbrj6cVyydsRi
 +NPvNltvqx0fZvC7ZG0plC2jvjlUOwM1PSaOmSoxPP+20cwkAA/Ic/lPhPsRVLzrNAue
 8Wra7K3kCBHU6Cm2WDWZ7aNuNy3IlALru0an/krujqij9Q9LuNTy76A7qH+Sdp8/IJTt
 4Oyxep07NL3bGXt5NBLtj6xVsdeeRSbte7ZeNOpf0FdQo6byjvsBFpvtv4lDAuuY3piQ
 mjkowiRIN4IdKB6Rs0fABeSRagijgl2h852+YuDpBgIVAwAUnLd5gJPcMKjDM0LqFlha Ng== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r38rbrk2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 10:45:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 358AixY9010195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jun 2023 10:44:59 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 03:44:58 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix conf_mutex in ath12k_mac_op_unassign_vif_chanctx()
Date: Thu, 8 Jun 2023 06:44:44 -0400
Message-ID: <20230608104444.3134-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K0U76srNi_rSLr4Xr_4MTTho5NsvIoJ2
X-Proofpoint-ORIG-GUID: K0U76srNi_rSLr4Xr_4MTTho5NsvIoJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_07,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=795 priorityscore=1501 lowpriorityscore=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_034505_501038_6B84959F 
X-CRM114-Status: GOOD (  12.71  )
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

"mutex_unlock(&ar->conf_mutex);" is always called at end of function
ath12k_mac_op_unassign_vif_chanctx(), so delete this unlock to make
sure lock/unlock is paired.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b411..e65f5337d8f5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5910,7 +5910,6 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		}
 
 		arvif->is_started = false;
-		mutex_unlock(&ar->conf_mutex);
 	}
 
 	ret = ath12k_mac_vdev_stop(arvif);

base-commit: 0a00db612b6df1fad80485e3642529d1f28ea084
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
