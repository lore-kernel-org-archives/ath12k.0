Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D51C54E5D
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J11yLVanw9AsT+IdmoZD3RXT5E5BVJ3Hl9qF1D1DjJ0=; b=fYdHMuhN/4VDCMS1h1fxI3XKwK
	gJvtWstZxMQPxSuAEqxT+GPvPeafpInWvG60lJZwZDUhqljLSFpRBsbH9nxG8eUXtJZzQm8jx64J+
	XY6sUvEHXQ+NRqHE1tasq10keTnNeI5WQaKhvnszawD45eVbpjo5AxVn8y70gOzBiXWjpVZRw38Ft
	f9hBrgp4U+xJK3pQ5Ioi7ZtSTB4XiLlvtt3BPXhsZrf5I/Ebo3ONEUryOYR7/fPaEq4dPAOKdhXDF
	YG+363s/ey/oEy6Zop80teP1Fpy7vMb+Tsd0aWWFojIoPm78FE0WlcVxB6mf8AZB1Ft0kJl1I7Qt7
	nNWQE4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkryn-0000000FepM-2VvS
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 20:47:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkryk-0000000Feoo-1Q1k
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 20:47:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42EKbxi6026706;
	Thu, 14 Mar 2024 20:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=J11yLVa
	nw9AsT+IdmoZD3RXT5E5BVJ3Hl9qF1D1DjJ0=; b=hbN5JayvtXn15u3K+4eqXqi
	AsFuGMkq+egsEc8UHcQvfLXXqaAwmjQAZUPqTAV/Z3JDBwV5izjuBGOUe+FtrOH7
	wy7/sk9BbXgapM/orOxDWmACo5NFJidJDXl5/ZQXaWC5k1s+dSI6sbroAkmnicEU
	BdVNPApD5IvW6hMtUgoeGItCWYROtjZBxHmcfUBC50H2d+kC6IOLpb+XVSpbQ0nA
	2Xp2x7hTkBCueFeeY3+74fSmTPDIs5QUJEX9C4lLu611SX1ob4dN2hfrXaxqHYbo
	mcIEPURLl+zP6aFvidzkQPv5feWnBkld8WuHhyhtTfUuYjjjsMYEzWP0JyhjNiQ=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv0kjs5en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:47:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EKl4pI026934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 20:47:04 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 13:47:03 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
Date: Thu, 14 Mar 2024 13:46:51 -0700
Message-ID: <20240314204651.11075-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FcPtWVSrntODpv_PTbW5ea83fn_FbPiE
X-Proofpoint-ORIG-GUID: FcPtWVSrntODpv_PTbW5ea83fn_FbPiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=818 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403140160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_134706_423623_CA9D3E88 
X-CRM114-Status: GOOD (  11.64  )
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

WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
peer_flags by peer_flags_ext while sending peer data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 9d69a1769926..34de3d16efc0 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1900,7 +1900,7 @@ static void ath12k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 		if (arg->bw_160)
 			cmd->peer_flags |= cpu_to_le32(WMI_PEER_160MHZ);
 		if (arg->bw_320)
-			cmd->peer_flags |= cpu_to_le32(WMI_PEER_EXT_320MHZ);
+			cmd->peer_flags_ext |= cpu_to_le32(WMI_PEER_EXT_320MHZ);
 
 		/* Typically if STBC is enabled for VHT it should be enabled
 		 * for HT as well

base-commit: a2a4cf3541db8066af7e6d4eb6e9e6445f6d9658
-- 
2.39.0


