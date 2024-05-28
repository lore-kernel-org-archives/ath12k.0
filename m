Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7433AC25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z3nnF0h5PaBzQZEJE8W5MQLXaDHDwtVuMYAdp1Ou+0=; b=1Q2nIHtFXOiW5M3Muh5kPf0I2r
	b4becLqzRGs3kK+5qB4Inm6HlwH1Ee5+n6KVUbvUhtXxclTj1UcxtpWyIAmTNPIaeEU5mG5g7uCdW
	3E0ATNI1WJrmKv+/3yEU4Eo4B9F4++kLpLYsMf63sCzj3dfWnUYKAc1z3dmK9Zelv4/MuJFJ3rryD
	oJHIO2nclqtCgmo7AXrGcQwHyPdiSxEhsDw+VkjDX3Eep/hwIm1kMuxGVFp/RBKgw5n9F50fXMxBa
	wk/6PrxKiKbP6HCEEVQqarkTU3Kp70zGRkfyLx8bcClfRrIfEH8JZhyLozE+pf8YJrauVlxJ6DfjW
	egS6sufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC001-00000001T8e-0pIZ
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 16:48:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBzzz-00000001T8C-1TN2
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 16:48:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBiZrD021170;
	Tue, 28 May 2024 16:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z3nnF0h5PaBzQZEJE8W5MQLXaDHDwtVuMYAdp1Ou+0=; b=YEAObYaeEgv/GAAi
	zIUW51JrpdKkYmfDgXNYYhb4xABKCtiVE70WVFW11n7ZzLDpzV0NyjLHx/KweQCl
	GcjS9mSfiot+i6BoIRNlQUPyGvpG74hVVJU6OkykvWCzEpAC/W82rBlNUm52i+E1
	JVxrM4EsWvZJOlIX37kQdXDhcod0Wrar375LX26NgXI8CGNd44VSKL0dGIuE8gPp
	lfr/fJP95R4y0q8pVTjKop1NsM6p1LmUnDisAiwC77qx3SpW2hU9b+A51ZrqjZGO
	w0u+4mmJePIY8YUSQMLwYuYlSzbc0bZsEYBXAD0+9bQmET1RuB3MYQ8r5LmuuPad
	eJNwMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ppmv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:48:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SGmOXN025296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 16:48:24 GMT
Received: from [10.50.5.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 09:48:22 -0700
Message-ID: <1be3531d-b550-4b19-93bb-d41e93362e19@quicinc.com>
Date: Tue, 28 May 2024 22:18:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] wifi: ath12k: Dump additional Tx PDEV HTT stats
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
 <20240510050806.514126-6-quic_rgnanase@quicinc.com>
 <87le43d26u.fsf@kernel.org>
 <024e2594-309a-4549-9c69-d527717c5dd4@quicinc.com>
 <87r0dm6vrn.fsf@kernel.org>
Content-Language: en-US
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <87r0dm6vrn.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yTz42HeB_HVIkG87MgIGaF2oG3uR033S
X-Proofpoint-GUID: yTz42HeB_HVIkG87MgIGaF2oG3uR033S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=917 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_094831_432877_19F1A201 
X-CRM114-Status: GOOD (  12.51  )
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



On 5/28/2024 4:36 PM, Kalle Valo wrote:
> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
> 
>>>> +static inline void
>>>> +ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(const void *tag_buf,
>>>> +						struct debug_htt_stats_req *stats_req)
>>>> +{
>>>> + const struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv
>>>> *htt_stats_buf = tag_buf;
>>>> +	char *mode;
>>>> +	u8 j, hw_mode, i, str_buf_len;
>>>> +	u8 *buf = stats_req->buf;
>>>> +	u32 len = stats_req->buf_len;
>>>> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
>>>> +	u32 stats_value;
>>>> +	u8 max_ppdu = ATH12K_HTT_STATS_MAX_NUM_MU_PPDU_PER_BURST;
>>>> +	u8 max_sched = ATH12K_HTT_STATS_MAX_NUM_SCHED_STATUS;
>>>> +	char str_buf[ATH12K_HTT_MAX_STRING_LEN];
>>>> +
>>>> +	hw_mode = le32_to_cpu(htt_stats_buf->hw_mode);
>>>> +
>>>> +	switch (hw_mode) {
>>>> +	case ATH12K_HTT_STATS_HWMODE_AC:
>>>> +		len += scnprintf(buf + len, buf_len - len,
>>>> +				 "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n");
>>>> +		mode = "ac";
>>>> +		break;
>>>> +	case ATH12K_HTT_STATS_HWMODE_AX:
>>>> +		mode = "ax";
>>>> +		break;
>>>> +	case ATH12K_HTT_STATS_HWMODE_BE:
>>>> +		mode = "be";
>>>> +		break;
>>>> +	default:
>>>> +		return;
>>>> +	}
>>>
>>> Why are we not adding "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" with
>>> ax and be modes?
>>>
>> Sorry for the delayed response. I was on OoO for a week.
> 
> No worries.
> 
>> We will receive this TLV for each hw modes. Since
>> "HTT_TX_PDEV_MU_PPDU_DISTRIBUTION_STATS:\n" is header and it would be
>> suffice to print it once, hence added it inside hw mode ac which will be
>> the first hw mode integrated inside the TLV.
> 
> I would have expected that we print that outside of
> ath12k_htt_print_tx_pdev_mu_ppdu_dist_stats_tlv(), before the function
> is called at all.
> 

Function itself will be called more than once. The overall HTT TLV will
be integrated with tag HTT_STATS_MU_PPDU_DIST_TAG (129) for all the hw
modes separately.

