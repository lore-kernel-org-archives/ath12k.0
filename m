Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B597CDE008
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYD+iBbEX2/Vczxq9auxJGJpjLsSUgd7K6ves1Mi7hg=; b=NueUzVedgOs8zq8A2SoGUpPywJ
	BskjGh1MIkPyaPp56feMPvSR6BxMgD0S687VP8YPFJrqooOJvYqCv6mhLHBbUpSRUGcmu1kO90yVM
	3PNnQfJUn+4PLb1Y4W5WqqLQu7F76tfTcoKz0LuCy3Il1ejoGtsgfELlr4L43ZxdUznbxONAD4g94
	tZpyzk//KmLo3KMbQGeXdCDEcCpGNEUadZvU7waHriJIIJpMkzgahRW+0VcntSxzKJ+6S1nmZshmD
	OOtbL9kdVOUqb6yMH5CksLlWgghvG2hBRN1bzUf4sdl32BzkFyI1xp+PesVR8b4opI/CdVUIvH7xX
	gbIWLJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd29b-0000000Asn6-1IAP;
	Fri, 26 Jun 2026 08:43:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd29Z-0000000AsmW-0GuE
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:43:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6W2b6631922
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYD+iBbEX2/Vczxq9auxJGJpjLsSUgd7K6ves1Mi7hg=; b=HFczB+NgZUNLhUwT
	VG8efrpdcFzLlLf8UHNs1bGbKb3guSJ0ENB9icVX+tWH0sVDqbCNbkSbpBs0hhYb
	Am4igGwl2PCK9vZXa5xFClxioxTM847JxXgEu6DXNvI7O6dgXibW7yvpGnFJpl9K
	WVx1grLm8+ZGo2g8xDbjAOgVry1ID8kBkorMd0Vz4EdgLQIjU3r2Qo3h3BvVaqUu
	vPOk8cy24F81YsE/UMOYzQAS2vBuXdb30lse67JhssmpBbLFDJSVUMyGn/2wkQBZ
	CHJ7uq6xZQcBRkcWE62z4aFwSgZc8h75zJDybZadxxRPAdoQT1ZtpJpUFVHpwhyP
	j5k2cg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asktqer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:43:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcbb34e57so889177eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463390; x=1783068190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYD+iBbEX2/Vczxq9auxJGJpjLsSUgd7K6ves1Mi7hg=;
        b=AvuqvgbyKQ12N78NjFuAiAz/3cF1H0QsgjDuy3d2oeu3PpOy8UFAJoIObA8Tm8oH+5
         IVcCbrNoUrK+BtA/pkXhbYBAzw/pglratNg1efYsDb2ARVVecBJZ9iaP8O3GAXGFrHVp
         YoJuRiweFKp2YIQv9vYMpHZgZFoFqbxr+/FG6GMm0bWKYGYZkMZZ3xzio5QaEsknTT9/
         flaIBGvZxx3VCnIn1UqBFjfCycwWVfRXL5zsGyDrQtycV7mQb+nKxmx1dRifwItDhpqW
         ZwlFD6m9gMWAAKnqTvP6kOb9kqsWG1+43Fm81t+6TyvwY5rDD8xAavexZqeQBVV2IUcY
         d6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463390; x=1783068190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYD+iBbEX2/Vczxq9auxJGJpjLsSUgd7K6ves1Mi7hg=;
        b=gVHfJKmsK2GfH09OjepOCj4pllOePw1ZSJgXndAE5aDKcZ0AM/oy++VQHjJfYwzbb5
         +EOVFOTpyfmJygHfhicEnloMYKgCIpispECFqGGieEuUQi6fbirJopSUeE8GgYLHKDLn
         2r4V9hv1LHoMsEMit+Ger81yAw5Zvx2zxc54Plo9YiqdygfkfpBpUsLilKLz2rTNfyI4
         /d0ArZpA2dcSTkdSvbbBoKhGS43UQdyzMxpyaLe4ouQCzzi3tNQyoqo8TUx3AsWszHIW
         QWsxNp3UYipzlMn3ZsmZrOHaZCLbXzpvRk6362l4eE/TxP8fzfdY8mATLREWmsI1IsxH
         kVCA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4/2DneKOkLFPM2yncOKPtd8hDmoGvUBIpitH/Bs+fe+ss5qw3UCyyuQycKYRcFF7L/iAIFk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVZO91si1HJzug6eV26VAaztcH04m7YDxjstrdwdsmFBUSQsRc
	tOwk4iAxzae8yksdvBknfo4n3S5OowTchn8If8S8fwSCERxVGzS+OUZsDy5YrHTlqa2XV9bf8qZ
	YG697MBZcxG8rtw4AnJS2XrfQeXn/elqJu22IlYBMVxs1CCogdPw+60FcfM1pFg36
