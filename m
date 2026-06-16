Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10592CD98D2
	for <ath12k@archiver.kernel.org>; Tue, 16 Jun 2026 06:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdJb7brSnFhjpTvyR+OLd7Yg5ivRRexl8ZC1EQrrZ0E=; b=OQfo8B1wmioypXir/inUwu89em
	GNtHQHRNve7tCidh1TYvs7vzptCf9sNGCR2M0rsDn42iseGM3GPAHdmKpN69NN7EKTOKfC/QZLuem
	jNarqN6g+J81o+c4Uq2cWJfuXVHVUhLH+yC99lkQDN7wanyXFeprywcE7onPWLiwzi4kiIyxru0NS
	1DxhRw9Q8s/8tgaUivKmgi6hr51GcRAJUhdq2g6iGkzhciYdo5XHaxplpFSI6FmhMT4xBQRS7znRI
	XCB0/SF27SrZBCj50WMJAzEQJQLHb9kRh6BnR4DiiEvPW5JsCrzNMyP+Oh4cTaclG+SycSepP0OzH
	pkoczdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsj-0000000FHGX-2To0;
	Tue, 16 Jun 2026 06:02:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMsh-0000000FHG2-2CLF
	for ath12k@lists.infradead.org;
	Tue, 16 Jun 2026 06:02:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G33qH01888042
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 06:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdJb7brSnFhjpTvyR+OLd7Yg5ivRRexl8ZC1EQrrZ0E=; b=LrfYmyTgxrj7bLJq
	jas1LP+CFm0MV3jZYXGoSi6+MxdalINmqu8/CSi1FupTMmaNhIwgmqFHwk4g2UFP
	T7GyoCyZjdhVvaKCSHBXv9DOGCrHAPgI+Ytdngc+6adoaoE6kqP0uT9TucFxcKwg
	csjPXNZjwaH67c3bwro9UJZtQEtktegXQtSdlKIU/a62zi/55YjNEQttPc8fStD2
	jj85pIMfui2/vB/wnhN/nRBidUpQ9Jpz+xkpurwGq9SXPVw9PunndEnB7UUJGCy0
	qzdjfxhh46clDuJoY+Ko28Rwo2ZBoiuqWmBofT2n/AsW3ALC/w8OKDLxmNGhymmx
	ud/JQQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k8pw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 06:02:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so6566824a91.1
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781589736; x=1782194536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdJb7brSnFhjpTvyR+OLd7Yg5ivRRexl8ZC1EQrrZ0E=;
        b=SE3v1l8VAYH87qC7bqp3KTibqkX6xc/hSglMQIUb7xzxjznsqOB0YMT/CCXpAoGhmO
         CTJTaTQ0SuU2FYXg6H8Yg/JucYDNGWNwvjhe/b7/Vud0+VwzBBLudO1cL6PvfckuvZMx
         D6PWH9Ry2MwnuxIgbgJYYc67mbKJAYi5zEuyMPVkPsusVV6UhVkGVpIRJ/m+LvUgXshj
         ZEuTQyR1z4JGAEz/UP43V31qFRsCieAjeG8UNz4fpYHQvfqqU7zXMM4Ck/esU/hhqpvE
         wc7biW7jFtYdq77CrK9oFl7LRgAAn8q59vZch+8YGPdMs7XwlxzXsoGQQSo/06/B8Qev
         9W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589736; x=1782194536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdJb7brSnFhjpTvyR+OLd7Yg5ivRRexl8ZC1EQrrZ0E=;
        b=pg9iJ7Tc7HbXHAXM6NRnaAxqpskVu9hy8d/FFszTgYo2/2vGQdtU6etqTW/4Rqiug9
         wFWrQmH1upHHqXOy3+hqx06VOT65pn5k3jiZ0rf1juBXMZiYRKrsQl5Z13JlnIvZAl/w
         e2vZ9zAWtE6iXm4L4IOVoqRiebyEg+DC+HyzJjMpXYPnMSktjIqkMsqvX5EDS0qSPJkE
         TB4fvnP1SLKvIFjRrzm3zG63PGw3L+hJPdT1Z0sOWpUtfmC0GQnvCcA4TT8AnqxnitZq
         gEw65o+y9ocNfJsCLY9k7nu9PL0EPAFq0uk13rBWuYeqUl20nk+xoffpEbG6YSAxXIca
         +eVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5mOedVDdmqSkZQR2oYEf9ti7TMGzjoA9LwhcK5aGhosLSDblNY0VAl67wm0/xpJR9LrW4eTc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKbQkSrNBwQngfIL7RnpEEgMawF6Z3UZuJ++0gZnf1O6MOQXeE
	zZkRRjHCIp3K3CEDD7bWzMYVNTIDgaONDvymnD1bUXE4USUzp2CuIGIo0B+uCpWpl0v4B28uW/7
	2W0lWJHqeUXe24mmypgqqQwqiShWprcpA4XMemybLPXZhGaliv/fvt/WZF+VTrnEK
