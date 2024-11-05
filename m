Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B4D3E77E
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjBRuP+PO8rt0Q+N7DS31Dgoiyc9z8V/Iw9DRLB03rY=; b=Yn3GGQH7H1mJQDNKhO1ZAxRTt3
	L7nNXLSVWROphbmau6AHVT0sZe4x3FnqlD4VHBWLy9SKTYn7dvJPH+sEn+MWc45JuOFxaRGIc6Aje
	ot3V/O4d4wmnRYrGjN6EP0BYKiMpQYDUAjWwlbCCzUipXgOSYwTSNewqsoTugC7vs9Qxy/JRqvpdk
	xYvz0JbLF2VL/eeJpfAo1kJlIz9U+gJEf2v2x8SEGhM5tQ6v7AP9T7/4KSg4ST89xnpRaNqyZm9HQ
	vOVK2U9anTMryjAWUYwypqaP/AEsokkqiydASpa2UANmq/lMA4bKjtMOSt3h6C42yNEd10uQyJq/g
	/Dvo9XLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SMp-000000012nm-00Qt
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 22:49:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SMa-000000012lr-447Q
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 22:49:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KBrwG023076;
	Tue, 5 Nov 2024 22:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjBRuP+PO8rt0Q+N7DS31Dgoiyc9z8V/Iw9DRLB03rY=; b=Fc8ZPhJftiiAbsfc
	R+EUBK5zApynx6VIxCjtNIJ+Kswgpn+eajqQPHipCTgSC36+sRvCs16tb35sMlZ6
	o1DU/S1+KCPNmYflrKe5dMCkzZNfjiBeQTJRHqN34B9vcXpN2zkknpkF/c/epDTq
	5vsNqpcHg9WADoLA7+IXkEk2sNAW2gKnvFcWjvzA/L2lavijFXYjyMyng1wAhDHS
	jKySFrdUVGr/RhMhwsPFiLAtPxLnUt8PGjhlssgDWDBiMjsaAOsSpTN3vc2q27/q
	PSbGd7ey1az9Kp/LMTT/DWo2m54fg1v0wJeAjdLSRcnqR17y8d2SWLcMsXPWaZ9r
	dBXmjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd1fs8ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 22:49:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5MnQHL009967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 22:49:26 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 14:49:26 -0800
Message-ID: <6a275d37-9aac-4bf9-936f-0272cb3737df@quicinc.com>
Date: Tue, 5 Nov 2024 14:49:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] wifi: ath12k: Support Downlink Pager Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241105045406.2098436-1-quic_rdevanat@quicinc.com>
 <20241105045406.2098436-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241105045406.2098436-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zDOtvuSPr0p1bE7krUTLZ8FACFzW_6f6
X-Proofpoint-ORIG-GUID: zDOtvuSPr0p1bE7krUTLZ8FACFzW_6f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_144929_187858_662EBA26 
X-CRM114-Status: UNSURE (   9.75  )
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

On 11/4/2024 8:54 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request downlink pager stats from firmware through HTT
> stats type 36. These stats give paging information like number of pages,
> their timestamp, number of locked and free pages, synchronous and
> asynchronous locked pages.

...

> +static void ath12k_htt_print_dlpager_entry(const struct ath12k_htt_pgs_info *pg_info,
> +					   int idx, char *str_buf)
> +{
> +	u32 ts_lo;
> +	u32 ts_hi;
> +	unsigned long long page_timestamp;
> +	u16 index = 0;
> +
> +	ts_lo = le32_to_cpu(pg_info->ts_lsb);
> +	ts_hi = le32_to_cpu(pg_info->ts_msb);
> +	page_timestamp = ((unsigned long long)ts_hi) << 32 | ts_lo;

use u64 and ath12k_le32hilo_to_u64(pg_info->ts_msb, pg_info->ts_lsb)?

> +
> +	index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
> +			  "Index - %u ; Page Number - %u ; ",
> +			  idx, le32_to_cpu(pg_info->page_num));
> +	index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
> +			  "Num of pages - %u ; Timestamp - %lluus\n",
> +			  le32_to_cpu(pg_info->num_pgs), page_timestamp);
> +}


