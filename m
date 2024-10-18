Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BACD3C553
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dh+GayoOqHCW3PVuKVozmlZrjnUsOIy6Xqsqpjb1/hw=; b=0lk2CC9yC5Dst1AAZc1TSBWqt0
	qQKMAT4VOlgb5lWt7qrOogZ2lkl11L88Zks2mSrX9C3Oq4zIEzeuPuYVdHzR+Ib7z7plYNOONBFst
	j1eKTYRoPqi0uWdIIBjU+1PYFQceMX6XzrvsTOkoo/uzjUf1v+34zNXNtlIA4t+Iw5EyjXKDXnyy1
	2ExovufW29vPR1La856IdleGQPhyJl119UPua4tZC39i+bsVtDxicxniYbkzqMFs/WVALzpJl5eJZ
	m2ud3LtDAuO25gE4nS171oNIH/c6wCdpy+WgL9oFNP8dMUi2cFtUv7okFleotgTlUWs3brq57C6mq
	ZGpqZZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fyH-0000000H2eX-0aIL
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 05:56:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fpC-0000000H0Hw-0kdG
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 05:47:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HJRXgV005787;
	Fri, 18 Oct 2024 05:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dh+GayoOqHCW3PVuKVozml
	ZrjnUsOIy6Xqsqpjb1/hw=; b=RUm34Rq6F6emyBLWGSCH4sJu10C+Jm0eWNhKbp
	l09TyBciSLxyQEqiw6R0vn3Sl1WOPPCVHY7tM9p+KOhzc5EF7A3oMe3K8rOQU8Kx
	LjPPE7lxSwVtRfRGyGJopchkdBcEszgh4xbV784zqpWHInF7IBvsxK4dQQdjUn7S
	LMpJAV0WZWPmbgBO3grT4aVmNDmp22m2ba1QLCyBTljdesWcaOj1SpTWuFwgMLhc
	DM+/l+AWlgrVRbtspsqYTUnO/V1rzbVXZGUF1O8oO23elvJCi0vI60n5NJfsUo/X
	9cp6i+G6nZ8tEiQHdcmi94wnW32sgpr555FL4mqVeeg/D8Rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr16j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I5kgxg002078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:42 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 22:46:40 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 0/8] wifi: ath12k: some fixes and clean up for monitor mode
Date: Fri, 18 Oct 2024 13:46:12 +0800
Message-ID: <20241018054620.2080-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _vhW-nJvzijJdicOwyA5hPh-X5f1GhJR
X-Proofpoint-ORIG-GUID: _vhW-nJvzijJdicOwyA5hPh-X5f1GhJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=962 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_224658_525030_196BC84D 
X-CRM114-Status: UNSURE (   7.36  )
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

This patch set does some fixes and clean up for monitor mode.

v5:
    1. rebase on tag: ath/ath12k-mlo.
    2. remove patches which have conflicts with MLO branch.
v4: rebase on tag: ath/main(ath-202410161539).
v3: rebase on tag: ath/main(ath-202410111606).
v2: rebase on tag: ath-202410072115.

Kang Yang (8):
  wifi: ath12k: remove unused variable monitor_present
  wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
  wifi: ath12k: fix struct hal_rx_ppdu_start
  wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
  wifi: ath12k: fix struct hal_rx_mpdu_start
  wifi: ath12k: delete NSS and TX power setting for monitor vdev
  wifi: ath12k: use tail MSDU to get MSDU information
  wifi: ath12k: fix A-MSDU indication in monitor mode

 drivers/net/wireless/ath/ath12k/core.h        |   9 +-
 .../wireless/ath/ath12k/debugfs_htt_stats.c   |   8 --
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 107 ++++++++++--------
 drivers/net/wireless/ath/ath12k/hal_rx.h      |  53 +++++----
 drivers/net/wireless/ath/ath12k/mac.c         |  14 ---
 5 files changed, 98 insertions(+), 93 deletions(-)


base-commit: f7ffb7753c52eb06feaebb62c5f392e05fa3412b
-- 
2.34.1


