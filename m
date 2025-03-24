Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA0C3600B
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUcktDthoKjzjU6RzapM9C0Q12YHCFkZAk/Tpt4I9DY=; b=VvES/PYdjqUM54bdG5DbLtiTiJ
	nyQUMXKKdHQdgmQdrd7iBIV5uCxHnmAomvGKcMlvs3TOqiQDc4HlZ6jTCm/zbEvsKVSg9NB9Vfm4H
	uTAL81zXtyNj9Uh9O1mwL1+f7c8Kk7nu+GkEiTkjWFfAwbA1zwwIrXnnhM6njWBK1FeMxvIwW5ceg
	lqeuX84zgdhmASDzB/KODcTinI+uOJ/pABT8JzbMK6J8beEegv3lMxGjsIVQVTyp2ABMIRcYowncV
	TQegE2WJlqIHlhu3OtVgV7PPbOnzgMYyzHkShbr6cPIOn4mVglZIERi/TQApAWohkl9yN5JzJO+p1
	H1sNf7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbQj-00000002LCj-2Tte
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 06:37:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbFv-00000002Jek-3lBq
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 06:25:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6FXd2012012;
	Mon, 24 Mar 2025 06:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUcktDthoKjzjU6RzapM9C0Q12YHCFkZAk/Tpt4I9DY=; b=UkUBcWhzal1cgc5i
	E7PeSpBEvCJ9uAFd2FgTLzEhQXxCUPJYiMgMU44TYSpC7E/EK0CetqBZXiWJOUPE
	wGIzZpFiwuGSPSiTg4AoU6gRKC4VVO3MpM31tzyc7bZHFP3fv7FlgLXAJOBnygYp
	iPcSihc79oZa1GPV20FrJtrky4ZSN3oQdCp6mgamCNGJ7P563ugl1Tw69iXulFcZ
	2Rwk8ktxSM2grw21uZ3VuMtb2Z565oW344nPXlLnh6ye1lAoYWb+hIMpQpEemTxF
	3ebNwa7q/TyD1HM8rvsJ0PIO/gclebIYWfHWEEzdAVzSct8aDMsrRUI/qO4lTpGB
	30odbw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnk8k999-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:25:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6PoDW013079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:25:50 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Mar 2025 23:25:48 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH v11 07/10] wifi: ath12k: fix NULL access in assign channel context handler
Date: Mon, 24 Mar 2025 11:55:15 +0530
Message-ID: <20250324062518.2752822-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
References: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -5Wdt6lJfNlsqXr0eVwU_bYpGjvlyLiq
X-Authority-Analysis: v=2.4 cv=KMlaDEFo c=1 sm=1 tr=0 ts=67e0faef cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=On6beQQLwNlP3L0m5AoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -5Wdt6lJfNlsqXr0eVwU_bYpGjvlyLiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=917
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232552_055732_244F07F7 
X-CRM114-Status: GOOD (  12.35  )
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

Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
(ar) gets accessed from the link VIF handle (arvif) for debug logging, This
is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
access, avoid radio handle access by moving to the hardware debug logging
helper function (ath12k_hw_warn).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 90570ba4610b ("wifi: ath12k: do not return invalid link id for scan link")
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d7f4f4b31ff4..520d7dc52f02 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9604,8 +9604,8 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	ar = ath12k_mac_assign_vif_to_vdev(hw, arvif, ctx);
 	if (!ar) {
-		ath12k_warn(arvif->ar->ab, "failed to assign chanctx for vif %pM link id %u link vif is already started",
-			    vif->addr, link_id);
+		ath12k_hw_warn(ah, "failed to assign chanctx for vif %pM link id %u link vif is already started",
+			       vif->addr, link_id);
 		return -EINVAL;
 	}
 
-- 
2.34.1


