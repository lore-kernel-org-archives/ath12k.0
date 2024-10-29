Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58427D3A676
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mt9pH/78oE5zuJU2bKByu8PR41r20/+DXKfBeBXsAw=; b=ifLEVKDBvgaXrvIExhy2iGs7jm
	J3PxKl7goAGwovyt89xvfrIXnj6PlK+rIPPkCuJ+6TQ30ho9wHbVgaYFxLqGY2YES18dAlOGg8fRX
	nM0J3FwqQt4PwkAPw6X0M7JDAFNwi7DGNiXPxMu2uDyN0A3ZreWc7CNUT8N4HDUQEWn1gP3siP1v4
	lzSOpFmzvsDx9NbXuNppkwnM1DH9MZLZ7tlapFTD8BrXKKBRnIhJt9ceiDSEiJXyQ5+5c15joQg1D
	+lg0QtM169pdTlqTOZbsi8vpxsdsP878GGdQbViv4WzdNVHYzi4VJzIGBNVNXTvTelRaQukwO2nu2
	HqqlyXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q9i-0000000FJ4D-3BdY
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:37:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oo6-0000000F4eD-0Mzu
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 16:10:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9YS9B000668;
	Tue, 29 Oct 2024 16:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mt9pH/78oE5zuJU2bKByu8PR41r20/+DXKfBeBXsAw=; b=mesYqOdWCXzfq1R6
	A5HHOa6Qjh/0p4vxuwBzMeQeUMJMEgaHCBUjoB6/BRTJOu3TeFCIkjJ6An80LEDV
	MwkTDPFMKwzdibUvWhrZhho46C37UEiTplEdUbsTtbQH3RhAzXnYDFieS76OTD/k
	xGkbT8o/YPcFsYgdxgWWD8og17vea+q/+GyJ6tNYbAanuzgWNagG3dS21ms9GDUH
	HkeI6OtaCq/r2uRmN1Lb4caRV7DDjrehYaNnEQ+WUE4Fs/1KogwZ9YiswjIK5G7Y
	CldQPRZt8zB3dY2zwQbdDkKdDPboFc3ttMdhPn4bqn9ddqA13rsVFv4dxeAFibBj
	TQi+Jg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt70xb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:10:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TGAreo008774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:10:53 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 09:10:53 -0700
Message-ID: <bcdd7464-8969-4ace-9a68-d40919bc1d59@quicinc.com>
Date: Tue, 29 Oct 2024 09:10:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] wifi: ath12k: Add MLO peer assoc command support
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241023133004.2253830-1-kvalo@kernel.org>
 <20241023133004.2253830-9-kvalo@kernel.org>
 <cb386a9b-2290-4640-8f08-7834cf4e79df@quicinc.com>
 <87o732gahz.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <87o732gahz.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WIer5tUpHHwb1pUwClQWe0NshPsCHUgL
X-Proofpoint-GUID: WIer5tUpHHwb1pUwClQWe0NshPsCHUgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=864
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091058_309937_3178950A 
X-CRM114-Status: GOOD (  15.10  )
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

On 10/29/2024 9:05 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 10/23/2024 6:30 AM, Kalle Valo wrote:
>>
>>> +	rcu_read_lock();
>>> +
>>> +	i = 0;
>>
>> nit: setting i=0 doesn't need to be RCU protected
> 
> Yeah, but that doesn't cause any issues and this way it's closer to the
> for loop where it's used:
> 
>>> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>>> +		if (i >= ATH12K_WMI_MLO_MAX_LINKS)
>>> +			break;
> 
> [...]
> 
>>> @@ -2243,12 +2251,38 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>>>  		ptr += sizeof(*he_mcs);
>>>  	}
>>>  
>>> -	/* MLO header tag with 0 length */
>>> -	len = 0;
>>>  	tlv = ptr;
>>> +	len = arg->ml.enabled ? sizeof(*ml_params) : 0;
>>>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
>>>  	ptr += TLV_HDR_SIZE;
>>> +	if (!len)
>>> +		goto skip_ml_params;
>>>  
>>> +	ml_params = ptr;
>>> +	ml_params->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_ASSOC_PARAMS,
>>> +						       len);
>>
>> this is another instance where we are using the same length for two
>> consecutive TLVs -- that doesn't seem right
> 
> This is also a similar case of _hdr() vs _cmd_hdr(), does that look ok?
> 
here again this is evil. please change to _hdr() and explicitly subtract out
the tlv header size


