Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E719D690F9
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amhivvQN9SZICnCYujA8p9Yz6VVkamJGmYrZtVY+8rw=; b=iQo2FEdI18kNpdl0pryw/EaNqL
	YU176gJfUN4QkxOPwNHvhYw+QXgQ/DaG0617rwJkPwjEWD8+rBvqE6lLefkHbT0ZnQdB6stoNRzTo
	XL3ZXhuG+Xq3dt1/0CBBpzvgMjfR4Z8P2nx7Io8sxhM5fxQ+VOdWtO/bvU3C+aNJVr6NurcR4RKA8
	gkJl5/b6ZpV5yRmhiVp9UFfyNG67EHoVTPtta2Czp6uMziRf9W7YhcF3zmINVoxPkynWTdglQ6jRr
	AtBiDWZrG2pDLuCEuWr8ccJNoVo1Jdq0rDLXQ21LqTotPcCpvyafeHJjdGrwSdYOmS6qSK+WyJg4N
	V1kEH+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcQ2-0000000FKj6-0t9i
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 11:10:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcPT-0000000FKfr-3bJR
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 11:10:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8gxD8020148;
	Thu, 28 Nov 2024 11:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=amhivvQN9SZICnCYujA8p9
	Yz6VVkamJGmYrZtVY+8rw=; b=m1FT76Eg/wVtAV9B6xt3OWMh0CHfLTGp7x7ofk
	iXx2gp0FEFjAGFnQs7xAD5eymZHNpSuNaCmpA1oBWoYN3TS32MQ0y0lLmf0t6c72
	tUu4B01VfjlgCnTHxpDY84z4ZSazQrJ97D7hYO4kIH2H0wgvODSPMbEbsEIlvGbZ
	cMP5flZAS9wV7SyYKsvDYfWlAgm5j137id5IrAzIpwtEmO0Wowha8hOW8htBPFpu
	AigXEeayJ+BKaSQiQ4k3En/7glLb1Pu+200YCfxbK85NDvSH1Lwi1zOG/YmbkGz1
	j7IRb5jRId0aojyGe61qvhgj6lJGEa/PXSR/+s12eLi+sA0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y02cef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:10:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ASBA8rh012991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 11:10:08 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 03:10:06 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
Date: Thu, 28 Nov 2024 16:39:47 +0530
Message-ID: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -cUttUm1PFF9HHVwxhKu5X9QCZzgOqwM
X-Proofpoint-GUID: -cUttUm1PFF9HHVwxhKu5X9QCZzgOqwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=688 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_031012_084441_843A93DB 
X-CRM114-Status: UNSURE (   6.46  )
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

Add support to request HTT stats type 31 and 32 from firmware,
respectively. These stat types give transmit rate buffer stats and
transmit buffer OFDMA stats, respectively.

Pradeep Kumar Chitrapu (2):
  wifi: ath12k: Support Transmit Rate Buffer Stats
  wifi: ath12k: Support Transmit Buffer OFDMA Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 345 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  99 +++++
 2 files changed, 444 insertions(+)


base-commit: 175616a7658cd5d53389d1f9c1ce22debd4595a5
-- 
2.25.1


