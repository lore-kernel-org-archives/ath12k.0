Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330CFC36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LczO5m9Vdozc6Omm7oiHJBqtxBUALXTbZ5uRQEtqkhA=; b=lBW5XGonbpEUI6nc2EkjqBglhl
	qJHwHhHNNS0jeMD97AyMiHQ+GAkj/7KSI4D7sobE9fFR+Abz+CkFUosf58sIToQzakCKY7mEvLPXP
	gHZoVCWZdxuGRC3iAv0av9JCdJ7/7aTVsGxHi6LKfJpGssEantN14Fu06K0lPF4Z6UwcN3V+d5edV
	viptHrHrQnLhY9BZ5mh40ZHmXvZYZQidhqC6uNh+3ttbiw0hDQM3GqrGy1h0bmLI9ESxi8sgIRURP
	HOh59U1DQEAGWKJ3ZeIaJ8cdXYWxmYTcoUSAMDN2iiaoKoliJVcXBI+yGQgHcUYptjsRwf5AaGlBd
	p9PeovTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u388J-0000000Clkc-3ovl
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 06:44:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37g0-0000000ChEx-47cI
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:15:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B50xEV018797;
	Fri, 11 Apr 2025 06:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LczO5m9Vdozc6Omm7oiHJB
	qtxBUALXTbZ5uRQEtqkhA=; b=OSwJgHG9ity+a23jHJa4veGbmTA8qUsQSD2fFh
	xcqp1o7T/XB3r6D5CvXBf1WmOGa1C4g+1AThCrQ4HpQ+ylFcM/KhWLB+/g6cw14Y
	wlkBl5mm0FY/qaEQcIXPgCq50Abb9IN6xsRqM+LN3TR7fbIdwIdqQLs8/ajP8oT0
	HUixyvIaS8a0BsCrxH/Gu6O1nuPEwmnKxRp+Sn2DrQBefrLrKC8PMI7nMz9UVnUU
	yFBN+Hyfd11YP3BX5azbYVaXTwP6Hg+0fCYMwHDrfOm7Das26JzrSm8CONzWvt0s
	jIxyPBJ1p3k217kxsWYdPaEUqfTUeqi+VElFyO9Kw0dQb4MQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgsj2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:15:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B6Fgch013932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:15:42 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 23:15:41 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: correctly check RX multicast bit
Date: Fri, 11 Apr 2025 11:45:21 +0530
Message-ID: <20250411061523.859387-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8b38f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=0b8t2eLurJbve7txGXYA:9
X-Proofpoint-ORIG-GUID: KR_vogIUGGK9xbopECu4GkGWaryrVe2j
X-Proofpoint-GUID: KR_vogIUGGK9xbopECu4GkGWaryrVe2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=523 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_231545_146627_CDA7B5AF 
X-CRM114-Status: UNSURE (   8.31  )
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

Currently, the RX multicast broadcast bit is fetched from the MPDU
start descriptor. However, in some scenarios, the value is not
accurate. Therefore, changing the process to fetch the bit from the
MSDU end descriptor for improved reliability.

Sarika Sharma (2):
  wifi: ath12k: using msdu end descriptor to check for rx multicast
    packets
  wifi: ath12k: correctly handle mcast packets for clients

 drivers/net/wireless/ath/ath12k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath12k/hal.c   | 8 ++++----
 drivers/net/wireless/ath/ath12k/peer.c  | 5 ++++-
 drivers/net/wireless/ath/ath12k/peer.h  | 3 ++-
 4 files changed, 15 insertions(+), 6 deletions(-)


base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
-- 
2.34.1


