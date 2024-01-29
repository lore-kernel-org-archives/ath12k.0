Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF9EC47DA9
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V5oW0dfBics7ms/Y5IONfngAaUN92MIpwh8Y6XfpcCU=; b=TkBvFEExC0AFQtfait+GlEBFh8
	OUO5g0FZNFIkphMP87zEhpRUTHjx1YdkNT+kCRpRYz24N5FnSsaUktRsiTAy5EREQc4lLnsnugwWu
	nEJIL73+z++y6sGU6Zi2qJV4Y1cq2Ryin1J7XTRK7tbyNhhOC+vUrtjbkHzWnboZurzw1kHqs3DPs
	JGrJlU+ALhJnvOBuaw2cnFy1VZ8yXg5wZilWhnDgup95We6TTjd0HZ1G3c78j7asoAAU5YokuMnGZ
	wDsZWzsGGvVGjYtY5r598bksFVJLerCfjBXP2qVvmw2BNG5An+wQza8AaBdgbibx49liMdPIU1BoT
	pBNSrh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOfd-0000000CBSl-0AqY
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 10:15:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOfa-0000000CBRj-30W6
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 10:15:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T7hnkw023511;
	Mon, 29 Jan 2024 10:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=V5oW0df
	Bics7ms/Y5IONfngAaUN92MIpwh8Y6XfpcCU=; b=ST+W8TvAalqJasksb5cuw1w
	qN01fW5OHX2hyEjoPc7hTSRh1cg1iQNhO5SaiDgoSxY2RMCpDf2CLQD0h2kvt9rF
	5q6TDc1JP8T5ZmVy8U1vfvadK3K/yhPHuTSvqojW2Qzi/aDz91fP0j82I1vqD17f
	8xyTxHOuXfT13SkMSpqtbg2hAB3oG0Glxp9ArHca3ydNc1kIP3MGIAOkMKpxD0S6
	SHqtCqe69GA3LbY0W02Y3uDHv1yqBmwmZ1T06pkMvXRbI3x0460bJkfMZZZWplhB
	tVzy/AjPehtd/WmuaOq6/T7eKoRqhefOY6EEorNaKmHsf5af6IgDKFfnZfh9A6g=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvtkmb9xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TAFCOp015690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:12 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 02:15:11 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 00/11] wifi: ath12k: P2P support for WCN7850
Date: Mon, 29 Jan 2024 18:14:42 +0800
Message-ID: <20240129101453.368494-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rnv7L94ms42DWjzKCi9il-_T-YNfpcNM
X-Proofpoint-GUID: Rnv7L94ms42DWjzKCi9il-_T-YNfpcNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_021514_808790_81855750 
X-CRM114-Status: GOOD (  10.72  )
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

Add P2P support for WCN7850.

Kang Yang (11):
  wifi: ath12k: change interface combination for P2P mode
  wifi: ath12k: add P2P IE in beacon template
  wifi: ath12k: implement handling of P2P NoA event
  wifi: ath12k: implement remain on channel for P2P mode
  wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath12k: allow specific mgmt frame tx while vdev is not up
  wifi: ath12k: fix broken structure wmi_vdev_create_cmd
  wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
  wifi: ath12k: move peer delete after vdev stop of station for WCN7850
  wifi: ath12k: designating channel frequency for ROC scan
  wifi: ath12k: advertise P2P dev support for WCN7850

v5: 
    1. move patch #10 to patch #8.
    2. change commit log for patch #6 and patch #8.
    3. simplify assignment logic for patch #7(Jeff).
v4: add a new patch #10 to fix warning(Kalle).
v3: rebase on new ath-tag, use ath12k_ah_to_ar() get ar(Karthikeyan).
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright in patch #1, #2, #4 and #10.

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/core.c   |   1 +
 drivers/net/wireless/ath/ath12k/hw.c     |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 368 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/p2p.c    | 142 +++++++++
 drivers/net/wireless/ath/ath12k/p2p.h    |  23 ++
 drivers/net/wireless/ath/ath12k/wmi.c    | 114 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  50 ++-
 8 files changed, 642 insertions(+), 66 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h


base-commit: 17f4b952f067b1f87d14e6df4c8c216fe7a245d1
-- 
2.34.1


