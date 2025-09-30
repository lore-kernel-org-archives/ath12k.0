Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70692CCA470
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AnSIY2Q+EBereeOInQaRggZeIM3gds6yuEb94eIbGeI=; b=zYnuHwIzMOXnlsYfsODE2B3NpW
	/NGDUccyT7WDOo9SK1wqhI2UV8zPnKL5HIWxT7Itoan6uQHm/N1RGFaGJVd58L1XF4KuRNhctKTdG
	ZZgh0R6kLJ6GWVESNYF5KFtF0WN8RCb3WYGlBsDHyGv2ExLZoe92fjO1yxEwV1qDQT6WEI+MaHKu4
	ujycN94TZrTRzmEyrgt7oIUXhrufc1srxTKq1tr89SWQQru7Nj7kNoj91/U0JG9YHmEcXbXtSAw2C
	Fiv6ZSxdBfhUoybtdeVPsg9baWLlAg8/vTKwwgVGtexQuq1nRUbrAK9e0YqIvdmbH3bFYYnPKdM8K
	qHu1mXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ewP-00000005xaR-0gCM;
	Tue, 30 Sep 2025 18:19:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ewM-00000005xZq-2Cw9
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 18:19:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCmERv030557;
	Tue, 30 Sep 2025 18:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnSIY2Q+EBereeOInQaRgg
	ZeIM3gds6yuEb94eIbGeI=; b=idqD1EFTW4S0dng9UKGEe8UUaK7ZSmzvS8VG3P
	tvSYdVeYBNK5a9PZWu0QzPgo7SZRWZQRXsIwKUTfR4Ep/Sw1FCUjpUGAbH2wkU+/
	0Tot8a/V2j3RIb9q+KA0MW6dYYw4cFDMCTdvcuPPEC/6FTOnDBOjGu8pFQYGdLa5
	DpCWY4XYUc6e63uXxqdRKfu8egUKjn8rteYtiHJgrqOjo7JrRrZ1CHdkhc0n5aL2
	wMJkU5YH2dnVNVNHHNQQTUrlCVzX9778pGpQmfjhxRBIwfRxcpjc2H0Ln/MCE4gq
	9p1VZeR4JcSyHGRDFC0OYfr2TIfcy+L2kilT8m9NbP3pmVkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdhsfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 18:19:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58UIJ5J4028693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 18:19:05 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 30 Sep 2025 11:19:04 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 0/2] wifi: ath12k: Modularization of PDEV object for Next Generation Driver
Date: Tue, 30 Sep 2025 23:48:46 +0530
Message-ID: <20250930181848.3386271-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DrBmjCTkfFr4PJGsCAbCH2R7gxSAytwU
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc1f19 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=SmmkiwoZhC3QOVmOaGEA:9
X-Proofpoint-ORIG-GUID: DrBmjCTkfFr4PJGsCAbCH2R7gxSAytwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX+cWOkZ5JVigz
 GzM1YWufVQr5ehZA1Q3pAwRRLsew0MMnuX6Et05TxLq5n5UPWCxSKnEtHhEDRIEGZNwZ+2QSMfN
 YNFieZsgE1w7QQ8qFMe8L7ZJhb9ZR1YNakulI3plgKbAS8ZZhEnMxWeAXEjSRc3zkhk9Gp2y+Lz
 ijCWXWEGCzF45BfCCTPS1YlkZ7HHe4vVIqwHM7hTdVTkomHbQM2BKlcPHJ54ad0BNJnCQzhXbfo
 nazgXRXYSyiyChUy9v4bTFPLwmgmZEcNT71tpReAKU9uoS/MBeEcf7SgA0Rcj8K7dXZ5mD5vVm7
 g3135pMQaKdop9NAc4YJidZdwY42/LTm2kotMK+oRvv9IC8/eS8zUNkL/sZPVZ5u8h/6qGn2CEe
 Lg4rPoBlPC+jn3lXuuOzWID+a78y1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_111906_576637_7C29D562 
X-CRM114-Status: GOOD (  11.98  )
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
Ripan Deuri (2):
  wifi: ath12k: Refactor data path pdev struct
  wifi: ath12k: Rearrange PPDU radio stats

 drivers/net/wireless/ath/ath12k/core.h        |  20 --
 drivers/net/wireless/ath/ath12k/dp.c          |  28 +++
 drivers/net/wireless/ath/ath12k/dp.h          |  42 ++++
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
 13 files changed, 490 insertions(+), 299 deletions(-)


base-commit: af66c7640cf94aa77314cf8d5e95141bdecbc1ee
-- 
2.34.1


