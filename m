Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A47C04E69
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 04:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1jfFxczB19rCPNA64cmNeGZ8S5SUAh1u2qGnxiR9zbE=; b=25txIUpvyjRYzv
	fTJrN/czJevrFhg689OXFzbh759/leGimgFUfq10NWXd3cb6OkzLWWrDYJ7XDBKDQlpUBMrWQSZPP
	W+OTfGcJEnaut5u1Q5n0QZ0QspvDy/tmRkakKht5dpy0kECnTFh/9GX03tzz4kIM8GOMaV/8oJVNI
	ky6x2mY2YnzGB28ZVeWrxnyKFBAT6bDqZ4f8gcn4doicIL16RdYF1cvOHNIBGN6i+V0mF92nNKHqA
	2ffW0zGnYYT1tUgDmpLGTHpUuQLxuDhodAchxPuMEsDENuIhpLBh7kCROs24sjOjmRfJSRDXmolZI
	bLFqVm+cOa8oNQzDb/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTanX-00410m-0F
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 04:27:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTanU-0040zX-0a
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 04:27:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3794N2gh012381;
	Wed, 9 Aug 2023 04:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=zSMraO1ZfBnQqxcoJNNsj2Xo4IODwLxsQ7cHPDoHClU=;
 b=j763HbTzAXywvd5dD116Kvr0HfSxg9gf9M9hBCb5p6OW1SILlRWszrTSlp8M74ZPuSwl
 N92hK6lokmWj+FvATyPOEqEPysgZC8y7iJKsSE53WQhlRf79uPYk/bbtl42QgiyFN+vt
 18GIsElrfj7VhA+uMSWFBj6FpoROARGEJKN50GZc9VZt+DMlGEk7C+gasCqFSpJHsEvE
 V/Wsd8s6Ixoqekrl1xE+9O4FL29LC2R4KYE4UpqZmxMJN2l/Mh+2FOQwksMLEFswJI3f
 qs9CaXQf+PPLShDn5iIAYscGC+Y7o4flt1S/DOqBFzgpl7Zy6uwRfkH4iY9qpmyCipGU nw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbmrqhtgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 04:27:44 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3794RhU1015378;
	Wed, 9 Aug 2023 04:27:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3sbuj0kkb8-1;
	Wed, 09 Aug 2023 04:27:43 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3794RhBB015372;
	Wed, 9 Aug 2023 04:27:43 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3794RguM015366;
	Wed, 09 Aug 2023 04:27:43 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 3F3ADB00102; Wed,  9 Aug 2023 09:57:41 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH 0/2]  wifi: ath12k: Ignore fragments from uninitialized peer in dp
Date: Wed,  9 Aug 2023 09:57:36 +0530
Message-Id: <20230809042738.13394-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mkFtPjyv7EhiKNdwraI1PrhjVGHeNEgN
X-Proofpoint-ORIG-GUID: mkFtPjyv7EhiKNdwraI1PrhjVGHeNEgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_01,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=657
 impostorscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_212748_227365_8F8E4E60 
X-CRM114-Status: GOOD (  11.89  )
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
