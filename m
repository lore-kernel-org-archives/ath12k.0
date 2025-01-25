Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFB2C0218D
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i2xeWg3R5GBSVEB5+8rekrvMBVDAi3hQD8Xh1ueFO8=; b=n0w/wBBHKFLlclTgcZmgtAff+Z
	+HvRwmLWMhkoaWbae6G3naJ0URzJhp5lvfkqy+GfWeUuzq5697iFP37B+I0Duxu9h8tj2Ygl9qVdD
	0iUBApK+Rorksixe3lgtYLVSC0hyGrBJmgzX3XTNyauM8qLkEZXt/caIWr+fjYzvMD8hW5M7t3djZ
	5Qh9n82rM2/RDBSccrjMYOVKLOwMwne9I9PP4qjQFtJS5ZcIbhpdMH0A/Ry2j+fTmf1azxH2AHArK
	4ibYWP7xEv3SUL4HkXJe6S63qPxrLCBugoYlTaZCgR3ca1bRH2RUDN+wcl4dSfqDm1MKSI7B89Zvx
	snu/Pm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbkhf-0000000Gg2T-2qIK
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 18:16:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbkhc-0000000Gg29-3Pgc
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 18:16:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50PHmgrw005726
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 18:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i2xeWg3R5GBSVEB5+8rekrvMBVDAi3hQD8Xh1ueFO8=; b=jL+EYSZ5TcoPoWK1
	IwdkpCTfNmAG+JtHM5VuFrz0b5DUU0x/gBiDRxDloIC+A5BqrgoOMxhB1CU7TbA+
	MjM96cpiqjSO+Z7ePVKKNhzTvmiErycpa96a25Ze2zmoMKqFDwjCz5n0V6j+0swV
	41BNyxLdwLYA4/j05qgwgPJbf37IwWG2iM/xSOxEg3o7TNZfyvbeXMWtoqUWHIAD
	6ceXZXqC+w3VzRuRpIjfrT/dYXLOaDIEN5HoFk7RniAMZFS6Ag5CHiVYGJ/o9qJL
	2Q78sIPZY13NPy/BSPd2nK4Q3/NB398v8iRpi5cQHxNyEZTnc/2hAexWTqLGYBYF
	V6DpMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cryr8u0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 18:16:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so5802024a91.0
        for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 10:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828974; x=1738433774;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i2xeWg3R5GBSVEB5+8rekrvMBVDAi3hQD8Xh1ueFO8=;
        b=TDWGgxV/oCVxAhnHC91n5wj7VgwgTGcA/U/p4naF6qZa343EzpnI2O5U4CulbmQOcN
         5pPWJnGlYYdAwSqv3zompMG01lOPFKPVz5WVRFz9twVH7AVU2DWseTwy5NlW/9Ys9Q+M
         +fEWldSU+6B0ejM0ZJ8o/cYdWn5Wsm8vIgrC/yzW23yck3K1W/PshW+9t7B5ROBu9NCp
         c6uQtvZlS0wIr5k1n1M6ttWAQPkKJz53E3kvykpp7Jl26g8UF95dpsf4lKA1GpMoeUh/
         w9lTZtzrIq8SKbzZJdGU7LITrdXCIuN2rdoU2CTJDvVbZ8HPZw+Jdx/A79rruz9NDDpL
         GwyA==
X-Forwarded-Encrypted: i=1; AJvYcCWYCDUILAkIXUDh4LNzoLHZ9vBoAhAwjY4LTdOvMoA7pH6EUFfoAFoVvoK7GbAH5FK53HU0tX0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5McKAxEDa5yp+wYhRSmKu5KfVR4LsRgVBP/FRUahcOXZhNaEZ
	aVRWnT4hTFldLIBEUTrogl7Kdgd9UzBU8sui5Z2hVZWWBK2kw9wqp/ig281tcDZ6SmKC5WlTVf5
	8W1F6zBzg9y8vUw23wc0o3Njl/MWDUpIM7RAs+UwoUb3c2dLFZ+pzoqmLf+ZDd/9L+uxg
X-Gm-Gg: ASbGncskSCCnPPnITv/b6Fw2MFIc/18lLsf/fIakB+JVCjVtgnLeoT78Ce0q65VmHtY
	jsgLlHB3ri+9DpTBO9CU+1mvduZm1aFM/dkWXKY0cej42qbp2MTcuJfwSDCe+NNI27KMvXGPlro
	Mqzmqgo4tNpQZewhEJP/HUgXFTqd2QDh62T8c+aiMl2q201kuMPyCCrB3JYbzooo31AQBU/5dez
	/mDkvkk69FgiJvM+Jp/r1EIDLUQWwMn99NLHGbKMLd2MdTGNIWA2c5FhJYKDoMr8WcyOZCgeYBn
	taLYEnGMP/1NHJbuEMH5omAlWmu+gojrIax12V8+YfCYI++z73Eh2Z/weM4a0lFIhyb13iwEyA=
	=
