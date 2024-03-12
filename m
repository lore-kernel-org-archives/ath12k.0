Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577AC54E60
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ooT2xNwMhbWwrEQmrl62I+wO7+i9J6o798XT7Cmwm4=; b=A0YpTVFJiknNGAE1LwH5u9O9Hn
	mmZONC/mozHgAMSZZMBgRSDkTATHvSv/Yid2DlZAF+me6PhJQonimZFfhXy7di1zJbqdw2JppjRZl
	Sm64SlyCS24wC1t6R/etIulkjSVfWk3xDnjGMKQpfJmbCu7LG9ke/YplUCTnsjOy78PIuiBkiR0yI
	GgSp3Le2O1AwUHuyQUUagl5/i7wi5o0kvOzLoLb9g4xAf34BSFusT02ZVjW6qDX+2XAs+4VzQXDXM
	OSPbqfY2PAR0cONDe/KuXga/c7Lr56YVM2nDkN11lY4vbxQ6qualsmrE0PCFjp4C0K0lNjwj5ikA8
	3kNof2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2cW-0000000601P-1ZGE
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 13:56:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2cQ-00000005zyD-36D2
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 13:56:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CDAAqZ006059;
	Tue, 12 Mar 2024 13:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2ooT2xNwMhbWwrEQmrl62I+wO7+i9J6o798XT7Cmwm4=; b=VA
	g2x0X5HluJWuP0TRhzjILFY5y9yHFs794tSqKoM/vEmgzi3N7nMYILEb5Q61Fvxf
	t4ve29LSNY9su0f7hTrciBN9Xr521O0ytv3JgSFmf4Dk5YGQpBDSHzhzkhoErURT
	2TWlGVqSNi0CgA6/z6E4/WSPLWO3Ziurz2HWvgiuQ2RVlzvTyyD9IWC7VMJ1pmq1
	WM5DD2ELpzyvyowUXYXqxousssIzIKpmOd3CbEyzuR36yVkuEOV2+uq/IGHG470N
	O8RaexYmFiRHstE9qmwvCnAdnZ3h9Th2X4/l4lQw0QqgMlxvnpGupZkvCKPqYlMA
	ozp3NsakFavRPrFRz4Kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtgc3h236-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 13:56:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CDubDd002785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 13:56:37 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 06:56:35 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v4 11/12] wifi: ath12k: Modify rts threshold mac op for single wiphy
Date: Tue, 12 Mar 2024 19:25:56 +0530
Message-ID: <20240312135557.1778379-12-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312135557.1778379-1-quic_ramess@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GWSpKCDEHbr3U66smMW73ArZcEIqX2J9
X-Proofpoint-GUID: GWSpKCDEHbr3U66smMW73ArZcEIqX2J9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=909 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_065638_845892_537E482A 
X-CRM114-Status: GOOD (  12.13  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Since multiple radios are abstracted under a single wiphy,
apply the rts threshold value to all the vdevs of the radios
combined under single wiphy.

This also implies that vif specific rts threshold support
needs to be added in future from cfg80211/mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0934abc7995f..6123d7db2edc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7292,11 +7292,21 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
-	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret;
+	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret, i;
 
-	ar = ath12k_ah_to_ar(ah, 0);
-
-	ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
+	/* Currently we set the rts threshold value to all the vifs across
+	 * all radios of the single wiphy.
+	 * TODO Once support for vif specific RTS threshold in mac80211 is
+	 * available, ath12k can make use of it.
+	 */
+	for_each_ar(i, ah, ar) {
+		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to set RTS config for all vdevs of pdev %d",
+				    ar->pdev->pdev_id);
+			break;
+		}
+	}
 
 	return ret;
 }
-- 
2.25.1


