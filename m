Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F115FCFC500
	for <ath12k@archiver.kernel.org>; Mon, 14 Oct 2024 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LzW88KYx2rh7K3pnmAzuaDkXKoqhopS82U/nY4MyhM8=; b=1rH7SPAEpJSIfeMwHgSVoBVvt6
	e6ZPWEV3e5tTqk41PCgU4zJwurCOo4Rd2pvjE97KQGbElHQjfY73VGi/RDVyjjK/xCZgXYSepxXoq
	+20ccos3IycuZrvTLsAUmBrnkw+wRoF7yvVgb8cVxwSUTgQTymqZF3uNFOxotWC+kpzGVwYe/e9sL
	lDb5Dgy8OJPfJ5SPPODD8SO0GePMK9+zudeovaX8LV+mGhqJyQSlnaLcaGkrWGFGVjzs308x3fSlS
	i9wb6ascUeiurE/HWUL/9FxmcKUs46g+++g0khqggiHvlFETSp73qtUIv5k44B5cPBj2MywckAcFI
	uS4Wsa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FC6-00000003zvz-2tcx
	for ath12k@archiver.kernel.org;
	Mon, 14 Oct 2024 07:08:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F9w-00000003zY4-02xU
	for ath12k@lists.infradead.org;
	Mon, 14 Oct 2024 07:06:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DLtM5Q021584;
	Mon, 14 Oct 2024 07:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LzW88KYx2rh7K3pnmAzuaD
	kXKoqhopS82U/nY4MyhM8=; b=i/C3jewrO2JFNb+1wMw9y6Y2JBeaIDR5Q0Xix/
	TOZ4RVchMFegI/DXuXHdy4lYdHizWoLGvF+cki14lR4t7gCiEfu6ZiZcajK6Nwjm
	9Jl5S9jhM1kqy7VdswoCyllKr+rzL8IyQGS3RvwoXf4XVNz9oRtaKCMwWrQ8QPAD
	UDfy+1vxgtO7SGwuYwiv961/zOXVyIO8NR6E5dD0XOqyq39E9SDrfkhId4LlY8rO
	7aNxcU9xBkVYdkBsStqemikODgTmjNbE/4StUUMUqPLrwDH6YZGOcbmuwcSaIay4
	1DJMdzwxAT+iNTGGnBEsjnyNSBdCKtDiLusGS9QRo42znz0w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hb33hx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 07:06:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E76QqQ006187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 07:06:26 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 00:06:25 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
Date: Mon, 14 Oct 2024 12:36:08 +0530
Message-ID: <20241014070610.3982173-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4VkFB6R8j3Pa11O5TtzmPOLDkohybj9V
X-Proofpoint-GUID: 4VkFB6R8j3Pa11O5TtzmPOLDkohybj9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=790 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_000628_081526_D11CFFB3 
X-CRM114-Status: UNSURE (   5.95  )
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

Add support to request HTT stats type 49 and 51 from firmware. These
stats give scheduled algorithm stats and BE OFDMA rate of pdev, respectively.

v3:
 - Updated dependencies.
v2:
 - Modified the API print_array_to_buf_v2() to print_array_to_buf_index().
 - Updated dependencies.

Depends-on:
[PATCH v3] wifi: ath12k: Support DMAC Reset Stats
Link: https://lore.kernel.org/ath12k/20241014065259.3968727-1-quic_rdevanat@quicinc.com/

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: Support BE OFDMA Pdev Rate Stats

Sidhanta Sahu (1):
  wifi: ath12k: Support Pdev Scheduled Algorithm Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 162 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  59 +++++++
 2 files changed, 221 insertions(+)


base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
prerequisite-patch-id: d2dd6093ab264e75918406abce52bb9ee8199b7e
-- 
2.25.1


