Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDCC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3esMWDbSI53OHA0M56lUt2rtfcjay02Rx7xHJtJeGY=; b=ywcFPmJNREjDFBLYuIz5ml0M2N
	/kR3hELSj9jZFz+q2rHQLzh6RCM6EKtfR42l80JMkb+ZU6Np6bkUbMOVmRqgxsDusSmbQjAdREu/X
	2FzB3z59PnEeBjYjY3jm+pgoWlTnsut1dhWaT9idApoPZv4Feus3mJMWK2fFZ5z90yV3d/byiL/1Y
	JhAMtvVipMYQsh292WgyY40Ie9YQVefLGTxTRTzsGUUssaINrnlpv/a/Po28esB9i6FiMQr3BxxFV
	oVd6rDyZtj0K0jGP9kh2lNNrCpRCZvDxFDGq2UfLH1ElSN3Jcn1xXwaQs/7YCZ6UCJPR2klUT65BL
	zP7CHo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0uq-00Enel-3A
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 08:04:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0uo-00EndY-1m;
	Wed, 17 Jan 2024 08:04:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H7uCRZ005033;
	Wed, 17 Jan 2024 08:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=R3esMWD
	bSI53OHA0M56lUt2rtfcjay02Rx7xHJtJeGY=; b=kxheh5Oj8oI9z1/cnTewvho
	pq3K9YbcB2PazaEwP0sebuM0RfuF2brAe9rmM6N5TB+CTuODLzZ1oGw0KjCoWWvn
	c2eKquvbLlpu3E/48uch4AGCjORLy+E4vVg0FV6k2Lgwvc0i9NwP1AIG0rJ0Ybwh
	0q3Kg54iqWRA1U/rarOO8A3tu6KRvoEuyA3u/1m0Mq36CjPfioSsbrS9E9A8D4jQ
	4YO1XnpKvexfXIuTzmY1DvNobnIZWrpfMgICIGaQBVhBUFHe03R5t/D9ZtxN+dAK
	ptCz9EGqeAVBT6NeNjKtmWZ6e2mNla15HIfAG+NrN806WRqob5rtURL6G4RwdyQ=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp6p3rgv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 08:04:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H84mfm032422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 08:04:48 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 00:04:46 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 0/3] wifi: ath: replace ENOTSUPP with EOPNOTSUPP
Date: Wed, 17 Jan 2024 13:34:28 +0530
Message-ID: <20240117080431.2907471-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SQqjSL6DQe1yZt7t_JFpJwA-evxUBihY
X-Proofpoint-ORIG-GUID: SQqjSL6DQe1yZt7t_JFpJwA-evxUBihY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_04,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=426 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_000450_597542_B2F0D8CC 
X-CRM114-Status: GOOD (  10.08  )
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

ENOTSUPP is not a standard error code, don't use it. Replace with
EOPNOTSUPP instead.

No functional changes, compile tested only.

v3:
 - Added "Acked-by" tag
v2:
 - Modified the copy rights

Karthikeyan Periyasamy (3):
  wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP

 drivers/net/wireless/ath/ath10k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath10k/htt.c     |  3 ++-
 drivers/net/wireless/ath/ath10k/mac.c     |  6 +++---
 drivers/net/wireless/ath/ath10k/pci.c     | 10 +++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  7 ++++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 12 ++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath12k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c     |  8 ++++----
 11 files changed, 36 insertions(+), 34 deletions(-)


base-commit: c1938548bbeed6fcce8fa6e4de9f694994efcc42
-- 
2.34.1


