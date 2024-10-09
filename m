Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F990CF042D
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 00:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ+c4vwFUZN9wVYMkMLmdRgOZf37ZiHqiqhHu5kQKlA=; b=Nkqttipm+VOvBtykvowI1J0PWT
	P63+WKieioV73wI5O3jgGtI2IYF4F/c1AvNMne+4ULP+0rLcUEfEptUeyaaJD6Aux5B9zkJ8oxnL/
	jL559BUbFT40uaztV7Ody4Rywobn9RUjPP7nA6sQRs2czqTnIgxo1K1L4cFqGld+zbpnAr/RLUGhd
	d9Uw9Vw1Jpr4v7lpBp1kTYRWHgQgsRwWpdhKitYNI1yFzNLUPXQ5XvW1tiFKCBXk7WamzhIVccw5O
	kSCtgEaicxesb0SJn8L0f+lglq9M/7fHEkMTHXiO4vuFI0xnWOzZTI+jAphzJ26o6DGpky6N0ndU/
	/Q5G3A2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syKEz-00000007Ud9-3az9
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 00:07:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syKEx-00000007Ucm-1HBB
	for ath12k@bombadil.infradead.org;
	Wed, 09 Oct 2024 00:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UJ+c4vwFUZN9wVYMkMLmdRgOZf37ZiHqiqhHu5kQKlA=; b=bpathw19MBkazU3Wva2wWI6jIl
	o0YRDlKDyE03yhKEDVFT8FNg6QN97s2OilhkwZ9f0wu6ed85QxcDzyotNItYlefbfJ4qQ81At89MA
	oF05DarU1gkWc3r4JAW0N0mydojDcyQOMqcWpC236h7ra0+dGbYpJxlmYLEVtDdjbNyyjenVqDJYe
	Yn1CKaynciAubw9XF4JMHUa4tuVXvRf7xPkGjcHn/gLShDmjxHHBXrJMLKZnn+78s1vbr51I4twxe
	mXFZ1VKY88tH1rv3q6lJCx/Z1bF94EwZbYMo6TAxC++PYXmdHrVRMaoUxZ10mUP9lJu2Bt0mqjgHO
	2vBvc08g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syKEL-00000004lfp-0t3q
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 00:07:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498E7t4v010559;
	Wed, 9 Oct 2024 00:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJ+c4vwFUZN9wVYMkMLmdRgOZf37ZiHqiqhHu5kQKlA=; b=fCy9W5JkBcsMoiO+
	osAijdE7+gkajOQ0Zqy/okdWVhNzdv56oAD/yw6qoxoPCVHAGuDCoFa3sLOtXN4+
	3oCrsqGcLXez9alaHjdmjtzRSdiTqFGzHhkr0CNVqjXJ2+2ZVdlfba6GTiMvh5yl
	fTtHLudC3YcL7xnso9tmYPcdI9xYSR44nz+1qdl9PSSqY9JAET1SLKjQ8og5xmZv
	6ezOfH9pm7T6FmHWmaxd9PLOi1dy931O7yA1KJg7MEwRBZS9GPBffK1R+aqiB44h
	rDJ16e369DUpJ/HP6T5/WVarGHg60Z6Rr2JiJISMIQahsy6h36mQ+zELx/AdcBPT
	nomAJA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7rtxqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 00:06:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49906XP7021932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 00:06:33 GMT
Received: from [10.48.240.101] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 17:06:33 -0700
Message-ID: <11b8e952-25ed-405d-b730-4aa4f1ed7820@quicinc.com>
Date: Tue, 8 Oct 2024 17:06:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath12k: Support AST and Puncture Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241005112234.3379043-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241005112234.3379043-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YtyrqHR1-EDxSzbRexAWtxXiRK1_2BeA
X-Proofpoint-ORIG-GUID: YtyrqHR1-EDxSzbRexAWtxXiRK1_2BeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=950 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_010716_748389_9EA2FD74 
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

On 10/5/2024 4:22 AM, Roopni Devanathan wrote:
> Add support to request HTT stats type 41 and 46 from firmware. These
> stats give Address Search Table(AST) entries stats and pdev puncture
> stats, respectively.
> 
> Depends-on:
> [PATCH v2] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
> Link: https://lore.kernel.org/all/20241004085915.1788951-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
> Link: https://lore.kernel.org/ath12k/20241005101816.3314728-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2] wifi: ath12k: Support Pdev OBSS Stats
> Link: https://lore.kernel.org/ath12k/20241005104206.3327143-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2] wifi: ath12k: Support DMAC Reset Stats
> Link: https://lore.kernel.org/ath12k/20241005105207.3350790-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
> Link: https://lore.kernel.org/ath12k/20241005111506.3361688-1-quic_rdevanat@quicinc.com/
> 
> Dinesh Karthikeyan (1):
>   wifi: ath12k: Support AST Entry Stats
> 
> Rajat Soni (1):
>   wifi: ath12k: Support pdev Puncture Stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 194 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |  56 +++++
>  drivers/net/wireless/ath/ath12k/dp.h          |  12 ++
>  3 files changed, 262 insertions(+)
> 
> 
> base-commit: 8ed36fe71fd60c851540839b105fd1fddc870c61
> prerequisite-patch-id: faf46024c8b5c094e201d392109e7f94dcecdd49
> prerequisite-patch-id: c4662f64bc7be141322b7e37145e52ea4ab4e182
> prerequisite-patch-id: 4d37990775694f110ce3e87096231fe8855f09f5
> prerequisite-patch-id: 5959fd18b497d29cad98d36dcce59a876ffe8ca2
> prerequisite-patch-id: ecac67f6fce1dd4d5089dbc3da840e311f6a7218
> prerequisite-patch-id: 0537ae604d2617e42bef13bfb791aad4d11bf6e1
> prerequisite-patch-id: da5a4e5cc3097994bfcba4b37680c90b0675ccf9
> prerequisite-patch-id: fcd0ce1adcc63e80c95e4636bd4614bd5b732ffa
> prerequisite-patch-id: a6303524834f6e01b2ae1469ee437d586dd5d522

FYI this patchset is not applying cleanly on top of the ath12k-mlo branch, and
hence I won't bring it into pending until after the ath12k-mlo branch has merged.


