Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BE6C25B75
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 06:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6p7T2aFaz5WsyP8sgTfL4t1EQoKqf/w+ySFzF0roSbU=; b=WqaZs9LrVSFqGHNd3gNp76PMN6
	rsgC88MBRgTKuw0f0uDLblZH7lbW28d9UpNiCydyHh1ySOs/i4/vqJhWh38LPMAORwNs+SA0w8Vnp
	fBkJBduXbovUB9luGy5FMuprv2IXhhxa49/uwwSDGVJQc1KW4x1LVtVe205MR8/1RKeWxWbSzAKHs
	oC++24FHRu6X+sFqyOO8oPk1YZu8fOM8Q2zw+TwzDDyiwHmCtYOBpQQr/m3ulFLz9aWNmiF5yTvre
	zf6cl/SsUp9wl4uhppE14Om9GhDfFoTimFnF3izMsCxEKjACCCm/WyE0CojDmoy/0veLdBGX2dpRY
	aU9Ta9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkM-0000000F7pi-0qL8
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 06:34:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkI-0000000F7oC-1ve9
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 06:34:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8d4W028172;
	Tue, 14 May 2024 06:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=6p7T2aF
	az5WsyP8sgTfL4t1EQoKqf/w+ySFzF0roSbU=; b=OkdtwIEBkv+RF8kA09wpt00
	gCwxsXahqXLGnWlk1owS2xOLsD2qlL1BlB+i9MPzSzi2fIa29PEZ0obRWfvSt458
	EC2rSTTqY5Sd2kuuTANQa0Q3CFo5nNFXOuxBqKS6028NAHd4+s8ne3mGw+8+neiJ
	Q0mNHMqv2dPOZJN/6x1WJD2B4u6nDrPuzS0fsIRwt/Wy4iIJgg1XIYviNY4yQWIu
	/2yrAG9CITXSP3Lx5lmh8akX2FoEmDFVnGxcJibkrQWDTKNXogCLDWVe0D/ViKfz
	B/eFIHAzy07j7MVGcaXBrRZqSTBNMZxE5+q5TYdLTD2tb9IT5NEn1JaGQaVDgAA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1yp5dg74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E6YZ18032275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:35 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 23:34:33 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: Refactor MAX_RADIOS definition
Date: Tue, 14 May 2024 12:04:10 +0530
Message-ID: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DtBVEIhLThSeXy0nksGl7wnv27YR32y0
X-Proofpoint-ORIG-GUID: DtBVEIhLThSeXy0nksGl7wnv27YR32y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_02,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=516 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_233442_632584_BD64EF2E 
X-CRM114-Status: UNSURE (   9.14  )
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

Remove the duplicate definition and use the correct max value.

v2:
 wifi: ath12k: use correct MAX_RADIOS
	- Updated the detail information in the commit message

Karthikeyan Periyasamy (2):
  wifi: ath12k: remove duplicate definition of MAX_RADIOS
  wifi: ath12k: use correct MAX_RADIOS

 drivers/net/wireless/ath/ath12k/core.h | 2 --
 drivers/net/wireless/ath/ath12k/wmi.h  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)


base-commit: 0ef7606c6012f05a1f5398e3a1964c35eb9c08a4
-- 
2.34.1


