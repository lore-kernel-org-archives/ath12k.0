Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0DCD2444F
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WshWiJG5rtOw51cJjHeNCFoUBMH/Kq/clAeS0vgUETw=; b=J7k1QbHjrewLCFpXEKaIoyU0YI
	xRT3oDn0NlgKMAnPvqRnQ5fWsEDp5+6Npa8xRxTS+7X8ttSQESt9WVXqlWubDIZc1q9n/pE4UCqfC
	kQ0nhTmanhwwJRYlZu7LAneeXHYprbabeovY5j9MQaR1DCKk80BUakgpBrDgFRVM+LJbZhe04vLsy
	qGlrZr/3xHi5yY6Szz/FTqBwXKBvHcommMK963vekE4cfV5Fi+0RRBNcbs/2lsjfSN6NlW66F8fTa
	bMl/N986oO0+0DMJpWCq1/F0uo9hUDbQhc3w8q/sbXRRmyEDS+fiEinEZGMdbF9pNy+WPhEt9IAQ6
	uYR+vSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzsM-0000000EHq5-3xA1
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 20:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyEO-0000000Dzkh-0PrM
	for ath12k@bombadil.infradead.org;
	Thu, 10 Oct 2024 18:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:CC:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WshWiJG5rtOw51cJjHeNCFoUBMH/Kq/clAeS0vgUETw=; b=PD7Iq8G4YVWXR4qrMjzGqNFHZR
	Y/4iq9w+QRwtBZ0aAhfg1UTgCKl3wJblxR+g2U3/HdtJCNXziYUbeghDsAaYULDOVlO39ot9I7FEn
	5RVFKqXDeI4oRuN/hPOZva4bhP5ddiA4tv8gLIlSEjfwEi8EVtef4cuEv4rkrSOrUKlDAA0TQas5e
	AEN3TFtQcRG0ly0cmyfMMIRDAJ6020HCG9wbtVx8uOiZLar6itSpxxAEOZKpYjLO0dfTmINekGq+y
	g/UhT5Sel3SBSwtuofetZWmVDPsH0RXR+M2uUMStqx6r7Upz5TfubaEuy+37C2yJLT+SAYwteuJ5r
	rOGEMBvA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyEK-00000005VlG-0Sae
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 18:49:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ADqfwg029138;
	Thu, 10 Oct 2024 18:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WshWiJG5rtOw51cJjHeNCF
	oUBMH/Kq/clAeS0vgUETw=; b=dfurgXEpGJExVOLq6ss+fQ8F021QM1RHO4S1jj
	1NdXkC+Leq0yAitnuv3AXbL5Ls7cCU0XnjFubgcoOpRBEt0OMEviqxrfAZgGjLex
	k7ZwyNhfwFMGn8r207+GdfjfSKQBMX6gJcRYPX58tu/7SG6EClyzzlc7N8vp0Y1j
	GMsY2fmh01QrKQiMCfHmBSwefa5fD+4M5XMzFHZvUsV/eaAEskdNP6tunAz6SmcR
	0jUk1lMVTWAa6qREKVw11rRq+onnS0ZKGuYX0kPYAEcm05bTcKwX4pFYzApWMvim
	9+8FJ/e2O6D+Fu3rd7uA0jFlY0rvmDQ4OSDZUowLfxD7T7Rw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426g6n8sbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:49:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AInaRA013019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:49:36 GMT
Received: from [10.48.240.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 11:49:36 -0700
Message-ID: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
Date: Thu, 10 Oct 2024 11:49:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-firmware@kernel.org>
CC: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>
Subject: [PULL linux-firmware] ath12k firmware 20241009
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ze2yYDbbwnKZon0x3yq1LM6Nsdh0zSsb
X-Proofpoint-GUID: ze2yYDbbwnKZon0x3yq1LM6Nsdh0zSsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=994 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_194944_640395_716B046B 
X-CRM114-Status: GOOD (  10.38  )
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

Hi,

Here's a pull request for ath12k. We have a new ath12k hardware
QCN9274 hw2.0 and an updated board file for WCN7850 hw2.0 which
addresses the issue described at:
https://lore.kernel.org/all/44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu/

The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:

  Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20241009

for you to fetch changes up to 42d754dc98e77e43bcb86def5ea60e009cc49be2:

  ath12k: WCN7850 hw2.0: update board-2.bin (2024-10-09 14:24:59 -0700)

----------------------------------------------------------------
Jeff Johnson (3):
      ath12k: QCN9274 hw2.0: add board-2.bin
      ath12k: QCN9274 hw2.0: add to WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |    4 +
 ath12k/QCN9274/hw2.0/Notice.txt     | 3987 +++++++++++++++++++++++++++++++++++
 ath12k/QCN9274/hw2.0/board-2.bin    |  Bin 0 -> 292160 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin |  Bin 0 -> 15224888 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 1897968 -> 1897968 bytes
 5 files changed, 3991 insertions(+)
 create mode 100644 ath12k/QCN9274/hw2.0/Notice.txt
 create mode 100644 ath12k/QCN9274/hw2.0/board-2.bin
 create mode 100644 ath12k/QCN9274/hw2.0/firmware-2.bin

