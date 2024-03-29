Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DB9CD1288
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 01:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZs1IwNSXUf9sxvx7RxwQOKT9KS83SAOymYigY3H/p0=; b=pB8KOFRnCVzi8XpquzEgdQUkYy
	FlEOJiUGKJ+ru6ZqQBzHQTOLOazTEeUGNzm2ObXelKWmZIBGPCGysiIz9ej1kYmndgYKsS3GS9BqO
	IUekgFth55XK384u1jnIaDKWwJ0x0AZoP6fqOn8ScF9UXpiYi5tK4AYf4tWs4GE/cYOfqS7UA3m/2
	95DczBkBOJqfgrl8DsIZiov3ZeCChbDVaiJBPEiS/kFwMin9yTih3pw+UpGF3XLupfO0lJFWmJz5X
	Wjvpu06y8FxEOz7Yewu7Uk9+O9Mf7KiFvjvQI9O37LfB+kxvC5kGNbxdJocBvjDAb8ZlgHBM+4MNG
	TRPypW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq0yh-0000000GNAr-47cN
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 01:24:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq0ye-0000000GNAJ-16tL
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 01:24:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T1DH9N013784;
	Fri, 29 Mar 2024 01:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=tZs1IwN
	SXUf9sxvx7RxwQOKT9KS83SAOymYigY3H/p0=; b=WJSMkoHwoWOmxucwT2oVTaC
	e954vm7uFyh94op4rPHD1M9m6vbdaW/vwmLyh/KAvk8YW122oUvJr2+rVF2bQorW
	koEPMQ91fCMggo/TewYg44rYkCxi0xA5gDT3WY7T4QmXaLpJNePyyO/e4Wj6qCh9
	SpkkeDfRFq9dvWyiGNpKz73GyASf9AzjREIUrAyiVzZPs/e2DQop6ANXShLvwImJ
	tAz79vFyknBeMIlAZeii7jxcLECQ/whc56zEpABYZBZgz6BnEjOSyqFzGpstWZAr
	E9ZhDYoxNvu/PVbphFFh2ASP8SRBldMWJs9qaBv/uComxc6oFWWBWGJkPWojx0Q=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5aeg9djc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:24:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T1ODqp006784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:24:13 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 18:24:12 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: refactor the link capable flag
Date: Fri, 29 Mar 2024 06:53:56 +0530
Message-ID: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sQs-2xfUKbUGASetaq1O7k8tstFT4A-A
X-Proofpoint-GUID: sQs-2xfUKbUGASetaq1O7k8tstFT4A-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_19,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 mlxlogscore=667 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_182416_332991_4F077D59 
X-CRM114-Status: UNSURE (   7.40  )
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

extend the link capable flag to accommodate inter-chip capability.

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


