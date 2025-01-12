Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF869E77188
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6SOdswlXQpJeG9M9/zb3bM5YxqdVJmfufizN2uWnJg=; b=qKgkr7vu82At11Bhqn+jRodAVF
	WzxaxdrOkYRm3MoEdF4qY0bpmNY7nuZuFFROyO5Q63DM3E9U1YHwGUwQlap1IokbdYUezB6MOl23N
	6AsiJ4jL9sCKH57ee9p0nF+rb719m7wjN66Lq9iG794pifXCU9nGr+hoJPFwmKL+JLBpySb6VmurR
	LFrK+J44oGas4gPJwih99ydVHktFtSmqqGBZTDKFmJoH/PlHEUoU14ONmUSsxqxJFqpOAtQuoZ1iP
	du3X5PEj3uC3qLId1yXH6aB8SEMt9Eb9g4A9gB43X+EaiEjrwNUyxlOii7nS4+S52zgirvodTE4iY
	PziqfJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWrrn-00000002CXV-2iDP
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 06:54:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWrrl-00000002CX3-13im
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 06:54:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C4qlRP001052;
	Sun, 12 Jan 2025 06:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6SOdswlXQpJeG9M9/zb3bM5YxqdVJmfufizN2uWnJg=; b=LjWbpHfYim1x5c0v
	DKVBJcag2FG07pA4yk0+Yu4nWTtgFNuVy4umXCruLvrYnviLNZWn5eHYQuq7cbOc
	40vE/ue0iqRR2f2ENr58/tXpq7fbL8BJSu0QPkISMOC649vFP6IBKQR9rsLLOQvF
	BgznQ1ydx1T9zUWEbEOQGZYUgWOQVjNlm3+trUigo6FKA5E58JhIvk5jW2LnEtVZ
	f18H8UKg6LGSYL4LDNYXVwe6oqn3zHrZPyZkjFSnhTms333GRbyQwtDbB+y/rKoA
	5FiU1qsjNT/mNvtlJ22xxlGIf9NahNR7MHhQt35Eksa/U7zMwF/sFHZhg3j9kRzw
	n7FbKg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkfhnx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 06:54:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C6sTNm013843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 06:54:29 GMT
Received: from [10.216.44.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 Jan
 2025 22:54:27 -0800
Message-ID: <48d37acb-5374-2181-0b35-8bd8dd632a8b@quicinc.com>
Date: Sun, 12 Jan 2025 12:24:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/4] wifi: ath12k: Fix the static checker warning
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250111090129.2733338-1-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20250111090129.2733338-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F1M0pmrXRkuxaNG6JPbjOkU_gPxwhpD_
X-Proofpoint-ORIG-GUID: F1M0pmrXRkuxaNG6JPbjOkU_gPxwhpD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=536 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501120059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_225433_421778_02638E53 
X-CRM114-Status: UNSURE (   9.72  )
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



On 1/11/2025 2:31 PM, Karthikeyan Periyasamy wrote:
> This patch series fix the below Smatch static checker warnings
> 
> Warnings:
> mac.c:10941 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 11348)
> mac.c:11007 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
> mac.c:11013 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
> 
> v3:
>   wifi: ath12k: Remove ath12k_get_num_hw() helper function
>    - Renamed the patch title
>    - Removed ath12k_get_num_hw() helper function
> v2:
>   - Rebased on ToT
> 
> Karthikeyan Periyasamy (4):
>    wifi: ath12k: Refactor ath12k_hw set helper function argument
>    wifi: ath12k: Refactor the ath12k_hw get helper function argument
>    wifi: ath12k: Remove ath12k_get_num_hw() helper function
>    wifi: ath12k: Fix uninitialized variable access in
>      ath12k_mac_allocate() function
> 
>   drivers/net/wireless/ath/ath12k/core.c | 20 ++++++-----
>   drivers/net/wireless/ath/ath12k/core.h | 13 +++----
>   drivers/net/wireless/ath/ath12k/mac.c  | 47 +++++++++++++++++---------
>   3 files changed, 47 insertions(+), 33 deletions(-)
> 
> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256


Ignore this patch, will send the next version with updated copyrights.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

