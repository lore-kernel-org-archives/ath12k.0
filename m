Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904DE7718A
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=94C1y99zJDWALNTsLJ8XK8/y9AIsrj3wUbnPi4Rb/iE=; b=1eWQqfcQm0wv8N3D2fmkPydvJR
	VUlI0UNtDHVMOMlMLvIl6sOG9JGRwJQgQOcz01gPu4wN3/LgOwnaVzK1aoveKwJ0jH5gfzwiv4Vwz
	HXMMF0Wi/0n+SzPBWBVOo5EW9lxml+DRp9NvNp65Juu+AGIvLgDFBY6x3YSlaJbZ3lBTSCbh4UHSF
	ctme/khyJwodBDVvlC4357nzQt9vRN4r2f1Et8IYyK3saFbcPiD3T6BhsrrfOb75uDO5bkYqPpjHO
	vEeVfVM5F7WMiH6jyNSEDsCgk7Iaz+lYioxUU9DSCuqFKSKHVCRDCp/WqJ4zkie5hmOXwmkj2ZZcv
	wGEaDR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO47e-00000000P5n-16Bc
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 00:10:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO47a-00000000P4J-3Bmz
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 00:10:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIMrkVu012017;
	Thu, 19 Dec 2024 00:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=94C1y99zJDWALNTsLJ8XK8
	/y9AIsrj3wUbnPi4Rb/iE=; b=P7eFr3mbZk+BHc/ht6K6HCEyqpG41B+5jkxfay
	27p9Sive2mFGUVXJyDzmjgeUQvgtaPexn1vja9XnZ7cnmj+CKwZCJM2LCQ+rDFDt
	lAE3fcB5rcyXMrHugIdFxyhHk6H4wABuWdwqGioiEEq1Au31SgrK2/4wYOCgNMt5
	4YpbG9pBCIgj5tAaY78ck2mDgNp/pBKlm5mKxGzMM823T4u6q5blZyx0P3pnCgqe
	3FQY22vUvhQDwxzB5rzluaVt3jxhc47nx0bLzbBxwMMswu+ri87JigEWqV5MXUyL
	9X3zrj3w+KkPnfFp8T+knRY/ZXhNyZxMrRUszhJyCw1Vf5Bw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m7ka046w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 00:10:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ0AQGq029526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 00:10:26 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 16:10:25 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Refactor monitor Rx handler
Date: Thu, 19 Dec 2024 05:40:03 +0530
Message-ID: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1m3KV6wO-DHEOVPSOH-DdbkQUFQ3wUHq
X-Proofpoint-ORIG-GUID: 1m3KV6wO-DHEOVPSOH-DdbkQUFQ3wUHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=468 bulkscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_161030_823677_27692415 
X-CRM114-Status: UNSURE (   8.25  )
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

Currently, monitor support is not added. However, in the future, the
monitor will be enabled. Therefore, refactor the monitor handler, which
help to add monitor support in the future.

Depends-on:
  [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
  https://lore.kernel.org/all/20241204071238.948885-1-quic_ppranees@quicinc.com/

  [PATCH 0/8] wifi: ath12k: Refactor the monitor status Rx path
  https://lore.kernel.org/all/20241217084511.2981515-1-quic_periyasa@quicinc.com/ 

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor the monitor Rx parser handler argument
  wifi: ath12k: Refactor the monitor Tx/RX handler procedure arguments
  wifi: ath12k: Refactor Rx status TLV parsing procedure argument

 drivers/net/wireless/ath/ath12k/dp_mon.c | 60 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/dp_mon.h |  7 ++-
 2 files changed, 33 insertions(+), 34 deletions(-)


base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
prerequisite-patch-id: 17dd9d2f723e951761f037999a1a7baed16e0d04
prerequisite-patch-id: b2e45c89692e23290870fcdec73106c9a910c054
prerequisite-patch-id: 7f6954e09b67481e7b5ea44ec495d7bf95696502
prerequisite-patch-id: 42680e4dd84e5bf3cef644d08f1a17326915e238
prerequisite-patch-id: 6c936b626c89ef9aefc898004826ca755367c93d
prerequisite-patch-id: 02f5565f0ed6cec4b43e5248395845f415729321
prerequisite-patch-id: 14dcc6fdc6722661a74bd1c9c7e459b4937c83e8
prerequisite-patch-id: 4cce8563f290b716a4d3b18ff15b0fbf7c11a64a
prerequisite-patch-id: 6755d0467c39a99b37e3a1f574f0ef57d6cf6399
-- 
2.34.1


