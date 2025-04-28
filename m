Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900CDC369D3
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zB7i7FMPZ0SGmLIrM2JNVyuaPKRrTP/VwBZVg6Mdyk=; b=Z0nGMEtzH/Pzinul/T+mYw6MBH
	wmMsE3zKW4lOz+acxVdrEDQre7l7OQp+eTtRpCKuyaSy6/PFZb88rENxXGhXI+jjQz4ozFqLhEGM6
	RG0hf46qctjPcjKnNlm8V92rskEZRpGshJwRNbibLlfmTAemFH8no7qNaXkoIncCNr8PevOUKZt4c
	ySKSgI9eheMx9omjBO30xKMxq6GFAtQ9HlJN5I/+RDHfVXYIhMatfEBIp+P9IbS3jhD8HMMyoaMwJ
	2lTBbaWmUzDlYnvKEEw8oKu+5mX2qXlCbUXCo6R5OiSOMoS7UljhLKY/nKNesFucy4IDGUIKYgcfZ
	TsbSTtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IFc-000000058ck-0sjX;
	Mon, 28 Apr 2025 06:46:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9GwZ-00000004jrV-1CHJ
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 05:22:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S5HNWG001134;
	Mon, 28 Apr 2025 05:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8zB7i7FMPZ0SGmLIrM2JNVyuaPKRrTP/VwBZVg6Mdyk=; b=ckbr42LthmazG3Br
	gr5KEiLreAHwE/GXG2GmyVbdwq8oZAAEVQFCeIA9nOhuUAizt/7PpWQmXlpe4dwG
	nkAkfayHWl6PGlTqPuKxRY8cifhtgAY0ieC14lhHaVSwWEhPctd73qQudAfpEjOx
	DszOrTlbVkF270qk6KKZb1xF8hk4MVxLMW4MotHAZd79Tu7c8h8gUrm6L13H9Y2D
	b+JZiyPsX+Zma1FovOZBPN25OYQms9zPmNkWIjQ8ne62moGx4C84ucPKrCa27g3P
	tnD8rGDHiIcYUxqhvz+FQ3E50VPB+5RpceCuD5Nk8n5W+1tlb31gPcAQNz63e2+K
	zcxNJw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9gndn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:22:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S5MBOF020354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:22:11 GMT
Received: from [10.152.201.120] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 22:22:09 -0700
Message-ID: <07f6395a-8bc1-491d-a90b-3fc50b8478c7@quicinc.com>
Date: Mon, 28 Apr 2025 10:52:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v6 00/11] wifi: cfg80211/mac80211: add
 support to handle per link statistics of multi-link station
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <20250415042030.1246187-1-quic_sarishar@quicinc.com>
 <07c00e98-5280-4563-854f-5c7a457578d0@oss.qualcomm.com>
Content-Language: en-US
From: Sarika Sharma <quic_sarishar@quicinc.com>
In-Reply-To: <07c00e98-5280-4563-854f-5c7a457578d0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=680f1084 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=U7NY451wSba6gpr0_gcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _yeqWyqYQ8mIYGhFWMXwZluNN9-DvFbC
X-Proofpoint-ORIG-GUID: _yeqWyqYQ8mIYGhFWMXwZluNN9-DvFbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0MiBTYWx0ZWRfX8aYMZkd84o04 60gwVZeHKubkHbAQw8c6eQc2zff3WcIIihgtoYUbphjGjgxDtJP/+E32iZ4Oh2LZL3RLeQXvQS4 QCm8JcktkYDs1Piic8agNs3bkJh4jep6aBybtsFB+zab2qeFl1KTcdbkP4Btbd+4eNHLYeGXH03
 EHfaDaP+ptB1TICfyX1efOrYMAD1Ew1561rdnpCbbEzypMNcu6ejzce0wB3e2qYRzfOCAghKOz+ i9hBGgT3tctq1peW30ZHFI2JFdrTSdBuF6tI2k9reGjgmJxtJThqX/CNS6za+2C4mVNcBvSBYGY /sVVxjgU/VxCzMqrwSYyVanerttO3sErnj8+hhVnqXXjrX+Dhm9PcPx4XKtqQ5PlduKVLKHgf+z
 AA2N9VsbQ7TyQqWTWFa73NtLJbEHcAJa4JsLux5A+HtUMfunldAiq0+YJXY04BdPnV3Ln3pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=619 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_222215_449223_CCB5AD4F 
X-CRM114-Status: GOOD (  14.90  )
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

On 4/25/2025 9:16 PM, Jeff Johnson wrote:
> Just a couple of generic points:
> 
> The last ath/ath-next pull request was processed. You need to rebase since
> this series no longer applies cleanly to wireless-next/main.
> 
> When you post v7, please include all parties affected by this series, either
> by using scripts/get_maintainer.pl or by using b4. There are a multitude of
> driver-specific lists and maintainers have not been directly notified of this
> series.
> 
> Since ath/ath-next matches wireless-next/main, and since this series has
> co-dependent changes, I am freezing ath/ath-next. I'll continue to accumulate
> patches in ath/pending.
> 
> My hope is that all of the issues in this series can be resolved, and that
> Johannes will be able to apply the entire series to wireless-next/main. After
> that, I'll fast-forward ath/ath-next to pick up the changes, and then I'll
> start applying the accumulated ath/pending patches.
> 
> But I'll only hold off for a couple of weeks since I want to issue another
> pull request in time for the v6.16 merge window.
> 
> /jeff

Sure Jeff, let me sent new version with rebase and include all parties 
affected by this series.