X-Gm-Gg: AfdE7cktm8nRjVthb5LUTNZST0KQciH+NHGGyeXqAixPAEqCUXFJEPtfK85QEk/FRFJ
	l+ztY+avuzT/pPdlFANu1AvWVTzcJ1HJ/HO4tmVg9Z62AL15JQRgEACBUcJ1U3o1KLHfagSlAS+
	5xIQI9oqnC/QQDWANVp/u4MakqIiB9fGmn34dloZh9w53jKYaQ1WqQpjlIbUS4+ITGY4eEI9ygZ
	M5S0feqZXnsCQk8B7d8b7iTlj0KbMZfcf6qhZf6RdAYrmboVJ7WMiDKcHPoUjXBWJtNP0fh7Kqu
	vimC/GHV505OX36GIJGfi1gZVytnZoWrcD9JqjIKPrS4dK9xfWqtyNqJudPbwL+TnfwwQyCipmS
	9i0dvCtHeHKVlWWLc1mHLQ/dDHGeksNjq9KJO5YpL8INc
X-Received: by 2002:a05:7301:5789:b0:304:2cc9:2ba8 with SMTP id 5a478bee46e88-30c84df3c57mr5151665eec.30.1782463389835;
        Fri, 26 Jun 2026 01:43:09 -0700 (PDT)
X-Received: by 2002:a05:7301:5789:b0:304:2cc9:2ba8 with SMTP id 5a478bee46e88-30c84df3c57mr5151642eec.30.1782463389251;
        Fri, 26 Jun 2026 01:43:09 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm25418640eec.15.2026.06.26.01.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:43:08 -0700 (PDT)
Message-ID: <6df2e6c8-b0d9-4b41-ac8a-22d4415b60f1@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:13:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
 <44d9944c-3760-4ef5-8830-265eb2e9b896@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <44d9944c-3760-4ef5-8830-265eb2e9b896@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2OCBTYWx0ZWRfX7BLb6Abb4T1h
 EDJLABXqeZDGXzKn5QmsCaFGCMmCCH8IYyB8RSiBhLECo3D95MjlfB6FSeazbpzDvY6VZSZ7lia
 qguO9fsbQZzmkt9e7JK4hCv3tefX4nw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2OCBTYWx0ZWRfX+p+h+wwmMZE9
 MpND/AMCNGMBhvNiWpyOlgUTs0k/Vvh5ku39vu3TNpB9/bHD8G/0NNyVnnPTHK+hLfuBGbpPNEl
 +FqAuYOVyIp53hGIE8IVhiSxeErR2azQ6o444iOVH/080ZxNkZa5jh/aERqJTWQdzf9W7CbJPQd
 biBWNPfjB7UB/pt1Ewyxo+HM718i476XKlp7Uy296jilUyLE9EsLO8y9Ti7Ml0VWPRH0hAFyw+H
 pLHIqUzz1ghcDJDDpr0Lb7rkvLDTTgPCdY16LGh9j2vDdaYSevRZnXWvB0Hu/FopYm7wrgCmSuY
 qz9QBtNkRXw1z7E00yiFy0EOP/PGFE4S1b38a3E8BcuK1KbZz7mhmF3UzLkLak8wNT5tUWeCyMm
 RxVV53LCz2f+rS+yz5thAcHwMZ01WLwZljerVJG5Rkp/23PZDEPM3iBqbB3as9ObXsfKTQQZmla
 QjmgN+UhHnMBvq5+DTA==
