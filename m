Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6377ECED274
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuJ+Zn+obt41Q+kLXwFOYLUBRKF3HgyO1+7HHSXkRG0=; b=UiED9AfGRg3iMjR0b9xDIdPnoA
	6N1HmXPv7PV8NyFaEJBqNyq/yFbnmICCYDMDuRz07Vg0FjbUCcpeu2Y5b1hfJPOtGNnC0sU7Y8aV7
	bHD5iftB5MEQ2pMpi0ZpDOTsHxT06f0J60bvDtsU3y0IYloAsnl43oNqUFI3k5dYxJu757eLW/o0x
	3oLDJ9Pq6RJyuWq4bVMC+PmVkDTF7Q4lySkR7Ka5uv9CAlVudYAozfXILbw/OB9Zl5V1ZIetFWFG8
	nZ8Feaba28FnM2JDdJyD2gqEC1kM3bSPi+tParmXGGw/AGFJUoSToFJ2M9+yh81iDMhNCRfOkUCYM
	i26tJlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4yM-00000004ry8-0TeU
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 07:49:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lE-00000004of0-2VIv
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 07:36:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984TVXP010058;
	Tue, 8 Oct 2024 07:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fuJ+Zn+obt41Q+kLXwFOYL
	UBRKF3HgyO1+7HHSXkRG0=; b=emEr3G9Y0qNuwFD0v3FvQgcB9I5UKf4wBqdNU1
	6qTgOAS6JlCj7KWXaRvCfnk2noUp92JaTG69UFdor2LVNr+c0rV0aTzuDWjvH7yQ
	rNxNHMODt+vsMt0GoguGr6K/I+6lNErlogsTN0kBw4zbrzhr6tvLX8V4ouKxrzDS
	QHjhe42O7rFjBBgZjRyteC8FcGpeEyD10JMxRK3oKFGM29hTC1DBZqF9tu0lavwK
	YD0OUa/AoSUL0RXmiGEdYFAsmEqhCSBOUKbdF4g3QJhLtFUmn1b/mAi9wguXwL+/
	pEUhU02JbE6DGKy+aM42sl3RanKRORTgGZ8dJ9oThhs9udfg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc0cfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 07:35:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4987ZxOt030366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 07:35:59 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 00:35:57 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 00/11] wifi: ath12k: some fixes and clean up for monitor mode
Date: Tue, 8 Oct 2024 15:35:23 +0800
Message-ID: <20241008073534.1195-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WgcvZE1SxpGaTWR3wgBQJIk__AlE4O0C
X-Proofpoint-ORIG-GUID: WgcvZE1SxpGaTWR3wgBQJIk__AlE4O0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=871 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003600_660369_4C5E3867 
X-CRM114-Status: UNSURE (   6.75  )
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

v2: rebase on tag: ath-202410072115.

Kang Yang (11):
  wifi: ath12k: remove unused variable monitor_present
  wifi: ath12k: optimize storage size for struct ath12k
  wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
  wifi: ath12k: fix struct hal_rx_ppdu_start
  wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
  wifi: ath12k: fix struct hal_rx_mpdu_start
  wifi: ath12k: properly handling the state variables of monitor mode
  wifi: ath12k: delete NSS and TX power setting for monitor vdev
  wifi: ath12k: use tail MSDU to get MSDU information
  wifi: ath12k: fix A-MSDU indication in monitor mode
  wifi: ath12k: delete mon reap timer

 drivers/net/wireless/ath/ath12k/core.c   |   5 ++
 drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
 drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
 drivers/net/wireless/ath/ath12k/dp_mon.c | 108 ++++++++++++-----------
 drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
 drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
 6 files changed, 114 insertions(+), 124 deletions(-)


base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756
-- 
2.34.1


