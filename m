Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F1FEE4993
	for <ath12k@archiver.kernel.org>; Mon, 21 Aug 2023 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OuOUMpAy0HSHwu6yPxzpBMwIomc3RLa6GYHt6dQq0dw=; b=Xa5Imy5X9zzm+t
	SzW+FSpQqo7LvXtryA7jZk9fhOJgUOHk9iMYeiQEOFAdfxXi2TxL4jHeA0tucqA0O9Q/KVjksd819
	BU3C3HkGsKn9DHQ+S26McUXz926rSEJUzTcnvlrkhITVKvMGYphbvIurnb3CP2RDJy+cG6WP77IIk
	FCfFBRtm4s2naxGU9Dqo5tEhJ//EV6pWilQ3/DJJuNJIlrSboWz/I6jLY7T8gdHGFU7N73kupF5do
	XVMXQwMJM5UibalCH3GiZ8VmAXUIvtLrlxd3wj2dFKLzm4nhfhaovoDTkvS3nVY7eLjhzqgzBSs80
	igOGX1leGSR+RcDc7Nfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4ZX-00E304-2j
	for ath12k@archiver.kernel.org;
	Mon, 21 Aug 2023 13:03:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY4ZV-00E2yt-1X
	for ath12k@lists.infradead.org;
	Mon, 21 Aug 2023 13:03:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LCSbvS030682;
	Mon, 21 Aug 2023 13:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=yQe8WMB1y9pSJCfE+451M1ow9CxbYqQiMaULmvgv8bA=;
 b=fJqf4HNXud4PgDe7wrjTc1Ux9fKE9QuXjVr+koqVQ98jnodK9IIY1NgpovM2kIaJZZx0
 LQ3wbb6DLl8p5RlPqjIKFpwFQcMrzGBwiBhaBIVXdavJX+htwiaZYJsR/dsl+m5JvWAB
 xv62ACXseYew3OgQknbxCAVpTlGieJ2f83RSA306ph8KfN3t23/eJj9V81tWXb+Sg0Uq
 Lm0xb44hNu+gQRGgGxlugCESVcapHmA8fqOh+q7RSqYzN1ePXLa95UgCLtOrZfsAGyb6
 Oy3S9EaAiuEcXqVJJ6LpFs2rkVZWV3+yja8qqubpoQWKvDXPX8hC9v2AFb9QPU5GEYOy kw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sm7jdg3wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 13:03:48 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37LCrm3O007264;
	Mon, 21 Aug 2023 13:03:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3skytw4xp7-1;
	Mon, 21 Aug 2023 13:03:47 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37LD3lKD021205;
	Mon, 21 Aug 2023 13:03:47 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 37LD3kkU021201;
	Mon, 21 Aug 2023 13:03:47 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 97049B003A3; Mon, 21 Aug 2023 18:33:45 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: Ignore fragments from uninitialized peer 
Date: Mon, 21 Aug 2023 18:33:41 +0530
Message-Id: <20230821130343.29495-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cav9WVtr-a2A8uC-QwKbMlQuzecw2-XX
X-Proofpoint-ORIG-GUID: Cav9WVtr-a2A8uC-QwKbMlQuzecw2-XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=702
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_060353_526132_A1A9B228 
X-CRM114-Status: GOOD (  12.69  )
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

When max virtual ap interfaces are configured in all the bands
with ACS and hostapd restart is done every 60s,
a crash is observed at random times in dp_rx path.

This patch series handles the following:
    1. Ignore the fragments of the peer which does not have its
       datapath initialized.
    2. Fix the undefined behavior of __fls which was found during
       this crash.

---
  v2: updated commit messages as per review comments from
      Johannes and Jeff
---

Harshitha Prem (2):
  wifi: ath12k: Ignore fragments from uninitialized peer in  dp
  wifi: ath12k: fix undefined behavior with __fls in dp

 drivers/net/wireless/ath/ath12k/dp.c    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/peer.h  |  3 +++
 3 files changed, 14 insertions(+), 1 deletion(-)


base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
