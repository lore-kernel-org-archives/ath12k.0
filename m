Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051ABC4707C
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nj3uCmEhK6vA4FWBqxM9U8NjlK52grLTPrAiSnDTfMQ=; b=r8Vfx+Tx4exQG3vOtn/FHlmmtk
	+r2VnIUr4DL3RDG/F+LwWsSLOXHxRjiOZ7C5yiYondcS+r6uPJcw4E+HmDzzj6rq/tCi+j/FMz6Lu
	vpGJFZ0niQZYxpL2y0EH6JsDt48NlaLWhDlH/3h99zdv8BUXfCvkE0Fw83OADrtwFQBVlXi6Kj0gs
	xHKKUDgtDN0cZnUaecRDgWkaSU4Yam8bwbwT8e7y2Nw2CmMhVC5tGXuxcbY2LM8mWIT1ygBBDLA7O
	BMGh6ccKJjlmeVTpCeWhtk/ichshHaFTzaIPLZXKHE8VYTyn5R95Qbb06//yuBEat4Pz6LF4d2d9D
	U8kpMsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORiF-004Jg6-1x
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 00:17:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORiC-004Jdt-1u
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 00:17:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CLTef7023820;
	Sat, 13 Jan 2024 00:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=nj3uCmE
	hK6vA4FWBqxM9U8NjlK52grLTPrAiSnDTfMQ=; b=O6fTP8+lHN5TSuJETZdkphq
	iGjqZhE5aEeBSS/CWlF43IpMzh48xJB4YECX8u5MFW9+92AMMnTI1gncaaqGucWm
	9dI/9KQeEuDBD7TvKMKOcD8xePAN03DsUyD9/1oN2dDbopEAWccmPkTleV6v+QF0
	8zLIeu5KHMVz9YYSmQZkuW/HiR2YkPV1f29jmaW7AD7IWQzxQupsFuo/BCs3+lJi
	SmkdRftBvrmJbioZ25AfzSOcq0jO9DT61mVcvjaqKdfcPSA/uwaqmrcVG6uFxLLZ
	pKJX5G5tQqHPhSyDIdHrw/ceNymTpr0uJIdIwgI/QElv5HAM47svpw+WNKjArGg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vkb74gkau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 00:17:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D0HFpJ009715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 00:17:15 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Jan 2024 16:17:14 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Enable QMI MLO helper function on QCN9274
Date: Sat, 13 Jan 2024 05:46:57 +0530
Message-ID: <20240113001659.1022465-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U-6OyepdyNLulrBYsDmVTZ9KWVGH3VrN
X-Proofpoint-ORIG-GUID: U-6OyepdyNLulrBYsDmVTZ9KWVGH3VrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=506
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401130000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_161720_685455_410D5FA1 
X-CRM114-Status: UNSURE (   8.60  )
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

Currently, the MLO parameter is not enabled in the QMI host capability
message for the QCN9274 platform due to hardware specific constraints.
To address this, refactor the ath12k_host_cap_parse_mlo() function and
introduce a new QMI PHY message to allow for enabling the MLO parameter
in the QMI host capability request message.

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor QMI MLO host capability helper function
  wifi: ath12k: Add QMI PHY capability learn support

 drivers/net/wireless/ath/ath12k/core.c |   1 +
 drivers/net/wireless/ath/ath12k/hw.c   |   9 ++
 drivers/net/wireless/ath/ath12k/hw.h   |   3 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 154 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h  |  17 +++
 5 files changed, 174 insertions(+), 10 deletions(-)


base-commit: dc1702f7b1340dd741bca1005ab52a2c92cc6c84
-- 
2.34.1


