Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7506C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFXPW2R52kKlqCtJsRjZwKr6ySCVr9G1ryTOM4iDIpM=; b=PGqZOHwunFAkgHLxWggnj3tQMa
	18BCTwuR8JtuESTCzmza2QaMxFadYvy95E4tujlRaBygd0LWXnsq+2QVeeDGExUWqWoA9uBc+MgCE
	MuJ4U0AagUJbZacI0TJeIULA9lxcomkzeNJbTXIpBvFol9r1vRzzjmv0FxhAtmP6NG19MHKetYuz/
	a86WeMvXnhQWVBryUhSOPqQ9gtI8fYUbsfl3oUK9OPmAYhLRvONkXqKuKpVJPXCdlMiTt7v3SYQh1
	caZPoopf53+rzBr5EuLkNkveyID77OpT8uWdrlUAlAtl1Mvtcsp6NyO3G8NGQvG2xxdLoFnX9JeRp
	yRGW6zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1D-0000000DiL4-1tz0
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 07:01:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1A-0000000DiK4-3h33
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 07:01:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JNL9Ok007323;
	Mon, 20 May 2024 07:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=JFXPW2R
	52kKlqCtJsRjZwKr6ySCVr9G1ryTOM4iDIpM=; b=DKxznlQCFeOiEpyjuAb0kc1
	k9EIljAGxj4kWNp1k7u/aaUvrTq2dWJsKSqlU0OKdpi9mo/H5DfSZ8y5ZPNL9Ifw
	Ht06PZgksB3fT2FIqiNquTRK40FF1lIVO51pRo2Cs30IZaNXC7YldSsR5K2jlhWd
	l7PedzryXHGsJNm6NRHtYHGeuoHe5W8hsmxWQuRLCcEG4loEl7wUR9/0X33sUKS9
	lWZgMiDuSGSouhLgPnUCbmpGXGm6yc7ODhJ9C+MDU/bFtdhD/EMokehWXUvOcEPg
	v8yy6V9Z1yTAMXt7xMpcgTP9QFxn8AI4Z7nAl3R4zNRTYTrcI2bIhfcf1/rEm8w=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqajgfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K715eu011964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:05 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 00:01:04 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: fix issues in rx fragmentation path
Date: Mon, 20 May 2024 12:30:42 +0530
Message-ID: <20240520070045.631029-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5LcFHmGC8725C08oGJHM-OR9SQD7YEus
X-Proofpoint-ORIG-GUID: 5LcFHmGC8725C08oGJHM-OR9SQD7YEus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=274 clxscore=1011
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_000108_952943_37ABE93F 
X-CRM114-Status: UNSURE (   6.64  )
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

This series addresses issues in rx fragmentation path.

P Praneesh (3):
  wifi: ath12k: change DMA direction while mapping reinjected packets
  wifi: ath12k: fix invalid memory access while processing fragmented
    packets
  wifi: ath12k: fix firmware crash during reo reinject

 drivers/net/wireless/ath/ath12k/dp_rx.c | 18 ++++++++----------
 drivers/net/wireless/ath/ath12k/hw.c    |  6 +-----
 2 files changed, 9 insertions(+), 15 deletions(-)


base-commit: 0ef7606c6012f05a1f5398e3a1964c35eb9c08a4
-- 
2.25.1


