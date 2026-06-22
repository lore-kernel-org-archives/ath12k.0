Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E891CD98F6
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 03:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJa1DnynoCbIJLjtDNqzEZsjsyIjhRDxhun7EqvtLrs=; b=C5oirkUqV9/lG1hRrjLczUx6OZ
	Ic8sNHnQZdstWUvdpinFt6QCDe1aRA1krSyRjrD1xjKi7lNsJpVwFlUS6LNXr7xYkS7mZtTDjjUDM
	bDtU2hJrpNDuXVMvfhBiUuGk9kLJ8i6DzP8tVvvip00eIiHwewNPIGbeGNgZbL09qNmpLKgconUAv
	MxVkTXMXmjTzdtf5yLpEX4m+qNuwdSQCKCfuZ7JXYY6YykVUemj38T5C6pGPxSsxQHKrgOrkALMfK
	+U/cJd0Ecp6fnUbrzgX5CCYxWMmdji3PkyiWiE+9KQhT4Lp18vvwQ5VSvohgZZkbu/8/TD0ZlA8z8
	OUXfSElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVOO-00000004LaR-3YtL;
	Mon, 22 Jun 2026 03:32:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVOM-00000004La6-0Ubn
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 03:32:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LNT5AD3645936
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 03:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJa1DnynoCbIJLjtDNqzEZsjsyIjhRDxhun7EqvtLrs=; b=ZscfBkx8tfb0z4l4
	+xApX2qVJQfeZOrd2NTR0mCsmLxQ5H82n9GsVYzPw3AxbkIqrh875UNhmzMCyrxX
	HYCtH9vxIPCl7x5S2TuT/1i6jYsHoSQmnSFvxmoR5LOtNako80SvbFQQWPsKp+gi
	3cKayy1R/W3FUW8M1m9CYeMYTkh6PXoxQzD2LEqHDAEO1WZT3mhBGmAkDxzxMCBz
	k+vKdAgJaHMIQ5gBp/w4N1FZ/+GNQHvUoSQYEhN4o5W6HUn4wpKNzqo9yjdHzQIe
	F6nCXGtRAMppthpMj0WDCppy+wcX0xps+x1xtKYp0C10CHbbHjeSv2v1aQdvtuSb
	aGNc6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexvmr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 03:32:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so5361158a12.1
        for <ath12k@lists.infradead.org>; Sun, 21 Jun 2026 20:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782099127; x=1782703927; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJa1DnynoCbIJLjtDNqzEZsjsyIjhRDxhun7EqvtLrs=;
        b=eSfcelWWxaGC4cVKEajsF9KZQZ58qjRhCidAyo3JAph1m8Q6thWPtl8hPgr+6v+wfZ
         oTRUNu1UVHCKIur9aEGlLYWYxyF7wSAp1W+fMGAbPmJRIt6oxM27WmTGI/9GYKKta+LL
         vPD/nOkWJk/7Qm6NEs6i6e8U+lUX4m1xbFHcmFTb684lH08OIuydc2zqxZh/l66hsXuP
         2oLHcL0tuPf/kK8t96k6A9F1NXA2WTaWKnIitiEnut8WcYItNU/LSgtk9Uywz7hNEVwO
         9qbD3jz7azNbhAQK52qoV9o0/gUN2hFadxrneUQLQEOT7Q9i74RLD4dBRkWGbx+c/fTk
         OMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782099127; x=1782703927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJa1DnynoCbIJLjtDNqzEZsjsyIjhRDxhun7EqvtLrs=;
        b=DMvHJUg+AIclW6u/d8jBM5gm9hSzAvZDtrghpB/FoM2UhYRlLO08JEbVS90oPRyVgU
         YMqgEPiH5204bTYjZfsLXlLC7Ws1Po0xaAw8R430PJCneeCKhmey7f5JcIAuekQXbNjr
         VeCSKkRDA84b4sKPsvAW0ux+tsdICI2cFjI7Lr1lqIFBY7FY5osCErfWLUKQ1V97epGX
         TAdrEYKviXM6UZ5DwZZ09mSm5qPQCpqoT4O7ySIrlLeXtPwK4cK7tebUBOsUueg3EXZB
         u/xdiJfd9ttZ5Fw1OMwCgGLNA+tfvLN0Y4MBOy1/bhw+3MowGpxsGCot5TC15pMSRHHl
         rHew==
X-Forwarded-Encrypted: i=1; AFNElJ/Px7jsppGvAlT6ty6C9UqQ1lkEm7Gc5wapLP/edBThwPahAREpXWQ1pJbIsV7ykL4Vzk7zXLI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy7xMtKH4FS5SuENsLf5zIwj0RWF1PcTG9B4VoelqGsYcgZDZa
	sdPloFuJQ+SCGw1x8JvUWeB+dm1e1iyQwTEGLUe+RABOI5xpWQE0cDw9dxyMzncjw0F5fFnidTg
	mh+tF69YD+OgyRK8zsdJn/Un++7GHbF04YR8zVeJuhoveUMwtYvpZaIP7ZZbnkz6mdvLjyUyU
