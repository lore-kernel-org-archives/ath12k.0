Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8681CC369D7
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 01:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXMIGtezfeZB7Q6mxP/uAinxio0dQh/TLPpfREKxASs=; b=lfh/v8cg4ql4o/ort7PF5mclln
	L8MbYP6zzHT/d3KuytL4QAWrWSY3Z5EApOEUGK06QgYJ/NVB5lWQtg/1SlEpg2+x6g8e18yd+dEjE
	PlIM3rOfqYFOfjcXhZ9kPB/lurupB50CZ9sYLmWCL8Uy+BJ2krdMANzOfNszSXElwk1xJkCyHeDm2
	9BxZfJTv8Kk9rRQnsJLHXJ2o5nMtNjZpkApYdtxco2j5HeivG/7ALVDjhX6/jmgO7IJ3u9YdkUhEo
	hx+pOm7Uo/waDZeI0Q8ZETwhFB16n17jlaeoAa0i7vGnHuvIy2XdPl9K4B6iNFX2jwqkVIpApL1oP
	NxQud/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l8y-0000000CUZ5-1D6W;
	Thu, 24 Apr 2025 01:12:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kuD-0000000CSDG-0ER6
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 00:57:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0Fl08007098;
	Thu, 24 Apr 2025 00:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SXMIGtezfeZB7Q6mxP/uAi
	nxio0dQh/TLPpfREKxASs=; b=J6LwYiZ0gUN9QAWNQYgfM6BGG0Z078uCgcVlXn
	dFkP13SlPnpl8xe5f+S+L9LI0R7wi/LvuC7cDrgUAxmT8XKUhro8TecO8+KyzQF4
	l6QqhHh8aMQG+9WN7/PNSJj78VI5Npi8J9UVdJ7wlqmr+oLaXBzsNcld4zTD8Ch+
	g/9O2ZHseKvId0WN7fgBzOoedmRxQdsFEGcLDtm6DALtcMu7vjbOSBUXEIE86xwB
	6MVlLm+DNQCz5572CfPX9Xsoi5F213/wd2DnXujiJv1TDjTF4UJsBfzhcH9owleU
	QxgsFfs2R/+XDhI7BbZLCQKijlH/fYgWZCkhB60US7lrlKXw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03scw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 00:57:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O0vRVo029955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 00:57:28 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 17:57:24 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <jjohnson@kernel.org>, <johannes@sipsolutions.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [RESEND ath-next 0/2] wifi: ath12k: support usercase-specific firmware overrides
Date: Thu, 24 Apr 2025 08:57:01 +0800
Message-ID: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAwMiBTYWx0ZWRfX9sh6bliqQMk0 TWc889h8BITJAqCfkOSvQ+1cOZNOX3CthXWLDdCCA+C6t5Fm0HvWWf2Jk0j1ghpMsk2SE2ZmfVf hDNR7d1uw3lfZLBoeUkJEo0LEOIAqp4YvGseTu8H13r4HlpKlau2mFm5yfaTdoL9/clL84j+6dR
 9qtyUOZvC18Us8McAXpmJ8dypQ2brAGn2PxYEfouI2RgJgYcxue1eg6MXJA3Sd70i+0j+ExAIpp 4RZAV4FEhf3ZlaGZJ1gsZPnBGBYI7hmAn9g6N7B7qNNJ4KaWF/eY5GPzt69ZXqqqp1XO1+SEXie FiRt5CbRFcZd3WhBPl6FzkoJlq5QY2hk0PLyPrc9/8wZp6bYQJy3P549/DF8EpQZex992jAs0Fh
 rvRF0MzhvTHSRQGsRzxlUrGLGpeyeTEvgF487MWIontjCaJwHOBPBdrOvWphcCO/J//yOL3M
X-Proofpoint-GUID: cfGfPVBRxGqab3fQb4zYlqeWOKgCbI0n
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68098c79 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=5mkN5bLxXfCjVL2fFVgA:9
X-Proofpoint-ORIG-GUID: cfGfPVBRxGqab3fQb4zYlqeWOKgCbI0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=981 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_175733_227609_401401E6 
X-CRM114-Status: UNSURE (   6.34  )
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


