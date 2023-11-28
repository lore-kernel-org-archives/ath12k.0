Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1112C4167B
	for <ath12k@archiver.kernel.org>; Tue, 28 Nov 2023 02:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjI69MLrgdFPIBoK7wxUeKWP+wWX5q/RnCjARZRuKWg=; b=EGIIT9duX7Mwa0
	WPZZO+Qfjr9MZzrR0dHqhTJZYZt4lSu65EvHZTBtq40l4/tqYc8arAEiro7srq9uKGWdvFBk9n9+x
	b9VJowmb85icvG5yxnidOZ8bcWiiMMCRNW6oAziSlCzXZCrN0vNa5HpwYOfUj0iTyVuucLUw+cQv5
	unpR1luFTQ8wDwSAccw2h9wYA1+1qALOitKs5/iyxYd0IPO53gvQSMb9LMCAOahb0EeRKxjTrDYQm
	3u+GefrDRQ2F3GqaTMBzQKqk2m3g5PcjYG88UpWc01+7qBm5ppdnsKTA9hmRaRGXYm/R2W05ohG+s
	nO2Q33VJ7d1B9ec+SgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFb-003vay-0m
	for ath12k@archiver.kernel.org;
	Tue, 28 Nov 2023 02:55:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFY-003vZK-0s
	for ath12k@lists.infradead.org;
	Tue, 28 Nov 2023 02:55:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS2Lthn023213;
	Tue, 28 Nov 2023 02:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5bVWElZbJVzUBT6C363eH2FeGH4ewMadW4Zi62UQpGI=;
 b=CVxW7gz0+o9LRtFUJGNQUDxcPRxRMUrb2kjCq9hq5HVkfrcEe6bBKdWvfX58ApP3As/G
 7sxFNz+4PPwm9mUrNRsPhuK5OlLIA3zoKLd8+X6DCg46zM77pCHZGi/V4WfswpFwWDMu
 mh9/LUwlBA5OeirZ3X2ulowvyv9VdDfT/ybcxdBbV0Ft9fXLffqp4KSvBSCcp1/PRx/R
 ZeTMsYjMXVLGJ1H8FHpN37f6oLlCJkYydz+9k/xnwB56OzkcfkJtnPIU92wL0Kk/dKSe
 DvNEvdz37/yZ76NIrKNTjj61Rati+xNgJU9BCV7n+sHlBLn5BeIbgLONIxEk/cQwvFPN XQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un586r9bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:54:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS2stBg015578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:54:55 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 18:54:54 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 0/3] wifi: ath12k: some improvement to RX throughput
Date: Tue, 28 Nov 2023 10:54:37 +0800
Message-ID: <20231128025440.46988-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qyPMbjw6FpeIyexg8KoKfLLu-DcFwDRW
X-Proofpoint-GUID: qyPMbjw6FpeIyexg8KoKfLLu-DcFwDRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=434 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_185500_446084_3CD896DB 
X-CRM114-Status: GOOD (  12.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Some fields of hal_reo_update_rx_queue are wrongly
defined, fix it in the first patch.

Currently the maximum block ACK window size is 256,
with the second patch, it is extended to BA1024.

The small MAC buffer ring becomes the bottle neck
in RX throughput test, so enlarge its size to get
a better peak result. This is done is the third patch.

With above three changes, more than 6% increase is
seen in RX throughput test.

Baochen Qiang (3):
  wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
  wifi: ath12k: add support for BA1024
  wifi: ath12k: change MAC buffer ring size to 2048

 drivers/net/wireless/ath/ath12k/dp.h       |  3 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c    |  2 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h | 42 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/hal_rx.c   | 11 ++++--
 drivers/net/wireless/ath/ath12k/mac.c      |  2 +-
 5 files changed, 47 insertions(+), 13 deletions(-)


base-commit: 16a212b4f33c4edd9ce9a9e0953b5389216e8ed9
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
