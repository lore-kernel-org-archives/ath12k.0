Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED440C07E98
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 02:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ivB+djYuzYF7/8qp3IF9EYDSH/P18HEi9hM2YlKOxsQ=; b=Xg8VNgO1jxIkEoEZ/3WR+5aI5v
	m561+rmyVayqID4F0AnJfWhlHl/YkP7e3VLxrMpOgHCmDSkGUDlY49quRenCi5KdaayhdoMyRbm19
	IMr6niRb6nWTzYaFN3SkDcdiv+xuYcGPDJ4Dj5FQOp2yOKB6ADqA6Kx6qenPSDBfmKgc6RQhezdhE
	+Da61HP2VLjjL3FCJojvYAjo9CgpCgKm34hDZ3mfj51Pc2+8lMkii9B6jd+cX7gZEt239aVWWXHpW
	6Kzwr5X4fX155zWsvM6QLmz+ruPwnFKqtmP4galHlWLibVDA9YE/xY/xJY9Cdh0X4tMTgVR+TIWew
	cwMLYi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wP-006oYC-1v
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 02:04:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wM-006oWy-35
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 02:04:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASNLUF9030201;
	Wed, 29 Nov 2023 02:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ivB+djYuzYF7/8qp3IF9EYDSH/P18HEi9hM2YlKOxsQ=;
 b=gEw6trQxYEwun9ndNOgUSZatr1aJ35hWBRASwWDJhlx4BQqFWpEEzau3jvnr869tUDTG
 mTH812z9rECUgFrZbikhH7aFUk8Bn1aWZfi0M0WIsXjLfUZe79hzItTpRrinXjz9L2XW
 fA5n7LBgnU5FYyjw2qLG+WMvnkwWtdfHYf13mkVJLPYjB27+2icmJhWrE9VtV7njnl6i
 ZxgDPmK/gxYSs4Rmcl7aIbsBhNJKFgru89XQIA+pL13h6g26DC2WQpLgv3+jtiwJurXu
 fgDtrb1Kdx9XrnPJTdy+H29SIl6AIlbFwqdfNhCkOu7ylRfl0QIwiYXPAVb0vO/1pVPm iA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unje19et8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT24X0w013298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:33 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 18:04:32 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 0/3] wifi: ath12k: some improvement to RX throughput
Date: Wed, 29 Nov 2023 10:04:11 +0800
Message-ID: <20231129020414.56425-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PJccPFfyPdlyBun1m9GnB1o4YFtAtjp6
X-Proofpoint-ORIG-GUID: PJccPFfyPdlyBun1m9GnB1o4YFtAtjp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=530 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_180439_053586_B7CFB460 
X-CRM114-Status: GOOD (  13.30  )
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

Some fields of hal_reo_update_rx_queue are wrongly
defined, fix it in the first patch.

Currently the maximum block ACK window size is 256,
with the second patch, it is extended to BA1024.

The small MAC buffer ring becomes the bottle neck
in RX throughput test, so enlarge its size to get
a better peak result. This is done is the third patch.

With above three changes, more than 6% increase is
seen in RX throughput test.

v2:
 1. wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
	no change.
 2. wifi: ath12k: add support for BA1024
	a) s/doen/done
	b) update struct hal_rx_reo_queue_1k
 3. wifi: ath12k: change MAC buffer ring size to 2048
	no change.

Baochen Qiang (3):
  wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
  wifi: ath12k: add support for BA1024
  wifi: ath12k: change MAC buffer ring size to 2048

 drivers/net/wireless/ath/ath12k/dp.h       |  3 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c    |  2 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h | 20 +++++++++++++-------
 drivers/net/wireless/ath/ath12k/hal_rx.c   | 11 ++++++++---
 drivers/net/wireless/ath/ath12k/mac.c      |  2 +-
 5 files changed, 25 insertions(+), 13 deletions(-)


base-commit: 16a212b4f33c4edd9ce9a9e0953b5389216e8ed9
-- 
2.25.1