X-Gm-Gg: AfdE7cniFZN1tJ+bDoIrydZuZ8jTFwZvD19jgoM3DJhu1YHyWVDLr+OgSoCa5yzOVGj
	TrQaGs0dv01CMo3yW4AIydz6WdYwsC088DSfs7r0BHB5fsxw3VmryCmhhH3xuVFixo7714pvwEQ
	D8m7d5EfxV8vLwv3UAdulWC6MkMatYRwuR/bTlnmGPnpfN/t89MOEejSn8MxRLrxS+81gsvlFeu
	AQlndwIJmCs+yp6KtaTWDm+ESsC+OLjg1juMjxua6L2MUztnO2nkPmdoyPqUsEVvYQHKREsX7/Y
	t+J1snpvvCB8Bg7eDAqAwQvpByOepARnCvtytspsxe/sWjb8+twRTE7KMkeaKxZz3BzetkOVu1X
	8doi/WhEUtDnCHkj/5Ez27PTKUNQxmMLYdUudwwVuNDg/O6vG7LyJ
X-Received: by 2002:a05:6300:220a:b0:398:a33a:71c9 with SMTP id adf61e73a8af0-3bb6c9cbbe1mr13694475637.43.1782099127414;
        Sun, 21 Jun 2026 20:32:07 -0700 (PDT)
X-Received: by 2002:a05:6300:220a:b0:398:a33a:71c9 with SMTP id adf61e73a8af0-3bb6c9cbbe1mr13694446637.43.1782099126957;
        Sun, 21 Jun 2026 20:32:06 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.223.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8ee89sm5551794b3a.20.2026.06.21.20.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 20:32:06 -0700 (PDT)
Message-ID: <630fbc17-b8d9-40cd-a151-6af8fd9ed979@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 09:02:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>
References: <20260619-ieee_link_id-v1-1-36cf573cb81d@oss.qualcomm.com>
 <c5feff91-9303-492c-a031-1b2a1e7f3b7c@oss.qualcomm.com>
Content-Language: en-US
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
In-Reply-To: <c5feff91-9303-492c-a031-1b2a1e7f3b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDAzMCBTYWx0ZWRfX1a3ffJNgTk/R
 4LoEKQtNtRkEuSiLxJYskWwnIclfbyPErqUokI2TwNxZpImaczNU+ByL1Nc7qUPE2D26ypWTcfk
 IQ4imtTdzeW54MmOmruO8rzf9Bx6Hx2n9XPhz5h7rn07sieIFqkajRttrcyORnE/iQzyT1SH9R8
 vMO2VOoD2IliyxR7vjaTXe0ZQkDjt+XfUMxfk6dPwnHhc4dJG0bv9b3V5sJdFOPzsOICeawBI+A
 14M+6ZDMhUY6OpGN3xIOwRZGLvpV6ErMFE4hByMGiu9IUBBd5imYXvMYC2q8nv5weZs8S9J1hiG
 cbckRYpMBJ7NyzfAXU+0viJHf7cDoMJihy2BGRyLYmhU8QFy/t667qzBqpC4kT22a7hJdDPuYa6
 +R88aBkZAfyTgtwmQHlJ/MaxA04597wF/j5OSQX4ouBBBtuM9le9a9/lgaaYFNWrmU2iFFSbS9X
 +aNN+x2LhSwq6urKgGA==
X-Proofpoint-ORIG-GUID: bF-VZEfJKOV48pW5TcILYWkNkRxJVh9k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDAzMCBTYWx0ZWRfX1TPI/sCj4oqG
 D/FrtodlDnVTefXPTnsGpTT0yJy9BtN4ijEHti6K6R0v5nu7OJcdnXpb8gApSq1xEfEMbG1zUHX
 oZ03RFV+zd1oISP4yGY/UttgV6BadvI=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a38acb8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BF6w7GvFs2xbIyFlm1owPA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b4I1gYfj5rPnem_N0rEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bF-VZEfJKOV48pW5TcILYWkNkRxJVh9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_203210_313345_1799F689 
X-CRM114-Status: GOOD (  20.56  )
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