X-Proofpoint-GUID: qWjGyBX6QWv-5mXSL5HQ-Jbg7mqd-nRM
X-Proofpoint-ORIG-GUID: qWjGyBX6QWv-5mXSL5HQ-Jbg7mqd-nRM
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e3b9e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-Rr0OPpVIScezk7OxfYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_014313_233733_8B8013A0 
X-CRM114-Status: GOOD (  23.19  )
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



On 6/24/2026 5:12 AM, Jeff Johnson wrote:
> On 6/18/2026 11:58 PM, Aaradhana Sahu wrote:
>> On AHB platforms, firmware operates in two modes: fixed-memory mode where
>> firmware uses hardcoded addresses for memory regions such as BDF and does
>> not request HOST_DDR memory from the host, and dynamic-memory mode where
>> firmware expects the host to provide memory addresses including HOST_DDR
>> after the Q6 read-only region and relies on host allocation for all memory
>> types.
>>
>> Introduce QMI capability negotiation to support both modes. Add a new QMI
>> PHY capability flag dynamic_ddr_support which is advertised by firmware to
>> indicate it supports dynamic memory mode. When the host detects this
>> capability, set the dynamic_mem_support flag in the host capability message
>> to signal the host is ready to provide dynamic memory allocation. This
>> triggers firmware to send the HOST_DDR memory request and use the
>> host-provided address.
>>
>> For backward compatibility, if firmware doesn't advertise
>> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
>> where firmware uses predefined addresses.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>> v2:
>>   -Dropped QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN and QMI_WLANFW_PHY_CAP_RESP_MSG_V01_MAX_LEN changes.
> 
> I think you needed to keep the REQ_MSG MAX_LEN change.
> My prior comment that the REQ_MSG MAX_LEN macros are a layering violation was
> constrained with the observation "that is a preexisting issue with the QMI
> interface" so we must continue to pass valid MAX_LEN values unless the QMI
> interface itself is changed such QMI determines the MAX_LEN
> 

You're right. My bad, I mistakenly dropped the QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN
changes while updating the patch. I will restore in the next version.

>>   -Used %u instead of %d in the debug log.
>> ---
>>  drivers/net/wireless/ath/ath12k/qmi.c | 50 +++++++++++++++++++++++++--
>>  drivers/net/wireless/ath/ath12k/qmi.h |  6 +++-
>>  2 files changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..e15a0c0120d3 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -506,6 +506,24 @@ static const struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
>>  		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>>  					   feature_list),
>>  	},
>> +	{
>> +		.data_type	= QMI_OPT_FLAG,
>> +		.elem_len	= 1,
>> +		.elem_size	= sizeof(u8),
>> +		.array_type	= NO_ARRAY,
>> +		.tlv_type	= 0x33,
>> +		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>> +					   dynamic_mem_support_valid),
>> +	},
>> +	{
>> +		.data_type	= QMI_UNSIGNED_1_BYTE,
>> +		.elem_len	= 1,
>> +		.elem_size	= sizeof(u8),
>> +		.array_type	= NO_ARRAY,
>> +		.tlv_type	= 0x33,
>> +		.offset		= offsetof(struct qmi_wlanfw_host_cap_req_msg_v01,
>> +					   dynamic_mem_support),
>> +	},
> 
> Does QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN need to be updated to account for
> the new TLVs?
> 

You're right. I will update QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN by 4 bytes and
send it in the next version.

>>  	{
>>  		.data_type	= QMI_EOTI,
>>  		.array_type	= NO_ARRAY,


