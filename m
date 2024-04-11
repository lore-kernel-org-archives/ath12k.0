Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66009C4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obUhQxnbcO8snAnhsaUvMfgbWIrQepsj+tWTy9oFZac=; b=FA0MOIr8xWZcZDpt6/QM+YEYfw
	YQr7eD+DOT6HsljSwPHuZKFMuE7SnLEiBbY2EPzuUTChYR0bC4+dPdxSAktcopiIJbzevd5kUEQXI
	9v6+xIrY0v+N/j1I/zs8DGeyUd3I1Qf/bWb7WutJ4ETt0u+sgRXlaoo0Rk1gVZgLRB6KzsK1BoTwN
	c3zHR5URP8CWbpeqYfLm7KOVGvftWvTs2ydpBghnBBOPBsR7zx5xxiO+r/KsACUV5jThvCDl6mQ4S
	TeEafMcBklQV02YLdxA2YL/QPF/9XGoGiRzwINLkqpOUsgTFAhDzVbXH40wQK0414r9J6wXjZHBnw
	dp/TS5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwES-0000000CiNL-0SDv
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 15:20:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwEP-0000000CiM5-0LxT
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 15:20:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BEEE8N001798;
	Thu, 11 Apr 2024 15:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=obUhQxnbcO8snAnhsaUvMfgbWIrQepsj+tWTy9oFZac=; b=Yf
	pZ/ZpPDbs3RMRKMfbJneiXpLORFIrwsWnN/nhJKYeGKK8Yf5lMpzbCnnP55LnLZB
	KEQJ2fgi7L6zhQLggSagqnaXSetTYWgRhtZ5fHaYJeuZFiHFznpp1csLejyfQgbY
	YOsSBhb3r8J7YB4/dWfRq5k41YXIZ1jpdOWzOfDLEiHEMRmc7vVxwvCgSQeKouJ+
	pHcgaB8o1/fmYXM33QFn8PNDvQbSscSIXAm/drh5/JwxdyfV2Vd0J1Bp8t0zPs2M
	xOmAi/ONwKqRhr3+u1H/FQlxF/FDx4Mu9ejgAZDLfFSVGVo2w3OjAko8p/uKs5in
	b+S/AYsQ9Lq0EBRI3Clw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6vsf89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:20:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFKeAw007529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:20:40 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 08:20:40 -0700
Message-ID: <823fe8a6-1e6c-49e9-a225-2012e77093ac@quicinc.com>
Date: Thu, 11 Apr 2024 08:20:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Refactor data path cmem init
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
 <20240409151415.1226109-5-quic_periyasa@quicinc.com>
 <877ch4z0z1.fsf@kernel.org>
 <6ac588c2-6206-c12e-e741-cbc507365bc3@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <6ac588c2-6206-c12e-e741-cbc507365bc3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mOR919MI6AnHBKfiQaao07LU4OU8meXH
X-Proofpoint-GUID: mOR919MI6AnHBKfiQaao07LU4OU8meXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_082053_290780_4E74DD03 
X-CRM114-Status: GOOD (  14.39  )
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

On 4/11/2024 3:07 AM, Karthikeyan Periyasamy wrote:
> 
> 
> On 4/11/2024 3:15 PM, Kalle Valo wrote:
>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>>
>>> Move the data path Tx and Rx descriptor primary page table CMEM
>>> configuration into a helper function. This will make the code more
>>> scalable for configuring partner device in support of multi-device MLO.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>
>> [...]
>>
>>> +static void ath12k_dp_cmem_init(struct ath12k_base *ab,
>>> +				struct ath12k_dp *dp,
>>> +				enum ath12k_dp_desc_type type)
>>> +{
>>> +	u32 cmem_base;
>>> +	int i, start, end;
>>> +
>>> +	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
>>> +
>>> +	switch (type) {
>>> +	case ATH12K_DP_TX_DESC:
>>> +		start = ATH12K_TX_SPT_PAGE_OFFSET;
>>> +		end = start + ATH12K_NUM_TX_SPT_PAGES;
>>> +		break;
>>> +	case ATH12K_DP_RX_DESC:
>>> +		start = ATH12K_RX_SPT_PAGE_OFFSET;
>>> +		end = start + ATH12K_NUM_RX_SPT_PAGES;
>>> +		break;
>>> +	default:
>>> +		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
>>> +		return;
>>> +	}
>>> +
>>> +	/* Write to PPT in CMEM */
>>> +	for (i = start; i < end; i++)
>>> +		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
>>> +				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
>>> +}
>>
>> Here's a good example why I don't like functions returning void. How do
>> we handle the errors in this case?
>>
> 
> sure, will handle the error case in the caller.
> 

this is a static function with one caller. the only error is the default case
which will never be hit. adding logic to return an error and then check it in
the caller seems like overkill. why not just WARN() in the default case since
this would be a logic error with newly added code?


