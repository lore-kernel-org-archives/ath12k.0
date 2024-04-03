Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E48CD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 04:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xbf39CbwInbk5sessCKl3ze+tveoelgISHqsY3taBHw=; b=PywVccFE/BsDcS0GZ0eZ0Lw0tx
	E/s5MSoG4ciegYS18NncddH3LCEzCfNJnpYCE9LjIbgA9KweIZhUjVABxWAcwuNOb/d5O+48NSzeU
	zeOOWVJmsOPpn7nUOeDdWwonyJG4mWsX9pxPuQrXkAR14j2nnzrsVJVX0EUVxI8pw+on5TjpdfSkP
	dK86zvpMqy8YG3Aav3u/xXVkn6qMfs8MndMVUUzt+MhfzZi18Rk2abSoUPPCcRBYrjjQRBFwkA2tv
	vw+2LH4jUMBBLOoT0X+aWSaWLS3YWXnLOaDcGeZnwq0/FO9Dbl0e71oLNo9aKyhTdB2QqBsZfa2ls
	siZZvCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrrV-0000000DtL5-04rm
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 04:04:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrrS-0000000DtKB-0gVg
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 04:04:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4330e8LG021471;
	Wed, 3 Apr 2024 04:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=xbf39Cb
	wInbk5sessCKl3ze+tveoelgISHqsY3taBHw=; b=PNCmpAGHe70cYgKP7xg/jsi
	SPAe9WZpAXXVVTAapMApmKrWEmslMAYQTNHXdy4XJQ68W7m66gxSr5TceQI2sXBN
	ijoV9ScFIn/mIrqUPEdQBog+j9OHVpCmgkUPOA33Tq6splk1jpVZftIsjmC9ic46
	joAvdHMS0F34e30IJWB+WCm6GVA+2Zi92Z5kLwUOFupXWniu82GjU+7xQ4LK/1jj
	RAQXRmrY4Ie2ubVEXFmzmcXeWkTVU+qwbutgeqBF1yUCCALKHh8Sp23nwNwE9ZdJ
	X2ocm+iOXTRyOgM6Mtwk+DKXO41KItjYJUzc9OE7KJw6BteWqdrXf8Eq6AdUoXQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ex7tn3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 04:04:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43344RSs014139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 04:04:27 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 21:04:25 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: refactor the link capable flag
Date: Wed, 3 Apr 2024 09:34:10 +0530
Message-ID: <20240403040412.1488095-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5xZXU95etA9n06Bm94Sl5dO1Lnbb5gpR
X-Proofpoint-ORIG-GUID: 5xZXU95etA9n06Bm94Sl5dO1Lnbb5gpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_03,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=624 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_210430_347294_CF70C6A4 
X-CRM114-Status: UNSURE (   8.33  )
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

extend the link capable flag to accommodate inter-device capability.

Karthikeyan Periyasamy (2):
  wifi: ath12k: extend the link capable flag
  wifi: ath12k: fix link capable flags

 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h | 23 ++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mhi.c  |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 +++-
 4 files changed, 25 insertions(+), 6 deletions(-)


base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.34.1


