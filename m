Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5987D1CA1A
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycUlWrOY/pHCrQ2QjBmK29HvigH7sdArj1aB3IQ58eI=; b=Qtmg/s0TJchtjKqHBRH0gMbgtE
	a7GTewsvurYhO1MrgAgJwvRFyb58qbUXpUl1aBuOM7zb6scpCmj9jVek1/+d73fyj1JE5IWtl/uxb
	f+uybG4nVNwUARZUy+Y/97X9l4ydEYlgzMxdISv/nO0RbYC32slNAtTTk4K+DL4xCzvzlK8/1+Sh3
	1rYO86cYC/2n+Nqw6JWgcXOcRvCiZ23Pi1+u0W1PWRHAFsFxxr3I8bX3Y2pXzeTyi9dlfU3eq1WzX
	i/UZQsDYCqNsbeXFmdrZ0qSioB+i7EAmICP7cvFD9P3iOOE/OR9C1rY5ZCarF0c9gn2ue/tElos4w
	AG6nGTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8B1g-0000000Fr1Y-1o6w
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 04:18:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8B1c-0000000Fr19-416H
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 04:18:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIjTo012122;
	Tue, 5 Nov 2024 04:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ycUlWrOY/pHCrQ2QjBmK29
	HvigH7sdArj1aB3IQ58eI=; b=Cnoj65eV9d+V715Y4OtuBngvXOjyihTXOdIVp+
	yeK3GIjkebiiP7q1mUG7tLCt6oDP6aZ8kjteJdcgl8KBts5IvyFsxScjsBWM7Tcl
	xLKCmpZfx9/TtftmruQPZ7/Lo9wVJpwCyPT520HuYsDf+uY8+OW5O3dpy+dgtsR8
	Bdey5idc0l8hoa+czUdeU1CtAAToMwgkxxJiTTmBWJaLdjaElve4tETdrQ22nSlb
	oEbXjgnNkGEdEJ050WojzZWgv7wSedOrPAtqcW4Y2BokkJU9i1Ny2c5F3ucBLeEV
	vO2OXPQTRanBOf7asIhqG1xE3YpyDjw7w5PKfCN2mMFQGTpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11xa80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 04:18:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A54IbbB014446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 04:18:37 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 20:18:36 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit Rate Stats
Date: Tue, 5 Nov 2024 09:48:18 +0530
Message-ID: <20241105041822.2039214-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e9JDxh3Xby1uYNQvC-QXm57wKkXKSNsE
X-Proofpoint-ORIG-GUID: e9JDxh3Xby1uYNQvC-QXm57wKkXKSNsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=883
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_201841_133962_1988BC72 
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

Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
These stat types give downlink pager stats, counter and TPC stats, SoC
common stats and Transmit PER rate stats, respectively.

-v2:
 - Removed dependencies. No change in code.

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Downlink Pager Stats
  wifi: ath12k: Support phy counter and TPC stats
  wifi: ath12k: Support SoC Common Stats
  wifi: ath12k: Support Transmit PER Rate Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 627 +++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 200 +++++-
 2 files changed, 824 insertions(+), 3 deletions(-)


base-commit: e7e2957f403ba4655199f2ba9920c1a015a7be44
-- 
2.25.1


