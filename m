Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80706C2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 04:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17qCQygTB5XebJ81M8MgHadcSDIwRymvolV5Eux9huY=; b=XhpjDpMJjWArIzX0sjKcQ9OO7H
	DRxYM6f8r/KraerMHFNvVjjKBXase3+DeIgJ26RrE4AYocHlpBGuISX31PHBl6xgbbaukAfg6tr1J
	6HCcAydjsNG6Ex6E3YEUzVETxEqv8z64gHTj8cwh6VaZt1KxF0+S5HinBqdT0FWZuNtx82WCEaIia
	x6ObpGP/gIMpwYa4hF4Av1rd9dMnOWl8oZQ+HWTU4kqCl4hAtzVTbelM9kVeAsslC3SJu2ecvyZyA
	0k6Bp3QuTBcqPF9zg8VcSZ1xrIX/e+pV6/jQ7LRAQIE/6FUFPyyonR3MroNh5sCss7KeTqjoNw4rv
	HU5TOVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxhm-00000001YBW-0mhf
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 04:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxhj-00000001YAZ-0xR0
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 04:22:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OK6fFo018298;
	Tue, 25 Jun 2024 04:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=17qCQygTB5XebJ81M8MgHa
	dcSDIwRymvolV5Eux9huY=; b=e+pIfDnJTJ0qcxr23PpZ87bbhFxmUQnUNOnoau
	prEHjTrv8p+K7prbWaFxDOC1CRycEzBOw7Q24uK8h61llTORUrh8U0fTvDus6y4C
	9VkFupGbn3PqbzwWYGOMBLnGEvulU2XGFTjq9Kgq+3m/jIJjPRSl9/UjDrZA+GMA
	GrqSy47Q28fKV48bNlLRlbb1ikB+d+PU+WSHITwTiW697y62MHfsajjVS4sgkdEe
	lfVqjzeOr4V/iLebiw0E2esXg1PPpsm/G9if+leCq651U+cLg/Wzp151XxhZ/bgp
	60ScgzcxLmsrzsyvjTqIN2g8y65e37YlwToFbJqg+3qe8kYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6nb9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:22:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P4MlZn002288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:22:47 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 21:22:45 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Support transmit scheduler, pdev error and TQM htt_stats
Date: Tue, 25 Jun 2024 09:52:14 +0530
Message-ID: <20240625042217.1303332-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: erX51HGCxNyhJ3sKKKhEIj7UNouNJz-N
X-Proofpoint-ORIG-GUID: erX51HGCxNyhJ3sKKKhEIj7UNouNJz-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_01,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=472 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_212251_418497_ABFB081C 
X-CRM114-Status: UNSURE (   7.06  )
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

Add support to request HTT stats type 4, 5 and 6 from firmware. These
stats give transmit scheduler information, pdev error information and
TQM information respectively.

Depends-on: [PATCH v6 0/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Link: https://lore.kernel.org/linux-wireless/20240624043845.3502520-4-quic_rgnanase@quicinc.com/T/

Dinesh Karthikeyan (3):
  wifi: ath12k: Support Transmit Scheduler stats
  wifi: ath12k: Support pdev error stats
  wifi: ath12k: Support TQM stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 784 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 267 ++++++
 2 files changed, 1051 insertions(+)


base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
prerequisite-patch-id: d01c8ec08d1c98d95876ca5eaca12993138536f3
prerequisite-patch-id: ca00fe5681f8f3a5e485700f3e8d32daa91f529b
prerequisite-patch-id: aa1475d182cf5cd996093ecf7645695decf9cf8b
prerequisite-patch-id: 7a864608c715dec904ed804a8df58e4674e30f21
prerequisite-patch-id: e60fe6bc8f57eba3d1461c74f659602912d820d5
-- 
2.34.1


