Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D8CCA470
	for <ath12k@archiver.kernel.org>; Tue,  7 Oct 2025 11:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UpqVdQdBtV4lgdCyObZy0ybDVlE68w9p03MTIPqyOhM=; b=v8xXMem4vOkVGMF9sJYYByuH23
	1oDf2MTWOxbchsfmIxBhqGnEbOyEnx0uX6DCJC730hAQSzOXdkpSabTqGJDDBDHbZAmjSTgG2w91R
	3w77+hE8XH6OpwBjUDSmA6VaRtb3jdub/N3jbgsQ5Xn6RhCGwu/cRYGWKzUFHmD3yi2w2ZIN9tflx
	LSXpZeeGbavzG8WATu+JHNBkAc7gApUwmf6a15SDzCSO1qjNKiQfG699H80jKQQEuJoGZGHEQeiZk
	8Owcn2jg1ByEPr4Bovz+F1PufNThLmf+vCo6Ld1I1vjeVN63tPFn4ObYKEQDVUDCFb88EGY+lPTl+
	gEPxqQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65SZ-00000001pf1-3AQj;
	Tue, 07 Oct 2025 11:02:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65SW-00000001pdv-3Z73
	for ath12k@lists.infradead.org;
	Tue, 07 Oct 2025 11:02:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972wgSJ003256;
	Tue, 7 Oct 2025 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UpqVdQdBtV4lgdCyObZy0y
	bDVlE68w9p03MTIPqyOhM=; b=G7J+M0a7z2GP80b55TueB1mA3q5NoPX0CpaK2m
	r+xT+p+ULuRvWd1X53QAbSkOc11KaqcydjLHzHbIUEwcjaRGWl9w/etrroE9qAp/
	DpfZnb60NFaIsih+x1sUN83Eh5mvfJsYrOMACOHNsiSDfyoLutGj1um+J/oEHHXu
	UJ1YfIQ2qAfV8rgUV1E7zbWJFEckO8U34egG0erZwDHXvTptCVBZYAtzysPPceSM
	cr/sRI9/CGdWkwR7tbGNzWuqZDMfR2D2P3TE546/pEasXufvsx/o3Tg6+7eAFxNu
	4wYqORe5uULSI31uKBvivYd7l+AizvhHNr99UpsIqdCgot4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6xxd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:02:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 597B2IZX030376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Oct 2025 11:02:18 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 7 Oct 2025 04:02:17 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v2 0/2] wifi: ath12k: Modularization of PDEV object for Next Generation Driver
Date: Tue, 7 Oct 2025 16:32:01 +0530
Message-ID: <20251007110203.1541167-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e4f33b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=SmmkiwoZhC3QOVmOaGEA:9
X-Proofpoint-GUID: RzJP9cFWl5yU2tYBjqOZiZSgpYwiB3p3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXyAFHJANI0OOL
 L3GkMEtohpkkr97qUhdneHbs+t8/+ozOf5dGajfHlivdAo069L0mjWzD2I1N2AFEPpqF9Gpx/+c
 WPeJiKvJTJlEHjrdiRFp1T2FWbGYsB8IY5Gv1luveVJH3y/UD7dZX+n+LHr9ew/tqSADRFFoJb1
 FCEhwP6P3P+z9baOAZ2iPO8LGTU9vQglxjOna1Coove1gl3KFHqzD8YUp2w9E6SmEePLJ8kWdaD
 iakIoFb3ZsQJjB7FFyOV2GtTnPoQXRQxQ1IJ4dZ/VIZ1AokXug8C3LzimeQi/6mcr96XOzqbEY7
 o/7eVtlktvyzBz2P7AiKzvyrGEKGnKsgiyGthitrZ84ZvQhqS88wWmDxj2OmQe1rgGx7pgBA6bd
 7iuT03Zn6ZYbbW5kQvNXPplCn+PrKA==
X-Proofpoint-ORIG-GUID: RzJP9cFWl5yU2tYBjqOZiZSgpYwiB3p3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_040221_004220_CE433762 
X-CRM114-Status: GOOD (  11.01  )
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

This patch series continues the effort to modularize data path structures
in ath12k, focusing on improving the organization of DP pdev handling and
preparing for future architecture-specific extensions.

Patch 1 refactors DP pdev handling by consolidating all DP-related fields
of a radio into struct ath12k_pdev_dp structure. An RCU-protected array of
these objects is introduced in ath12k_dp to facilitate dp_pdev lookup from
ath12k_dp.

Patch 2 encapsulates PPDU statistics within dp_pdev, as these stats are
associated with out-of-band data path operations. This reorganization
provides a cleaner structure by grouping both in-band (per-packet) fields
and out-of-band stats under the same ath12k_pdev_dp object.

These changes are part of a broader effort to establish a base framework
for next-generation driver development, allowing the data path to remain
flexible for future extensions.
---
Changes in v2:
    - Made ath12k_pdev_dp_to_ar() a static inline in core.h
---
Ripan Deuri (2):
  wifi: ath12k: Refactor data path pdev struct
  wifi: ath12k: Rearrange PPDU radio stats

 drivers/net/wireless/ath/ath12k/core.h        |  24 +-
 drivers/net/wireless/ath/ath12k/dp.c          |  23 ++
 drivers/net/wireless/ath/ath12k/dp.h          |  41 ++++
 drivers/net/wireless/ath/ath12k/dp_cmn.h      |  18 ++
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  59 +++--
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 183 ++++++++-------
 drivers/net/wireless/ath/ath12k/dp_mon.h      |   9 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  99 ++++----
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  13 +-
 drivers/net/wireless/ath/ath12k/mac.c         |  34 ++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 216 ++++++++++--------
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  66 +++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   2 +-
 13 files changed, 488 insertions(+), 299 deletions(-)


base-commit: af66c7640cf94aa77314cf8d5e95141bdecbc1ee
-- 
2.34.1


