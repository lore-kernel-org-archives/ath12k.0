Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896F4C0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKCVBoOMeYxKknxOyIELRERWHgMA6M9zhiI4293+LGA=; b=AGQavBmkTPPOeiMOAlDNSPe0vN
	UEQ2jLuqC1q9HY5/6u2w2odKofTlFtBrTPvopRC+xuA2tkEd1DiqqxuZeR8hDe5aUcZjj9gpar8bB
	TOYR0/rNZq2/Du8GoREn12hZJ7hHBQ8VleHujZR646W9QDcbGZOMi73ctcvM1XdGbuRi8vRLnAcHB
	5AIphLJUB5gImPasQQf/Lu/gxiYiz4STFO5TIF/jAnXpTF88sEipDER1zjqV0PrxcOtI04xF3nn5Q
	MdB7jblDgUxQkdXpjgFhVXJsum08u/1jMazaN8YMGMuvN/RZx4MqRjgfjHJSEJMx6qXO33gAf3eCJ
	c7mZcrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKJ9-00000001sUG-0s6y
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 08:17:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKJ6-00000001sTL-2QHt
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 08:17:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4kQeY017978;
	Mon, 27 Jan 2025 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKCVBoOMeYxKknxOyIELRERWHgMA6M9zhiI4293+LGA=; b=MvcO682uje907YcY
	pRjPDyrvccyZid0KUxsd2hSNFVqCUyK4ORd68bVHcvxXVVBqzz/34i4dSqHDHW2D
	xjO2XE1OVrcY/h24GAVIyH0ysamotqe2IBgy/yntJ/3JAXT1LQR5lZaBaTdP3pwL
	ayGdJ7WkweGcDp4OgNzeQGLLTZLQIdT4Xp5YPnIcjcc+VRlyWwd5QjGQ2OvyPVHY
	7nPu3zm7YVTPCM8o6BMoTMss8mONuuTHAohtpcdN++Y+TZttcXuRY/0P463FujOp
	bQZJyDLjAlQcyFnEWhBOebydQP4rwru7YRuVKkOqjkC/X2DCDrr/TLK5J3p5ns1y
	qpdqvA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3dr0dab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 08:17:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R8HJ5Y004329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 08:17:19 GMT
Received: from [10.253.73.203] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 00:17:17 -0800
Message-ID: <cd0fa235-67a6-445a-aa4e-12df222728e1@quicinc.com>
Date: Mon, 27 Jan 2025 16:17:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Add new features to ACPI
To: <ath12k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20250113074810.29729-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <20250113074810.29729-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rt4x0HwdH8tPulJj_Wo_XK91XvhCgkyP
X-Proofpoint-GUID: Rt4x0HwdH8tPulJj_Wo_XK91XvhCgkyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=968 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_001720_618363_A21D58F1 
X-CRM114-Status: GOOD (  12.68  )
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



On 2025/1/13 15:48, Lingbo Kong wrote:
> By reading ACPI tables, implement a method to obtain the ACPI functions
> Bitmap, enable or disable specific features based on ACPI Bitflags and
> download board data files based on ACPI board data filename extensions.
> 
> v4:
> 1.rebase to 0c5fcd9069dd
> 
> v3:
> 1.change some function name.
> 
> v2:
> 1.support functions for cases where CONFIG_ACPI is disabled
> 
> Lingbo Kong (4):
>    wifi: ath12k: Add support for obtaining the buffer type ACPI function
>      bitmap
>    wifi: ath12k: Add Support for enabling or disabling specific features
>      based on ACPI bitflag
>    wifi: ath12k: Adjust the timing to access ACPI table
>    wifi: ath12k: Add support for reading variant from ACPI to download
>      board data file
> 
>   drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
>   drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
>   drivers/net/wireless/ath/ath12k/core.c |   8 +-
>   drivers/net/wireless/ath/ath12k/core.h |   7 +
>   drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
>   drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
>   6 files changed, 217 insertions(+), 48 deletions(-)
> 
> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256

hi jeff,
do you have any updates on this patchset?🙂

/lingbo

