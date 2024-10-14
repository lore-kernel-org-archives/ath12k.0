Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7045DCFC501
	for <ath12k@archiver.kernel.org>; Mon, 14 Oct 2024 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u86Occ3O9UOpS4sfPQ3f0ym4cxorKIi5aElt7drH5oU=; b=OwLYi+XV/AUtEdyWEJEmjQGk6f
	NR9+jlHu276vREWjD6MuwLkz7W2BcdMOSDOUTJCO8m+PnYnpQsMo1I0HCb+EKL9CahfOBFdVVB37U
	lOUjyAdtdb+fT40b7Y8cuBC5wIZVx7ZiOA+uXjVskiI5FQT+c556YDoYSn6PxVKBxSyEgdTTkHcA4
	DwebGw3ONdSfO8Nlx8SS93Vs1lWf2jTLKyuIBgzZiotO3neKFX813c5BticAcWI7ASIV8AAbdCr8Y
	HXhEVXuUNWXEZaQDLZWARc53s31PpSeB6SSzrYx9c6t80KPMAzBpdfHkDHSFozufoLzd8AKQ9nJH+
	flGunxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FL6-000000041fs-0VGk
	for ath12k@archiver.kernel.org;
	Mon, 14 Oct 2024 07:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FKk-000000041YN-2sE1
	for ath12k@lists.infradead.org;
	Mon, 14 Oct 2024 07:17:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMkpdI005635;
	Mon, 14 Oct 2024 07:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u86Occ3O9UOpS4sfPQ3f0y
	m4cxorKIi5aElt7drH5oU=; b=iI6HeI2qxDXUM/sBdwcFLG6QfO7pHrukzqtDIG
	XRwFVS8joRViwZTIE1l+P4PqnVe3u1kETN4Qh8dfJEPKrW+GzTXcf7JbquHHcSyI
	qrjP1d9OnHJrCYVk39k+uKY2zod9xpGFzvqUWyX3O2ywvlgU8/ONlcOvYMO5uFyH
	Kow/AyAZ0++N+c0LmS5rmxpdX4bzKush7kXaaM3qzSU3UnmDFNnk54LCtOQyUqUa
	S4eGz1LuXPAAbo+2lPZF/pPX6Ggh4tC8w+fXhvfyLvcHA3k63iHN6UTild83pL8L
	4PvBrsG1JBbID9lfP4pXwz/wVBYccm1bbkLtOMbJWzBjMQfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6tum1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 07:17:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E7HapA006991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 07:17:36 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 00:17:34 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath12k: Support AST and Puncture Stats
Date: Mon, 14 Oct 2024 12:47:18 +0530
Message-ID: <20241014071720.3991199-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4JJ9CCZyHxVlJLNepLnlGIG3CoL12dWI
X-Proofpoint-ORIG-GUID: 4JJ9CCZyHxVlJLNepLnlGIG3CoL12dWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=712 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_001738_881281_D130C272 
X-CRM114-Status: UNSURE (   6.57  )
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

Add support to request HTT stats type 41 and 46 from firmware. These
stats give Address Search Table(AST) entries stats and pdev puncture
stats, respectively.

Depends-on:
[PATCH v3] wifi: ath12k: Support DMAC Reset Stats
Link: https://lore.kernel.org/ath12k/20241014065259.3968727-1-quic_rdevanat@quicinc.com/

[PATCH v3 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
Link: https://lore.kernel.org/ath12k/20241014070610.3982173-1-quic_rdevanat@quicinc.com/

Rajat Soni (1):
  wifi: ath12k: Support pdev Puncture Stats

Roopni Devanathan (1):
  wifi: ath12k: Support AST Entry Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 194 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  56 +++++
 drivers/net/wireless/ath/ath12k/dp.h          |  12 ++
 3 files changed, 262 insertions(+)


base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
prerequisite-patch-id: d2dd6093ab264e75918406abce52bb9ee8199b7e
prerequisite-patch-id: fcd0ce1adcc63e80c95e4636bd4614bd5b732ffa
prerequisite-patch-id: a6303524834f6e01b2ae1469ee437d586dd5d522
-- 
2.25.1

