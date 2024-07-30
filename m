Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8EDC3DA70
	for <ath12k@archiver.kernel.org>; Tue, 30 Jul 2024 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZFHLLtB2Yc9A6GQTG33ZMmq7qds9zHREQ1yGfwC4g2A=; b=0DuYXdCKdwBHXNjFFPpWkKKjRh
	LeaaZGCrgAmcvb1Sz/Vx44rc83R1GHu3z/FPgwK2RK+2R4H0NvW0rt3b0IzCsmoq7MNmzORbxDlfg
	ul1nz9cvVNuMKi/SsLCTkcU9+SHx993OikUDaU7SDnU8Z+7+SNmlHCuI0cl4cuL0y8GWTglQI3FF1
	DEcbyJKfrBtZbCKnwY9tC4Bj538NEivTWRImUHhQg5LlxcBSwneA9IrW4Z3FRUYSX9KdNFJrFpk58
	0dh+MVb3LEZRYGQNm2zQDZ94qeUTAZTQQNJWK9uShw2i7NV/jDUgAAxHymDlq9LJ0W1kCCRvNxnix
	PZAwVFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqMH-0000000FynM-0fvp
	for ath12k@archiver.kernel.org;
	Tue, 30 Jul 2024 17:09:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqM4-0000000Fyfn-43Fu
	for ath12k@lists.infradead.org;
	Tue, 30 Jul 2024 17:09:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UEZvdc027549;
	Tue, 30 Jul 2024 17:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZFHLLtB2Yc9A6GQTG33ZMm
	q7qds9zHREQ1yGfwC4g2A=; b=gPaT4VpBwYcX3r3/ooRXS+wo/YyUF3gH1jukCB
	pGsiRS5mlJ5y+9I4wmU1w9YoAC8VAo9H8QN/FeYX1RYxXlOP/5dfEZ7qPyApkdso
	LFnulO5w0F0JQ5l+g9GofH3s9iNYId0fGdAZEjFf5zP6zsUnSwTZ0Aj51LHDQ3kV
	T4x4z5f8DwpddDGBTq9qEWN9StQnGMuyGS37f13jSBB4r7Zfu81q2KCULzieE/94
	n8hMOkMBt/sQvidETHcguRw5zeWJ+9SzodS2fnA2/xZcd8ylHpXVUenBkUEO4/pg
	DKUnvB9Z9gqWUytkJKqc5qCiVwlzGbXTMAcGomxPlwwVIjCQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40q232rhat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:09:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UH9fAa011485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:09:41 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 10:09:40 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Add support to allocate MLO global memory region
Date: Tue, 30 Jul 2024 22:39:08 +0530
Message-ID: <20240730170910.3281816-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mza_Js91wqfnvEpiStntdvYcgeRQaaTp
X-Proofpoint-ORIG-GUID: mza_Js91wqfnvEpiStntdvYcgeRQaaTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_13,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=585 clxscore=1011 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_100945_176790_DC010062 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

To enable Multi Link Operation (MLO), QCN9274 firmware requests MLO
global memory (MLO_GLOBAL_MEM_REGION_TYPE). This memory region is
shared across all the firmware (SoC) that are participation in the
MLO.

Hence, add support to allocate and free MLO global memory region.
WCN7850 firmware doesn't request for this memory type, therefore this
change will have no impact on WCN7850 device.

Depends-On: [v9] wifi: ath12k: Introduce device group abstraction
Link: https://lore.kernel.org/linux-wireless/20240628095139.292952-1-quic_hprem@quicinc.com/

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor ath12k_qmi_alloc_target_mem_chunk function
  wifi: ath12k: Add support to allocate MLO global memory region

 drivers/net/wireless/ath/ath12k/core.h |   7 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 190 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/qmi.h  |   1 +
 3 files changed, 155 insertions(+), 43 deletions(-)


base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
prerequisite-patch-id: 9f11ba698b740286374ae7baaa0d40d3b3efa7ba
prerequisite-patch-id: 8bf59833c98c85c6aebb52378ff8b323dc082811
prerequisite-patch-id: f8075a6e30a91260aaa31d0b6b115f9243568d62
prerequisite-patch-id: 68ac72de019bf6c8485daa086daef7aef301bd84
prerequisite-patch-id: 06244ca08d9bed3834dc5315470a19d096d749ee
prerequisite-patch-id: 843ba59a8b315ddac081ad0c8ea9bdabce054373
prerequisite-patch-id: 47b63476fd4d8f34e8bc64c73a04f8a7c294416a
prerequisite-patch-id: 6bfca81d9f8674838d11a2987bff8bf039fca55e
-- 
2.34.1