On 6/19/2026 11:58 PM, Rameshkumar Sundaram wrote:
> On 6/19/2026 11:25 AM, Manish Dharanenthiran wrote:
>> Firmware builds the AP MLD partner profile from the hw_link_id passed in
>> the vdev start parameters. However, hw_link_id is not always the same as
>> the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
>> and not per pdev.
>>
>> This matters in mixed MLO and SLO setups. For example:
>>
>>    MLD 1 - 5 GHz + 6 GHz (2-link MLO): ieee_link_id 0 and 1
>>    MLD 2 - 6 GHz only    (1-link SLO): ieee_link_id 0
>>    MLD 3 - 5 GHz only    (1-link SLO): ieee_link_id 0
>>
>> The same physical 6 GHz radio can use ieee_link_id 1 for one
>> MLD and ieee_link_id 0 for another. Pass the correct ieee_link_id to
>> firmware so it can build accurate per-STA profile elements.
>>
>> Add ieee_link_id to wmi_vdev_start_mlo_params for the self link and to
>> wmi_partner_link_info for each partner link. Populate these fields in
>> ath12k_mac_mlo_get_vdev_args() from the corresponding vdev link_id
>> before encoding the WMI command.
>>
>> Introduce two new flags in ML params to indicate to firmware when
>> the new fields are valid:
>>
>>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID         BIT(18) for the 
>> self link
>>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER BIT(19) for partner 
>> links
>>
>> Firmware parses ieee_link_id only when the matching flag is set.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Hari Naraayana Desikan Kannan 
>> <hari.kannan@oss.qualcomm.com>
>> Signed-off-by: Hari Naraayana Desikan Kannan 
>> <hari.kannan@oss.qualcomm.com>
>> Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
>> Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
>> Signed-off-by: Manish Dharanenthiran 
>> <manish.dharanenthiran@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c |  3 +++
>>   drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++++++++++++++ 
>> +------------
>>   drivers/net/wireless/ath/ath12k/wmi.h |  7 +++++++
>>   3 files changed, 30 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index af354bef5c0d..773ecd6da8e5 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -11253,6 +11253,8 @@ ath12k_mac_mlo_get_vdev_args(struct 
>> ath12k_link_vif *arvif,
>>       ml_arg->assoc_link = arvif->is_sta_assoc_link;
>> +    ml_arg->ieee_link_id = arvif->link_id;
>> +
>>       partner_info = ml_arg->partner_info;
>>       links = ahvif->links_map;
>> @@ -11276,6 +11278,7 @@ ath12k_mac_mlo_get_vdev_args(struct 
>> ath12k_link_vif *arvif,
>>           partner_info->vdev_id = arvif_p->vdev_id;
>>           partner_info->hw_link_id = arvif_p->ar->pdev->hw_link_id;
>> +        partner_info->ieee_link_id = arvif_p->link_id;
>>           ether_addr_copy(partner_info->addr, link_conf->addr);
>>           ml_arg->num_partner_links++;
>>           partner_info++;
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/ 
>> wireless/ath/ath12k/wmi.c
>> index 84a31b953db8..a0e8b5678ae3 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>> @@ -1228,10 +1228,14 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, 
>> struct wmi_vdev_start_req_arg *arg,
>>                      le32_encode_bits(arg->ml.mcast_link,
>>                               ATH12K_WMI_FLAG_MLO_MCAST_VDEV) |
>>                      le32_encode_bits(arg->ml.link_add,
>> -                            ATH12K_WMI_FLAG_MLO_LINK_ADD);
>> +                            ATH12K_WMI_FLAG_MLO_LINK_ADD) |
>> +                   cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID);
>> -        ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start ml flags 
>> 0x%x\n",
>> -               arg->vdev_id, ml_params->flags);
>> +        ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
>> +
>> +        ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start link_id %d 
>> ml flags 0x%x\n",
> 
> %u for vdev and link_id ?
> Also this part of change is not describe in commit text.
> 
>> +               arg->vdev_id, arg->ml.ieee_link_id,
>> +               le32_to_cpu(ml_params->flags));
>>           ptr += sizeof(*ml_params);
>> @@ -1244,19 +1248,23 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, 
>> struct wmi_vdev_start_req_arg *arg,
>>           partner_info = ptr;
>>           for (i = 0; i < arg->ml.num_partner_links; i++) {
>> +            struct wmi_ml_partner_info *pinfo = &arg- 
>> >ml.partner_info[i];
>> +
>>               partner_info->tlv_header =
>>                   ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PARTNER_LINK_PARAMS,
>>                                  sizeof(*partner_info));
>> -            partner_info->vdev_id =
>> -                cpu_to_le32(arg->ml.partner_info[i].vdev_id);
>> -            partner_info->hw_link_id =
>> -                cpu_to_le32(arg->ml.partner_info[i].hw_link_id);
>> +            partner_info->vdev_id = cpu_to_le32(pinfo->vdev_id);
>> +            partner_info->hw_link_id = cpu_to_le32(pinfo->hw_link_id);
>>               ether_addr_copy(partner_info->vdev_addr.addr,
>> -                    arg->ml.partner_info[i].addr);
>> -
>> -            ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d 
>> hw_link_id %d macaddr%pM\n",
>> -                   partner_info->vdev_id, partner_info->hw_link_id,
>> -                   partner_info->vdev_addr.addr);
>> +                    pinfo->addr);
>> +            partner_info->flags =
>> +                
>> cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER);
>> +            partner_info->ieee_link_id = cpu_to_le32(pinfo- 
>> >ieee_link_id);
>> +
>> +            ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d 
>> hw_link_id %d macaddr %pM link_id %d ml flags 0x%x\n",
> 
> %u for vdev_id, hw_link_id  and ieee_link_id ?
> 

Agree. But, there is a mixed usage of %d & %u for both vdev and link_id 
in this file. Will address along with other comments, if any.

[snip]


> 
> -- 
> Ramesh

Regards
Manish Dharanenthiran

