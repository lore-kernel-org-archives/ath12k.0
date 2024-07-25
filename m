Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66159C3DA49
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIKLHfdNJXtWsXRTjDlb/LGCciquef0/wZ3XoVwTIeA=; b=mjJjK1/sGMgapSZz04dmA8zhPB
	r6ggH5Q6zUn7LwVjDtoNgZ9nWsfVjOjUZP0Fh1tMVTIGH777EYXNqw7wHfFk7sCro+mqkkMtIuePz
	38pcXSQCbcfCK4Cf8Dz5R6cH4eofrDPwg0qBadBW8G3uD5dd8GF1v5BuBCN2V/GN9c7X2TOgtn3rH
	ijzYLo+CsBylpNR13Y1rMF4RwuChb5JJzQKolqO9jz+8H4vp38vHjUgPvLVI4Lx25nsx5mrenTmfb
	m7tGUdhKjfb9oP1rULasAqYBZTdFzdwkB4fMYu1NuHFR1GYdEZKEQHpgm2jyTX9k8dkifKx7AG7DT
	TMaUnFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9r-00000000q2S-0Ys6
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 12:01:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9c-00000000ptj-0eMx
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 12:01:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P7FoGm003701;
	Thu, 25 Jul 2024 12:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bIKLHfdNJXtWsXRTjDlb/L
	GCciquef0/wZ3XoVwTIeA=; b=fuBHopfwM42Hv7eN5wc7CP2v1mg5zPONO4/1Jq
	Q+SZLjWsK4xKubzJ7+WGUkgvwsY8RAcr89AqU/gmnY9t3LmNkY41hyIHtfwputTS
	PvGl2TABMNGATelf0SkqdKrrG6LybMzb73sNXqW57EhZU7MCq4F/bxStoZPb7axS
	fwFXg9RPCUfV5oKsX3pVJNP8xUyOjPpXWddIPVTta9FDk+I/5wQ5xAxWpKFKSYQM
	T/AqmWDMzqMqRC3eOH6ITO2lRcHH9hIGu9gAy8MDr7Zz2OcUw/cJrKRFnD2l3HdV
	yHZxFDA1VwiL7MbqNCSTU8WksBqCCY770ybSMQ8n+bKOocLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5auw5mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PC10uE019158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:00 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 05:00:58 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 00/11] wifi: ath12k: some fixes and clean up for monitor mode
Date: Thu, 25 Jul 2024 20:00:24 +0800
Message-ID: <20240725120035.493-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Bu0indDI7mztIJs7TPKd-yEqouyqeG8R
X-Proofpoint-GUID: Bu0indDI7mztIJs7TPKd-yEqouyqeG8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=824
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_050104_347587_5C5687EF 
X-CRM114-Status: UNSURE (   8.14  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

This patch set does some fixes and clean up for monitor mode.

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


base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.34.1


