Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615A6E77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M05VNobMlqihLFY1hRX7+uDTC8lilZ5KVPx5Dp4B10=; b=fRBvKWJcMoxzzFL52I3q7oGzrj
	RG/XzcE6Bh+e9wudlPYdWE61XdzG13qiER/BFOc89BC4omxPxspZXVbssIwLLk2/6xnH+E7GrFj31
	NwnZOqfwcUy1i5CY4mUQ+tv46d81oMuIceNPknE4DC7zOpGUUxuTa73jL5OD/3WOK0xQTSW8KOhms
	+3I1brKrDdVP9p/W4c2RreWtYQI+m9DZVkhp1Lh06O0aLFzbJghA9K0vwxgcElVRdiGmMjuKTNCRr
	hMxujwThk7Xm1gbbaTQSYrebCSqQPbIYB7M921JnMBYw0VmJjb5ExTvvaKNfYbJ/HJr65/VxsVwRs
	pNnB/djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlFj-0000000Ap93-0AwV
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 05:38:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlFf-0000000Ap8b-1vbl
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 05:38:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094BtSN018275;
	Thu, 9 Jan 2025 05:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3M05VNobMlqihLFY1hRX7+uDTC8lilZ5KVPx5Dp4B10=; b=TY1mN72NN+cgYEYZ
	Oomk7Xut7gMXBGcz/TE1pDj/JyiFqVXKvmFw+mCq+Kn6stH+eMsP+ljqaDtu3oz2
	j9FpDCIGtZIk/rCP6FvQ0bq4LPyz2blhxPNoTpFNY4lQoe62wjbswnF7cxjN7jpT
	9Qh6dSALH0slagoOoPEP7+ifK4ut0F8lnro8zzngchhhfjJBrRY83Hwq1L6xH7cN
	0XmZcjUTR1jXDN1n28vwbKhaQyXx/XOERwiqEeIRGPqSQBexHyrc+s82mVeGiBnF
	d9r02J3Gy2AIRhjvN1Ksjjs03pDnh7rW7iMWl/zYOPqRxDUeckgXhx/9Ap5aevmd
	LOqhlg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44277e0567-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:38:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095caOZ028786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 05:38:36 GMT
Received: from [10.50.55.168] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:38:34 -0800
Message-ID: <c022493b-d009-4a1d-9fbd-219a3ecf84b6@quicinc.com>
Date: Thu, 9 Jan 2025 11:08:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Support Transmit Buffer OFDMA Stats
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Pradeep
 Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
 <20241128110949.3672364-3-quic_rdevanat@quicinc.com>
 <87jzb6flwz.fsf@kernel.org>
 <c776b5ee-0e25-4d21-be21-dd318ae33d1e@oss.qualcomm.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <c776b5ee-0e25-4d21-be21-dd318ae33d1e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5kPwMNzfZnLuQ4pgfP0bETfWbJwLXD5q
X-Proofpoint-GUID: 5kPwMNzfZnLuQ4pgfP0bETfWbJwLXD5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=879 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_213839_506056_D8B4B17E 
X-CRM114-Status: GOOD (  20.77  )
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



On 1/8/2025 5:08 AM, Jeff Johnson wrote:
> On 1/7/2025 11:45 AM, Kalle Valo wrote:
>> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
>>> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>>> +	len--;
>>> +	*(buf + len) = '\0';
>>
>> Please avoid pointer arithmetic, this is simpler:
>>
>> buf[len] = '\0';
>>
>> Or should it be just 0 instead of '\0'? Don't know which one is
>> preferred.
>>
> 
> well my take on this is we have a lot of similar pointer arithmetic already in
> this and other debugfs files, including all of the scnprintf(buf + len, ...)
> calls which could be scnprintf(&buf[len], ...). And we have existing instances
> of trailing comma suppression in:
> print_array_to_buf_index()
> ath12k_htt_print_txbf_ofdma_ax_ndpa_stats_tlv()
> ath12k_htt_print_txbf_ofdma_ax_ndp_stats_tlv()
> and others, all of which assign '\0'
> 
> so this code looks ok to me.
> 
> that said, while i've been reviewing the debugfs implementations I thought the
> code would look much cleaner if we had a wrapper function (or macro).
> 
> Note that the input to the current debugfs functions includes a struct
> debug_htt_stats_req *stats_req that maintains the buffer pointer and filled
> length. what if we had a wrapper that took just that, the format string, and
> the optional arguments, and all of the pointer arithmetic is encapsulated in
> that function, rather than being open coded?
> 
> so instead of:
> 	len += scnprintf(buf + len, buf_len - len, "some string"");
> have simply:
> 	ath12k_scnprintf(stats_req, "some string");
> 
> that function would extract the buffer pointer and current filled length from
> stats_req, calculate where to write the next string, call scnprintf() or
> vscnprintf() to write the string, and then update the current filled length in
> the stats_req. That would eliminate all of this housekeeping from the callers:
> buf + len
> buf_len - len
> len += scnprintf(..)
> 
> /jeff
> 

Since there are a lot of instances where this change is needed, can we raise a
separate patch for this? If that is okay, we can go ahead with the current
implementation in this patch.

