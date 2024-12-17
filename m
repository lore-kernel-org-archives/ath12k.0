Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC70AE7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 03:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ohgre86f/RjxmC96Or9GkayA8Fx0HwkxCKWNRjpRebE=; b=ufcDPz7w30fGCsrSmBYI3vJVNm
	clKRJ3/TPUCwAqFz0s74s/fLrEQgo3kb/b7AsdiEq6SJDGTb1jCUulo6ajVU1oId1xpKwsxJGLCm0
	6wPkoCZp7L7x3r+Cj5M1wkb/vNhojyGwH1F9rvbTfzYqAbwZrJeaKK6KM2pQ1+RimztJfMT5Yq5y6
	SrZl7d2HmrRYPKJGP4uz+d+8KlgPKO2bBpCqsMVjUG1SK1d0M00v7LMV4wzD4oQi/gnUT2np+k0S3
	gjmEhnw8dRqQPF5jhggTVMJLqR5T9TY4Mc5jhlzbcNyuhBe9Vm+6OAxbs9wzrLoN2JGP5kuCBYPYX
	ps51LFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNOkI-0000000C67t-33f1
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 03:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNOkG-0000000C66V-0OcG
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 03:59:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNt1CC003554;
	Tue, 17 Dec 2024 03:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ohgre86f/RjxmC96Or9Gka
	yA8Fx0HwkxCKWNRjpRebE=; b=ldKrAtHL2FNxgiOU/XaggnACXHh1cX2DeUMJqr
	arN4UvgWpdGc1bocLPtapqzSZX2kjI6q0lql7s0DnFiYRtEPOUBOmi4DkLNGInHy
	bCe0Rqe9a9PcQvNJgjczd1e+8AIJG2CQtePdQvBL98n6BoDGVoiADKMk4W6cy4R1
	98GuN11P/OPuRl3KBDDkZsDqMXEvVAcVXoRYCSYXOJ52KJf4Xt2kk3vvg2ysbURC
	aUeXQ56U3cX345XRHIbYkeYnoeektwjmaGawWgRMkmeOtXV0QvcbWACLuUrQYfUb
	Zpvvu/vhnb/IlZP3VHxm3miyu2rOak8wnKx9TnQVWF+sF2kQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jx9ygfdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:59:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH3xaA8025401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:59:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 19:59:35 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Fix the static checker warning
Date: Tue, 17 Dec 2024 09:29:16 +0530
Message-ID: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nl7S_1iENJ3Pds_Plnfe1qrO5emdEb8m
X-Proofpoint-ORIG-GUID: nl7S_1iENJ3Pds_Plnfe1qrO5emdEb8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=488
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_195940_252178_371B2767 
X-CRM114-Status: UNSURE (   7.88  )
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

This patch series fix the below Smatch static checker warnings

Warnings:
mac.c:10941 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 10930)
mac.c:11007 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
mac.c:11013 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

v2:
 - Rebased on ToT

Karthikeyan Periyasamy (4):
  wifi: ath12k: Refactor ath12k_hw set helper function argument
  wifi: ath12k: Refactor the ath12k_hw get helper function argument
  wifi: ath12k: Refactor ath12k_get_num_hw() helper function argument
  wifi: ath12k: Fix uninitialized variable access in
    ath12k_mac_allocate() function

 drivers/net/wireless/ath/ath12k/core.c | 16 ++++-----
 drivers/net/wireless/ath/ath12k/core.h | 12 +++----
 drivers/net/wireless/ath/ath12k/mac.c  | 47 +++++++++++++++++---------
 3 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.34.1


