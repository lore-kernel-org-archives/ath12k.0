Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558EFCDB483
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=61NcB8UXLLcHjeRt19NubANDmHKkLSIOpADUr16EPXA=; b=BVRrHwofOQkXEy
	Sk1HffsQSD8D1WL/vM6paUtXXfpSEklRv/CmOi0AsyQYIpFs8wz8+6T10LjQbVpQGaKl9Y5M+QJax
	NXBNLQ00FQera1WqKf9djBY1UnuiF77xCNJg2QLfyHv737IuaWNtgCuD0EchcqZjlj8mETK4kKitR
	Sxbx8FqcUg2JrryrJZISs/VpAnRXm/Y/nfS4kixE4VVQfNH4mFbJLQBvOC3hiCxMSyHQLr5e+W9wU
	BIEjh34FyIPddkbnRahjHYsZsO5LkkdbJfX8lbTYFTyvSOYkSH0WPaMxB8bdAkLPBCHpXGO1TFRfL
	ncIe5nNPfKfihOBZFdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrC9j-002g11-2j
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 07:00:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrC9g-002fzR-0K
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 07:00:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D6KAnN021676;
	Fri, 13 Oct 2023 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=Kpfk2sG8Pemv8Kx5DG6ELViPNTaaUbKwfRGfIPDOjOE=;
 b=HSyrsgQSdhIjbszdxcEr7PQgHogr5cXTwkdo+LK+tqUAnbCJwVdySFPzlLJttivCfKcE
 a+Ri6Q7IMQwVTPOq34sD0OhnwtD+Ny3x5DIYKKq1hOWT3ngwylbiSmpnNBEXOsIZSSVC
 MYZx9zD8/mD4pZK6tZdhP7LBurOsM1r/2HGNvgoynph1Fy6nC4f7VdM+lvSKV8nvwuwx
 jHQyEsljQRwKeGuNuqF2MS3IAypS5qSL7STo/5a+BS7gdidRBfVA1l7KOVoNmT7QiJnF
 sgoxto/2uYf6vDvzsu6qkNpi15FkX0OktMjBmrKVxqVvN8PSScGwVUkgD0B9ezp2+wPz SA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt1k0v6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:00:13 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39D70Ajk020103;
	Fri, 13 Oct 2023 07:00:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3tk0dkvxwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Oct 2023 07:00:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39D6voA0017578;
	Fri, 13 Oct 2023 07:00:10 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 39D70ADS020086;
	Fri, 13 Oct 2023 07:00:10 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 3DF401101FE2; Fri, 13 Oct 2023 12:30:09 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: EHT mesh support
Date: Fri, 13 Oct 2023 12:30:05 +0530
Message-Id: <20231013070007.25597-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QbxiSEmxc-mfhY4GibwOkPIpNoThYl5k
X-Proofpoint-GUID: QbxiSEmxc-mfhY4GibwOkPIpNoThYl5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=316 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_000016_270863_7DD02E90 
X-CRM114-Status: UNSURE (   9.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This patch series adds mesh support for QCN9274 and 
EHT support for mesh mode by registering EHT capabilities.

Ramya Gnanasekar (2):
  wifi: ath12k: register EHT mesh capabilities
  wifi: ath12k: Enable Mesh support for QCN9274

 drivers/net/wireless/ath/ath12k/hw.c  |  6 ++--
 drivers/net/wireless/ath/ath12k/mac.c | 45 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 2 deletions(-)

-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
