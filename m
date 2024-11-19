Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B78D60D03
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ud7zDprQjyjQRz+mUG/dsetGiz5B0cJLXidw/JuFK0s=; b=Z5Z7rix//1qwD4b2lyMIM/RNIv
	Rf3uR9DFbU28iIe8Ygk2XUfzenXGpSofhPK/WzCRNJOiR+5t+vys9Jbm6VWiB6OkCxmELjtv3NvB6
	pORhehAjQd+Tf2bCUqUkxDoqEdpL1vF1waR9UJtkCN/1N3JVzb7I1kbrvFsc2x/9TRm3CJKJ7QfsL
	IwB4uiWywF9unGRVtz0z71H5ohZjq+7+Dckun6E6fhbTI/Z6m8BaJKyrf+MrQ+l6Hk9RNsg7K1pvF
	PpkeWtbAu1P88acCFpKrO/vjWnie7OH14lA1u1neo8/VQ4JLpdNXoJDZX0iPIrYKeCUPVlOGEFlEB
	ZbeJtwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCB4-0000000AxFL-1rLS
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 00:33:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCB2-0000000AxER-2C3B
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 00:33:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGLp9B011453;
	Tue, 19 Nov 2024 00:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ud7zDprQjyjQRz+mUG/dse
	tGiz5B0cJLXidw/JuFK0s=; b=hgr5jJxn9kOaj/k8ysZKpH7scr7N/2tPTkBMw7
	cQvzSt/T2O2CKGYnhYtvs4uzvccsafZji6HKW6JS/HP1BZgxxFTZ+sfa9QeBuEnF
	R2S/qvJEHF0KIbmEngk1z5wTn7JCZpYyIYUXfxaik8Gmzl9VaeC2LQlWefr56A3u
	J45NXEeIlC43OT/Qsq/wlYPY548Pe7szL10+DCo5bD5GLMJLejgnbk+kLjeldohf
	xEmTyCt2/DDN1szjoDUyi+2lYc01Z+RusXNzhMh7ItVhrDH7gayxztOmxnQeQD3e
	UdUlSQv8xWK7419M3gZBbjh9fiPuu0p3J1nTsafz9DMwjpGg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43091m8xbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ0X4A6012791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 00:33:04 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 16:33:03 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/8] wifi: ath12k: Refactor the monitor status Rx path
Date: Tue, 19 Nov 2024 06:02:40 +0530
Message-ID: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -Ijw_KPwTkTr0Tttl6-NoZ7wQUWFeMNv
X-Proofpoint-GUID: -Ijw_KPwTkTr0Tttl6-NoZ7wQUWFeMNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 mlxlogscore=685 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_163308_692441_A07CCEA6 
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, the monitor status Rx path was inherited from ath11k but has
not been updated for the ath12k 802.11be hardware. Also there is no issue
at present since the monitor status Rx path is not enabled. However, in
the future, the monitor status Rx path will be enabled. Therefore, it is
necessary to update the TLV structures, bitmask definitions, remove the
unused bitmask, change the Tx monitor SRNG ring ID and refactor the
monitor status parse handler.

Karthikeyan Periyasamy (8):
  wifi: ath12k: Add documentation HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG
  wifi: ath12k: Refactor monitor status TLV structure
  wifi: ath12k: cleanup Rx peer statistics structure
  wifi: ath12k: Fix the misspelled of hal TLV tag
    HAL_PHYRX_GENERICHT_SIG
  wifi: ath12k: fix incorrect TID updation in DP monitor status path
  wifi: ath12k: Remove unused HAL Rx mask in DP monitor path
  wifi: ath12k: Change the Tx monitor SRNG ring ID
  wifi: ath12k: Avoid explicit type cast in monitor status parse handler

 drivers/net/wireless/ath/ath12k/core.h     |   4 -
 drivers/net/wireless/ath/ath12k/dp.h       |  14 ++-
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 134 ++++++++-------------
 drivers/net/wireless/ath/ath12k/hal.c      |   2 +-
 drivers/net/wireless/ath/ath12k/hal.h      |   2 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h |   2 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h   |  14 ++-
 7 files changed, 72 insertions(+), 100 deletions(-)

-- 
2.34.1


