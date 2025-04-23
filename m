Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD511C369CB
	for <ath12k@archiver.kernel.org>; Wed, 23 Apr 2025 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXMIGtezfeZB7Q6mxP/uAinxio0dQh/TLPpfREKxASs=; b=lf5tzJSi1VO+xu2Cwm6RMTI/ZC
	8SNJfgrbppmLatVYWsKdy4UZxfbHly2MofB6tMyNenPV8tToZW3aKLFL4V95kSKlq36p3/HfPRBUv
	mBwvEU2enpLxDNgEFdtsL/PFTljZ4/EeFefuBe6H9dmOAQTuzKA2BI3ICNTdX6KbXMfGAH0wnhXmp
	gIW9vCyCwPe7ZHxp2Weldwbi68efEctk3Dz51ma8ifiycrdiusFT8pMYS361AJ3/nMvFifC+ClwPR
	UzvivhS36yTiGtEONlL6jDaXN3kqvdxXXyKzhZPyvBw4IlYbxMF6Rsam1NkySREPW/6x9QttNS/Vd
	XjhBC0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsG-00000009G7J-2DPg;
	Wed, 23 Apr 2025 05:42:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SsD-00000009G6H-25kE
	for ath12k@lists.infradead.org;
	Wed, 23 Apr 2025 05:42:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9dE022002;
	Wed, 23 Apr 2025 05:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SXMIGtezfeZB7Q6mxP/uAi
	nxio0dQh/TLPpfREKxASs=; b=A+6GC/5ihetrUn+R5WU8GFzfhZ1U8RS8xCfW9h
	p4nnBzxnqwFUGpqqKU6WP/dUJ4T2XB1eVZB9t1AbYwz6sQeG1+e0EohVRsMzAfWk
	TwRVUHnZg8mfnRQtwnl8Ni2azBeMxaAqtFwGC7ZDwgyXzI936pFFChPFI1r1yIFg
	csyH5PsYdRkAU2NbNRZNtxQ/7vvnevK2sJvix1on+CodR7LS/AKejoKu10dfXiJM
	0BnReIoVYOjP4oDTJ36Oi4RzddMpJCUbd0Ta7fkShViNYxevGSevO15IhrHMjD7M
	3/Payn27v0pHjSHbekaJCyOqw5yJQ4n1sxAkEL1STzH7KKCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh10yfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N5gEfe019702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 05:42:14 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 22:42:12 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <jeff.johnson@oss.qualcomm.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Miaoqing
 Pan" <quic_miaoqing@quicinc.com>
Subject: [ath-next 0/2] wifi: ath12k: support usercase-specific firmware overrides
Date: Wed, 23 Apr 2025 13:41:50 +0800
Message-ID: <20250423054152.2471568-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -1CIP2AHVmCWs6DFqiGPolnJddAlbW-o
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68087db7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=5mkN5bLxXfCjVL2fFVgA:9
X-Proofpoint-ORIG-GUID: -1CIP2AHVmCWs6DFqiGPolnJddAlbW-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzNiBTYWx0ZWRfXxtEUxXbrhsw5 4SYqRP0Lkr890USb8MKMkn9rIrxWYBeHyu9dYwMQTv9ynLqdDxWRzsfjqMoCrJEQsi78Pqx6PnX kQ+ryG+1+LTdq7/cxLaXDM3ldZln/3iT6eQomlcFMl+jMfWqjxiapJd7C0LredVEWT/n6MeBNE5
 Og6ooISVHehovb7xXdEhv7gtfMhbDLp6keYk7T2vf5uM9TEuyeH4qMovTSnf11F1w7MKVU7mPld 65Wqepq44u0hwb+Zb9341678TZrBGW4jly5zhqj3E41MTsgvDkaE4FblWHBy0/1RN1gW0Im/JTs t360Fwa1ni7Rfw6/ILingC1dbcrw8IteBYi7hcCi6Qvj/kI99MexcN8SLvf1/oKLinvdn1WVt5q
 wThzZ0PQYFpk48lO1Iy1pBJe3atJn6W8X7HZfkPIdpLpfUxSA3IEBqBmkBjeAT9klfBlo3PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_02,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=908 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_224217_686223_2FB9CB76 
X-CRM114-Status: UNSURE (   6.92  )
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

Introduce 'firmware-name' property to allow end-users and/or integrators to
decide which usecase-specific firmware to run on the WCN7850 platform.

Miaoqing Pan (2):
  dt-bindings: net: wireless: ath12k: describe firmware-name property
  wifi: ath12k: support usercase-specific firmware overrides

 .../bindings/net/wireless/qcom,ath12k.yaml          |  6 ++++++
 drivers/net/wireless/ath/ath12k/core.h              | 13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)


base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
-- 
2.25.1


