Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7531DD1CA28
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 04:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rsLxdD/UWC/xiCKV40bbCTb3qGqfS18MRfNOTvHOGk=; b=egGfEF0AGpT41UOPBG1BRRSRad
	ICwM+VD55U4fyiJHgY1/Oh3Y1HnumNpayV5fItyYZLqTg0xOu5tKaOsLCwa7Pp1AOFI+8uP1sXitk
	vT/WgbPPPFJjiYFWArx+Cmg/UmosxRvU2I6Moooe/jaPGooS6ixYGNO/EXXFVf0YVaByiWGlh37c2
	AuVdwoVuAh38PpdUJIO0yMi9M4R1525nmnvDNolN3lv/MtgmUf/iGkiqP6pAVJyfI7dgWBcu1Uh8g
	CxV5vImJx+xbqJGCCxEJYToTjPvoa0z8whep3BfOVnQolKrGr9xjOK1RIc3NQaYPi7h3nN3N5pnWG
	ZZrm2YpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BaI-0000000FtjA-0btE
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 04:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BaF-0000000FtiI-0Gih
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 04:54:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIl5I027226;
	Tue, 5 Nov 2024 04:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8rsLxdD/UWC/xiCKV40bbC
	Tb3qGqfS18MRfNOTvHOGk=; b=lmmowmq+T3H0TQD2+dGq5a9WHmwcB+lYBJI+EO
	E9b3rSmo82JVSEH7RQ28CDVh32TLqew/jgW9vWMnKfo9fBCBETH560s/jFYRQlNV
	JrFCARamYTkxojamVbMbKPpQVxfCZLqNd78plaoS3C2t1ymG5Jf7TuS7bF9Ty+M3
	wTXAcqpcDSi+awK+j1nRe5iEbvIJUJmKdj+1J0yWUz1h0TwfIquy1QQop0nxe5dt
	g2YswX4T5v1kaMPk5rcT7N9Pq7iliJVl5N//fxzlYDFSgmUPp0PK6gPVj+Xq2aXQ
	yUWYttJd96U5HCtPp/ze7ustEq5b6/688z0uTvGl1B8wujWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8he9k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 04:54:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A54sPnn022037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 04:54:25 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 20:54:23 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit Rate Stats
Date: Tue, 5 Nov 2024 10:24:02 +0530
Message-ID: <20241105045406.2098436-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2RPKphW8k05blDiInOPbWDeVZbC8w1cK
X-Proofpoint-GUID: 2RPKphW8k05blDiInOPbWDeVZbC8w1cK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=811 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_205427_131036_609C3089 
X-CRM114-Status: UNSURE (   7.43  )
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

Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
These stat types give downlink pager stats, counter and TPC stats, SoC
common stats and Transmit PER rate stats, respectively.

v3:
 - Added macros to fix compilation issues.
v2:
 - Removed dependencies. No change in code.

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Downlink Pager Stats
  wifi: ath12k: Support phy counter and TPC stats
  wifi: ath12k: Support SoC Common Stats
  wifi: ath12k: Support Transmit PER Rate Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 627 +++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
 2 files changed, 828 insertions(+), 3 deletions(-)


base-commit: d63fbff74ab1af1573c1dca20cfe1e876f8ffa62
-- 
2.25.1