X-Gm-Gg: Acq92OEVqVjeJlBEWeJZ4cEyICFgpIyG5bQNjbUJUQQo9PD73ydHgDEDhFxXkLAXDkz
	UbG9DP4rL3WNl0tcM2Tek7+lRRuauOxXoS97CuFuKMx7cSL9acJNOQd65yAYecq6MrH/84IK5Tq
	2/z/z/jJ8MtX5gtWYMVQuJWLXe89YaOP8V0lK2X4EPNoBLR5iTH5mipd2OQu/vhr3B+VrSzhTs/
	s3TQw601koAiIWR4BACpIc5gLByCu2k6tdjlUciJwxWcZV8er+QRjHg955/A90cAmsP6fWqONcu
	KRq0CqxxBrobKDq8gQoX7CiDJ256rM4SU7io2WZmTa0LniWWpAdqKsN/uOU4+8X7hQarDTes494
	SD9dvV9MET5O90+E+klXThdmvrXfIp9rK6ApbAgVJ0d1XGxWrXFz85lg=
X-Received: by 2002:a17:90b:5148:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37a037e4b2amr18459292a91.19.1781589735671;
        Mon, 15 Jun 2026 23:02:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5148:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37a037e4b2amr18459242a91.19.1781589735167;
        Mon, 15 Jun 2026 23:02:15 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e7e217c0sm9196245a91.2.2026.06.15.23.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:02:14 -0700 (PDT)
Message-ID: <fd87f749-b930-4147-8948-c412447a11c6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:32:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: correct monitor destination ring
 size
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260616040653.3985702-1-aaradhana.sahu@oss.qualcomm.com>
 <9ed73ed4-3c52-4841-821f-0fae12f452dc@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <9ed73ed4-3c52-4841-821f-0fae12f452dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1NyBTYWx0ZWRfX2duozXGAXRdQ
 WqSb0G3FkvvO+oXrLTbyMQfGfTtqBucQO/jt/8PcrTpDKsJ1bsjHjjKk+bT9Eag2CVGbwE0EPit
 BEMoot67gUmpR60Y6t9fhg+vzRd0VrxgnNOAT1zul8UND1ilw0XCFTNFy+t7SgVMzLJRe9aOR2y
 g/EITXKTUWggB5ss4VcZV4Gn24PZO2lcrBz1DN99V7fFjpTMbRaGdXNUHaW9HwPPmqw6Go38Tug
 R7K4Kq0SFvsQAdzjySnc+f3cKICo0pj8MHgzPERwoeawpKrZCHbm0rx5RUQlcHrHRE5cWKtlaVM
 Vpb7FBGZx83XqpleBgHtqT4tPYNNQ62btkwCm9ISTyin2nTEWiH5kzxscUowA1bH90ebB0Ad4UT
 QZXoAECGgX/SUSfUju6OTFCt49v3KGhjXTKf8DFexNMyYrEa/YLOFu1loId84plT0MZE0Rlyq5g
 NF7CLg9mM7uJqmrRv1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1NyBTYWx0ZWRfXz8RuFtBPRFMy
 eHNdip+njJgvM+ShU4yb84AATulXG/+15y4aNWWrSlJeza0ANmRfiJvkRV32bQkZdQlI69HHOTv
 LYsux2lJ1ElSajTSjcFVhnUcHIm/WdU=
X-Proofpoint-ORIG-GUID: mwPsXREAQNMpJXxDmjyPm8MMwbS_RXHp
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a30e6fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ByWTzcf8-CCAcaIRRJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: mwPsXREAQNMpJXxDmjyPm8MMwbS_RXHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230239_568234_BC366C73 
X-CRM114-Status: GOOD (  13.58  )
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



On 6/16/2026 11:21 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 6/16/2026 9:36 AM, Aaradhana Sahu wrote:
>> The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
>> which is a typo. The intended value is 8192, consistent with all other ring
>> sizes in the table being powers of two.
>>
>> Correct the monitor destination ring size to 8192.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> fixes tag?
> 

Sure, will add fixes tag and send next version.

> The rest LGTM
> 
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index 742d4fd1b598..b488bd8fea9a 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -49,7 +49,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>>           .dp_params = {
>>               .tx_comp_ring_size = 32768,
>>               .rxdma_monitor_buf_ring_size = 4096,
>> -            .rxdma_monitor_dst_ring_size = 8092,
>> +            .rxdma_monitor_dst_ring_size = 8192,
>>               .num_pool_tx_desc = 32768,
>>               .rx_desc_count = 12288,
>>           },
>>
>> base-commit: 83f028be15fe071efbee8e27837538d6cca77e87