X-Received: by 2002:a17:90b:4ece:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2f782c50befmr44416819a91.5.1737828973995;
        Sat, 25 Jan 2025 10:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuUlocxSHJem8ZGdm7qzzzJxpC7hQ5Glct8AKuYKKLjsMA+cqdAfQczJfX9DFnrOJHHKw4yg==
X-Received: by 2002:a17:90b:4ece:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2f782c50befmr44416788a91.5.1737828973553;
        Sat, 25 Jan 2025 10:16:13 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbcdffsm3457646a12.64.2025.01.25.10.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 10:16:13 -0800 (PST)
Message-ID: <a39d5381-fd5f-4187-a715-0fedd010d03e@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 10:16:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Add support for MLO Multicast handling
 in driver
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
 <D7AA0SSICNT4.3GU5SHWIXWH94@gmail.com>
 <0e2feb8f-79dd-19af-3ad9-e61d3f25e9a6@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e2feb8f-79dd-19af-3ad9-e61d3f25e9a6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n49gIxoahcA3DIv_wCTg6k05xScMnd3z
X-Proofpoint-ORIG-GUID: n49gIxoahcA3DIv_wCTg6k05xScMnd3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501250136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_101616_869176_6072B250 
X-CRM114-Status: GOOD (  16.04  )
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

On 1/24/2025 1:59 PM, Balamurugan Mahalingam wrote:
> On 1/24/2025 3:45 AM, Nicolas Escande wrote:
>> On Thu Jan 9, 2025 at 7:49 PM CET, Balamurugan Mahalingam wrote:
>> [...]
>>> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
>>> index 76626d925adf..9d05fe7a870c 100644
>>> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
>>> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
>>> @@ -217,7 +217,7 @@ static int ath12k_dp_tx_align_payload(struct ath12k_base *ab,
>>>   }
>>>   
>>>   int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
>>> -		 struct sk_buff *skb)
>>> +		 struct sk_buff *skb, bool gsn_valid, int mcbc_gsn)
>>>   {
>>>   	struct ath12k_base *ab = ar->ab;
>>>   	struct ath12k_dp *dp = &ab->dp;
>>> @@ -290,13 +290,24 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
>>>   		msdu_ext_desc = true;
>>>   	}
>>>   
>>> +	if (gsn_valid) {
>>> +		ti.meta_data_flags =
>>> +			u32_encode_bits(HTT_TCL_META_DATA_TYPE_GLOBAL_SEQ_NUM,
>>> +					HTT_TCL_META_DATA_TYPE) |
>>> +			u32_encode_bits(mcbc_gsn, HTT_TCL_META_DATA_GLOBAL_SEQ_NUM);
>>> +	}
>>> +
>> Hello,
>>
>> As ti is zeroed initilised isn't safer to do 'ti.meta_data_flags |='
>> instead of 'ti.meta_data_flags ='. This way if we add another flag in
>> meta_data_flag in the same func for another reason, we will have less risk of
>> overriding the said flags ?
>>
> 
> Hello Nicolas,
> In this case, this is an intentional reset of any previous residual 
> value in ti.meta_data_flags field.
> The meta_data_flags bit definition is different depending upon the 
> META_DATA_TYPE bit's value.

So in this case there can never be any conflicting information that came from
the assignment:
	ti.meta_data_flags = arvif->tcl_metadata;
??

Perhaps add a comment that states you are intentionally overriding the
information that came from arvif->tcl_metadata?

/jeff

> 
>>>   	ti.encap_type = ath12k_dp_tx_get_encap_type(arvif, skb);
>>>   	ti.addr_search_flags = arvif->hal_addr_search_flags;
>>>   	ti.search_type = arvif->search_type;
>>>   	ti.type = HAL_TCL_DESC_TYPE_BUFFER;
>>>   	ti.pkt_offset = 0;
>>>   	ti.lmac_id = ar->lmac_id;
>>> -	ti.vdev_id = arvif->vdev_id;
>>> +	if (gsn_valid)
>>> +		ti.vdev_id = arvif->vdev_id +
>>> +			     HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID;
>>> +	else
>>> +		ti.vdev_id = arvif->vdev_id;
>>>   	ti.bss_ast_hash = arvif->ast_hash;
>>>   	ti.bss_ast_idx = arvif->ast_idx;
>>>   	ti.dscp_tid_tbl_idx = 0;
> 


