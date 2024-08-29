Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3139AC7114C
	for <ath12k@archiver.kernel.org>; Thu, 29 Aug 2024 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+p5NV++J3f9Rbydqekiod11lL7F4Q98IMfjqdNIw5c=; b=QsFw2AQYqiMG7q6Kk/tqPVBBNL
	AgGa6/641OTwfY9Esgp8KlAEsP4OhEtIWxq2HdrCenggyG6AD/HOd1CEuznRYUDydLf7WtYFqN4Hv
	87Qb3KQZRA20+XWX/gelHqfUD4IH4A6nwLRSd75tLn2PWB4pGbzAEEZohRZWb7/HG/iq8mbooSwR2
	EpdlmaaZYbhedpgMTb2vot8BKXZ6UxA9Mc+ub3OUtFRgXgnFqYcuI+NjmGYKeI0DLJwpS9rmga2nv
	VIk2u8lY5fCrW9V42rDwViPROOPwy2YgNXFHZshHq/Cbjq5Zp/v1Vs50psYtpz1WSKTRphGyKLg5R
	4c6m+p7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSuc-0000000Ha80-3cVQ
	for ath12k@archiver.kernel.org;
	Thu, 29 Aug 2024 00:21:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSuZ-0000000Ha7E-2cCS
	for ath12k@lists.infradead.org;
	Thu, 29 Aug 2024 00:21:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMTYZ014298;
	Thu, 29 Aug 2024 00:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+p5NV++J3f9Rbydqekiod11lL7F4Q98IMfjqdNIw5c=; b=e8HfcbmRexx0yL5q
	WhpCTqXxFgyinNsz+Q/AIuNfDPBOiZUnZX3hMEj7GQQTgL6Sir1F2UHls6NzGd7y
	L+NfQYTXvzn+RD1F4SViFUDGP8yCr7b9r7AhpV4JeVJLILXRvrNuzqNcU/eixIhF
	iS5Y4PY9ZbSXy82ClMYwuazNNPsFiFHxZRx3fSeWh9wloVLNsjTj4+HjDLUJK+uz
	sXy+YrqWyUstLQP72mf0zdqRYzfuiEKkbpmgI8RVPqTzYRirbXROfNTtJ/aTXiPb
	3OZIb7Ym3zveb5QHQG+sbUE5bjeBBsxYC+drY5bd7JlEQ7n2ajhSStQzzwsKihEN
	uInplg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv13cxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 00:21:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T0LCPp013956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 00:21:12 GMT
Received: from [10.50.8.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 17:21:11 -0700
Message-ID: <f5bf9d37-6420-392b-e318-7e7656ca57f3@quicinc.com>
Date: Thu, 29 Aug 2024 05:51:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Wrong place for rxbaddr/txbaddr to be in struct ath12k_spt_info
To: Nicolas Escande <nico.escande@gmail.com>
CC: <repk@triplefau.lt>, <ath12k@lists.infradead.org>
References: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
 <ce8201cc-f01f-77e1-f5eb-ab0d6e0bd36a@quicinc.com>
 <D3RUKAFELUWP.XTR6V4GB7JXS@gmail.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D3RUKAFELUWP.XTR6V4GB7JXS@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JAheXcJyxf5257-PdJLP2Agjyz-TFBX-
X-Proofpoint-ORIG-GUID: JAheXcJyxf5257-PdJLP2Agjyz-TFBX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_10,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=842 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_172115_774601_22B8112E 
X-CRM114-Status: GOOD (  13.70  )
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



On 8/29/2024 2:32 AM, Nicolas Escande wrote:
> On Wed Aug 28, 2024 at 6:58 PM CEST, Karthikeyan Periyasamy wrote:
>>
>>
>> On 8/28/2024 7:34 PM, Nicolas Escande wrote:
>>> Hi there,
>>>
>>> Looking into a problem we have on an ath12k platform at work with a colleague,
>>> I stumbled upon something that seems weird.
>>>
>>> The interresting parts of dh.h:
>>>
>>> struct ath12k_spt_info {
>>> 	dma_addr_t paddr;
>>> 	u64 *vaddr;
>>> 	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
>>> 	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
>>> };
>>>
>>> ...
>>>
>>> struct ath12k_dp {
>>> 	struct ath12k_base *ab;
>>> 	...
>>> 	struct ath12k_spt_info *spt_info;
>>> 	u32 num_spt_pages;
>>> 	u32 rx_ppt_base;
>>> 	...
>>> };
>>>
>>> In dp.c we have ath12k_dp_cc_desc_init that allocs arrays of ath12k_rx_desc_info
>>> stores the addresses of the individual desc in each of the spt entries using
>>> ath12k_dp_cc_get_desc_addr_ptr(), but we also save the address of the whole
>>> array for later cleanup by dp->spt_info->rxbaddr[i] = &rx_descs[0];
>>>
>>> Surely this is wrong, with the current code we always use the first element of
>>> dp->spt_info to store all the descriptors arrays. And the same goes for txbaddr.
>>> I mean it works, but we loose memory for no purpose & make this part of the
>>> driver harder to understand.
>>>
>>> It should be something like:
>>>
> ...
> 
>>>
>>> Right ?
>>>
>>
>> Yes, we always use the first element of dp->spt_info to store all the
>> descriptors arrays.
> 
> Well that was not what I expected. So please enlighten me, what's the rationale
> behind deliberately wasting around ATH12K_NUM_SPT_PAGES * sizeof(uintptr_t) *
> (ATH12K_NUM_RX_SPT_PAGES + ATH12K_NUM_TX_SPT_PAGES) of memory ? I'm quite
> puzzled by this decision... I feel it really doesn't help understanding this
> already complicated enough piece of code.

Agree your point, can move rxbaddr[], txbaddr[] out of the spt_info.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

