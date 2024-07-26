Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3CC3DA70
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCUr7X0MwE63E2L688NnBkdzIxLeoibQbMYsanptxi0=; b=C8l87DOuN55cjY6T5Qq24CcraE
	w8Mpr3IULdf79CEKtSwBlm0WozjEw9FxxQC8b1/ckACdZRSAWWk5uQi/I4yVkL9cQshyirROL64b8
	xp6sK5sHYbeimdLru4qIkEC9ceuiDKE5Z4ks0UA6oXXVP6C3waSSdqlWEdXH5lsMWXcuMvqrrfIRq
	FZDiXsqWjl/kWBGw7lGwCpfqrQe6wr8dHt+Ry+OUIJ2WQ5T6bDmNlRCzMM7voyAtCR5gqt3kSFyv7
	lLL/VlGKiaMJ/tSiG9e3QigjRZ6/GL1trpN7FK6w1BC+YE9hqJswqg2GrxAS0hEpMazFfYCN5KlK7
	hrnep1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8az-00000002UZH-2qAr
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:14:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8aw-00000002UYh-38KO
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:14:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PL1alK002901;
	Fri, 26 Jul 2024 00:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCUr7X0MwE63E2L688NnBkdzIxLeoibQbMYsanptxi0=; b=IUIZcjXRsuXAg3Cn
	Frqbbja5QPm3ZalHsez5fme8Rz6IPOnyrYrNHSaz1smedsb0pRaKOtcXebOxIUDJ
	pzB+PKqwW8uWZhPaUImXjpJ85A5UB9l7ng086OPb138OlvHA2eNlR2XOGUkSIxPi
	o/fy+T9UgeyNrNe5nQclVoG6PmXykNMYVOEAdj6FYky3jXmv1jKheclpVwtiyIUJ
	6ADdwg7x8caeKkWcoDMyBm7A4DoGxPVBV1yr4zehKEC7m6hNS1lz3vmTMY1tdjJm
	wtwvXG9/Wxl/vxVOPjuZ4yAYHdQJv363DERGy/1EOKdIBxmUI8wY66zrfXSyHWst
	BzeRsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5auxk2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:14:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0E0hq011993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:14:00 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:14:00 -0700
Message-ID: <d656238a-15ab-4e9b-b7b2-61d50d29a9a6@quicinc.com>
Date: Thu, 25 Jul 2024 17:14:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-4-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-4-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1FBTT8y4UeueKGiKQtkXQez9TvCcP2k5
X-Proofpoint-GUID: 1FBTT8y4UeueKGiKQtkXQez9TvCcP2k5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=606
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171402_931257_FBBE91DB 
X-CRM114-Status: UNSURE (   7.47  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> Current struct hal_rx_ppdu_end_user_stats in hal_rx.h is not matched
> with hardware descriptor definition.
> 
> So update this structure and related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



