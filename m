Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A39EE6F06D
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMAkGeDx5kZv4ZNCXjzo8eJ4Ssg9Ojb0R3bbwbuAlV0=; b=y+FUpkUDOSZUUyLM3SDEuo3Nza
	TiQr4fYQtilTqa4Nkn2eFnm4cGVNK7b8B2hd5x0KnvPRYYz7OzFXUT3hzECheJHn1uWVgK3G7WT/5
	qeUDjoAGhAoiZqvjhKG84IeyxJKJVgj1r5hlb8DT84yB75NQBRn1cTItg3vcazMYCN82ETNEvIEAD
	iPnvmCBJvAnT+RljassAGq9QPsVZvVU8TtOqtnozJ+nZEFX9Zz+oJMSjCebMGuA9C/IKbmuGhgqsB
	BmvEyLrVVyZMS9fPOmD8h9M+V1xKXBHPjo0L0/Jo7SxI3Sr7jWCDTc/XQqZZSmgNl7eyC9AhFVPA9
	B2EnCpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6twP-00000007ZBH-3DDp
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:52:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tiC-00000007X3n-1iMX
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:37:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1CTpRi009009;
	Fri, 1 Nov 2024 15:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMAkGeDx5kZv4ZNCXjzo8eJ4Ssg9Ojb0R3bbwbuAlV0=; b=oIn0nxE2OM61DSJS
	d+NfWQ7zHJmbe6ZvaVpUKOhDrEe9ylFg6yYOo+iiJOTzHWQYLc2SXpfgdpcGxWhb
	8rgcgn8zs+UgyrP4/1ck46yhZ0yh0LYgcCSgh8LRcWv7qpTMoa8/yuwVVOJTnfmk
	cdZSGRNji2zvLy3Jidqc+COJ7aDXD1MTu3N8GFjgwH3WdofMkfAdWpishrs2KmM7
	MUKLoobFO2w/euT8RjgU6iR/+6GJJjumqVuW/a3EhIlXVNA/1+6VjDeLD1esYreo
	iXPcDKMWOyvFSNS07h/k8HYxydDOlxmX31pAO3c48bA0/sP/+KDOlZfuigtIf4y3
	ieTe9w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mrce20ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 15:37:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1FbERg017235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 15:37:14 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 08:37:14 -0700
Message-ID: <c52113e2-a26b-4be8-b84c-173d9a55187b@quicinc.com>
Date: Fri, 1 Nov 2024 08:37:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create
 command
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-7-kvalo@kernel.org>
 <f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com>
 <87wmhqgb0r.fsf@kernel.org>
 <8d4aca1d-e48d-48e2-bacf-fdfe49c8e212@quicinc.com>
 <87h68r6oby.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <87h68r6oby.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ykmwatpi9zDoxJLkqZCokLGFT9_MWEQZ
X-Proofpoint-ORIG-GUID: Ykmwatpi9zDoxJLkqZCokLGFT9_MWEQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411010112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083720_733736_CF8DFC9A 
X-CRM114-Status: GOOD (  23.01  )
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

On 11/1/2024 7:06 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 10/29/2024 8:54 AM, Kalle Valo wrote:
>>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>>
>>>>> @@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>>>>>  	cmd->peer_type = cpu_to_le32(arg->peer_type);
>>>>>  	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
>>>>>  
>>>>> +	ptr = skb->data + sizeof(*cmd);
>>>>> +	tlv = ptr;
>>>>> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
>>>>> +					 sizeof(*ml_param));
>>>>
>>>> using the same TLV size both here and for the TLV that follows doesn't seem
>>>> logical. is this missing + TLV_HDR_SIZE to account for its own TLV header?
> 
> So I assume you are referring to this:
> 
> 	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
> 					 sizeof(*ml_param));
> 	ptr += TLV_HDR_SIZE;
> 	ml_param = ptr;
> 	ml_param->tlv_header =
> 			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
> 					       sizeof(*ml_param));
> 
> I have never figured out how WMI_TAG_ARRAY_STRUCT is supposed to work
> but I see a similar pattern also in ath12k_wmi_wow_add_pattern(). Any
> ideas?
> 
>>>>> +	ptr += TLV_HDR_SIZE;
>>>>> +	ml_param = ptr;
>>>>> +	ml_param->tlv_header =
>>>>> +			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
>>>>> +					       sizeof(*ml_param));
>>>
>>> But did you notice that here is used ath12k_wmi_tlv_cmd_hdr() and it
>>> reduces the header size:
>>>
>>> static __le32 ath12k_wmi_tlv_cmd_hdr(u32 cmd, u32 len)
>>> {
>>> 	return ath12k_wmi_tlv_hdr(cmd, len - TLV_HDR_SIZE);
>>> }
>>>
>>
>> Yes, I missed that since that is evil to use the _cmd_ TLV function on
>> something that isn't the command TLV.
> 
> Ok, so you are saying that we should have a identical function but with
> name ath12k_wmi_tlv_param_hdr() or similar? That makes sense but I think
> that's separate cleanup as ath12k_wmi_tlv_cmd_hdr() is already used with
> several WMI params, like in ath12k_wmi_wow_add_pattern().
> 
>> Please fix to use the standard function and subtract the thv header size from
>> the length param
> 
> I'm not a fan of manually subtracting lengths, as then it's easy to miss
> something. I would prefer to have functions for handling the length
> calculation, like ath12k_wmi_tlv_cmd_hdr() ath12k_wmi_tlv_param_hdr().
> 

Whether it is manually subtracting lengths or using tlv_hdr vs tlv_param_hdr,
both are easy to miss due to the lack of consistency in the params struct
definitions. IMO the only way to avoid this is to consistently either always
have the tlv header or to never have the tlv header in the params structs.
This lack of consistency is the real underlying issue since whether or not you
have the tlv header in the params struct is what dictates whether or not you
need to account for the header when filling the TLV length, as well as if you
have to separately account for it when you are determining the buffer
allocation size and when you are populating the TLV header in the buffer.

But the current code actually allocates and fills the data as firmware expects
it for this command, so let's keep the current code for now, and we can
discuss if it is appropriate to later update to achieve the consistency mentioned.

/jeff

