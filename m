Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D79C0219C
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wPsTY3sNXWP3uvk5SMbkRdW3o4gL3SSjfuXs9hCV9i0=; b=x+lDCBdRJkX6ekNu+A2Eh7mPhr
	QNKM1JBIcdtCrNam2ANtXpwG5HOitf3iw1KnPZSv05Wp16FuYQaGUiRmOoP5GaZRO1b+aONdzicI6
	yNNMt6FQljDR0ukZsJe/F2dkR7M0/i1ZQUMVsLbB/C4SpA8lgKiW7qrjp/2cdmcJPvWD9CrpwJDzw
	4olBTgX2V/2ONX0ExDjx42CEpbDSlpxCNxZAc8ca7PH12TONg++MvPoPr47yQDaif1UvxFbppDkSs
	1V2eLBVDBo1O4KuoAZXpjpc6s2zIp6bCg3BEC97HkntV7dV5AZYq7ResN/W6TGchlhjNk7cwof1Cy
	MwllWiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSOv-0000000AXUr-1Jzr
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:44:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSBd-0000000AUsY-1MNh
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:30:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517B2v5f003388;
	Fri, 7 Feb 2025 17:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=wPsTY3sNXWP3uvk5SMbkRdW3o4gL3SSjfuXs9hCV9i0=; b=aF
	6A/fOH1Atixaa/0mS+L2DF3J5tZG0IZwVFCgWMv9Wpa9Ugk3PAZZ6rkiNVJkxBAm
	7wTQRgW9aHYVxriCZ5Ak7O5xsSJVTWWS6iQPJ6jfGr2ZVPAob0ps6tXFSDG07Acn
	4abog4x/RC8iHfsvchRqFEBvvlXvCE8BW6xCrwvH6VjU6KXkMRZ1PBOctbveUvgz
	JP5OCNP/6vulbCLjsIst26trql3qPN85Jk04bU0pjkLF8ygeEEfBBUwkNU5M8Dgx
	A7tdpWZcAPnSkr+jrW/ZVfXplmPlOJIH3w/JYkwPnKLHMhm+ImtUFz/k8sl7Zfb4
	UNzkltL5XzHjOz912G7g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ngy10xnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 17:30:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517HUeKf013474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 17:30:40 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 09:30:38 -0800
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: Enable REO queue lookup table on QCN9274
Date: Fri, 7 Feb 2025 23:00:20 +0530
Message-ID: <20250207173023.3856217-1-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CgXuGK-JfzZBmbXsOUgNkSWR76OL71Qg
X-Proofpoint-GUID: CgXuGK-JfzZBmbXsOUgNkSWR76OL71Qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=553
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093041_366873_E81721FA 
X-CRM114-Status: GOOD (  10.32  )
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

Instead of storing the REO queue address inside peer entries, REO
hardware module prefers them to be stored in SRAM which could be
directly accessed by REO using peer_ID/TID based Lookup table(LUT)
mechanism. This feature is expected to improve stability by reduced
interaction between host and firmware during both MLO and non-MLO
operations.This feature is enabled only for the QCN9274, so it does
not impact the WCN7850.

v2:
- Removed junk version histories in cover letter

Balamurugan S (1):
  wifi: ath12k: Add support to clear qdesc array in REO cache

Nithyanantham Paramasivam (1):
  wifi: ath12k: Enable REO queue lookup table feature on QCN9274

Sriram R (1):
  wifi: ath12k: Fix the enabling of REO queue lookup table feature

 drivers/net/wireless/ath/ath12k/dp.c     | 79 ++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h     |  7 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 11 +++-
 drivers/net/wireless/ath/ath12k/hal.h    | 10 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.c | 19 +++++-
 drivers/net/wireless/ath/ath12k/hw.c     |  6 +-
 drivers/net/wireless/ath/ath12k/hw.h     |  5 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  8 ++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  1 +
 9 files changed, 110 insertions(+), 36 deletions(-)


base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
-- 
2.17.1


