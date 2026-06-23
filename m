Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C2CD4F26
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 06:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmbqmGjzdyAIoxI1ZpFVf2sMOa8fXd/RGWscJvCHmNE=; b=M2GiCVPrp0PBEfMXZ59EXFHnND
	fUyHxIlWuPXN91jlBb+yBQKG3W0Kx8fTm7K8wrY2YK/2ZM3YPcd10BDz5ouvSVxXjnKtWCLgx9x8o
	afj3PG8ZEPcTTeEE4O0uHtNv3IJ1obwiD9vjbyMr9vUwm3YICFoQhsmptxPfXJhmHZckfEMlVEKUD
	JiRHRwGbmSnS0Y53O4Pe8w9oTiLr8X2AL0HGkhakK5cgRJe3AKPAAKmaxPbSZmoVlrxgBdVVpE1O3
	cA1YxzSdlvDFfukPqPXt7RqPHuD9NwyJjKZ69sVQ2tHIljp3Nr1kMMLa68QuL7E1BOZ8K3KmKBrCm
	WaUh20yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuyc-00000005mnb-07KQ;
	Tue, 23 Jun 2026 06:51:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuyZ-00000005mnB-1E7B
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 06:51:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cmYS1628612
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 06:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmbqmGjzdyAIoxI1ZpFVf2sMOa8fXd/RGWscJvCHmNE=; b=Z73kFrD63B3QFF84
	sdFlaw/D5DZpOWbf2RFFC9LTxhbleRF4xcnl9YJNM8tXdHCqhO31W1xeh2qVzWLh
	pPMjjps8N6gCGYToD8Asfzo/JSQxEmq3Wiu+tZSYGizneINe3t7gt3CN0fDvOYXs
	47rQk1a609YOzPoiOyt3lz3HCjZB/kJYNgBD8A4ZEW/d/MMAHt/NX8B7p8Oaxwi8
	rQchkGGBSS1GfZ4AjkuBg7fiCotrHKvrFTFO/y50AaxWEePYPQj43NQ9+y++Ikzr
	n0oX3rh3HovciW3EVlzIbl297ucTyoEiyINKyRhGjcX7t9lIhBm2fKYhov2kBslO
	tFh/ng==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhv0bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 06:51:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428419982eso4934741b3a.3
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782197473; x=1782802273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmbqmGjzdyAIoxI1ZpFVf2sMOa8fXd/RGWscJvCHmNE=;
        b=hYbRev6yw23Yx03fDagzGCY5Jra1ypB1nBxw2ju0ZyUMkj9RHJEVq+OsSRRYREpU9+
         gzdheiA/rtAk+Jza/EOxvZSWn6zfskWcAAI0JlOtHN3ZhA9AiD1qETzxnxjfM0Yp1otY
         ies4QMj8/yV+PJtzMnnFCWHrQk8egaEIZSEDIQGCQbRyvMyV2J3afAAmqnFmPjcpJ+B+
         qUeH/pCQoEg5Loj+I8v2m9SATTCL99FgyWo+oraeMh9htoWbpNhCYZM8c2ZBAMjRffUM
         RlWcfPNj7Bs8uwzCVECVYYFnw1MReuJyVCk4zTS8tR4irz/Kj+OsMLZey4sKKpCiBZT+
         Ik4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782197473; x=1782802273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmbqmGjzdyAIoxI1ZpFVf2sMOa8fXd/RGWscJvCHmNE=;
        b=KnJz20zONab0Hqd/hzJ0rgKdhgCm7M4YTWfxXPkmz/qKa0Jdffkz5qZ1lGSaBNela5
         ZKKGX1wF/EV2Mz915+b07cPVEDuZSxiJ19HBSJOYhAfUT89Lkan0dyHayfERWhmWodXD
         dJam5B2FaQqNGCB/9I7/sT7qY39gKj6uCDd0TcbdqYbCjPuWwz7sOkBaVKdtLFQE+cDi
         enZ0OrXALm7dx9nwfB3XEWJ8petgfOgfNfe4JHqqYezHvJMutweBxpAtwSmuzB+lGA/p
         nsOXelVzMmJsXQreDw7UQVBT2qKp8bQnrDBDOXm2/SAPhxtPjjurCFMuWseU56oHZHwh
         fluA==
X-Forwarded-Encrypted: i=1; AFNElJ+OVWuBkEOok7UMVvCfalX97QeyG6YEoR48z381h0bU+s5pBG9S3pMLI8FTPMYvDwwjpe+/1FQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+VfhvkhnWh3nAKqo5W/vWyw3ZMXZP1wEyMGgzm7kMNmSBt4Wk
	WuNBnQIWMvhPErYyLBy0MssbFstKKcHIWP1G4vZJ4SZbqv0pDyW5ukoEMK1HDktedU/B0my4GvK
	Z0OwOhN9WzOq7pJJ6oLbuIT4foc13GpGWA53r54964U86rt8Jtn/DHqZjT3kgVJYu
X-Gm-Gg: AfdE7clpekhIxjyZ2xi/ZcvnAPdGqg0QQ8PzF8a1Xss9B1Uzd6HGI99LUUVetigRisE
	lQfjvB0q3R37Knh9AKIOtNvYjBlzfW4+XM/juOi5A/My5Yz+iRwlur2QQrRwNFBYU3z26FZxIx0
	1WexE6VUHB+TtSZfNQXxwVGcTik+ZFnf8+3JQwRBirJiLb/OrhAFtv5z8bO7f2/p1QCOVjagyr8
	sBOXykt3VtOrGqs5DqUy+NgwQwY8Z+dhj5ao6yI+fq7FLorn+7n2DNFAeYSFhPPgSZcOhYFYGFd
	C6JVGF8ADIUcAvbyY47+agYXJ9HXMfmk4Zd7/z5oDahoMBPPwqn5PzoQmhxGnwHSYYJMrTGwBzd
	iyUmTo4Kz0gD9/1oX6CEzTRg8GL4FqPMJNDRpXdLFm0L9j3bibOQK
X-Received: by 2002:a05:6a00:4f88:b0:842:422b:259f with SMTP id d2e1a72fcca58-84597097a75mr1497131b3a.10.1782197473419;
        Mon, 22 Jun 2026 23:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f88:b0:842:422b:259f with SMTP id d2e1a72fcca58-84597097a75mr1497106b3a.10.1782197472975;
        Mon, 22 Jun 2026 23:51:12 -0700 (PDT)
Received: from [10.152.207.30] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ef4c09sm10765352b3a.61.2026.06.22.23.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:51:12 -0700 (PDT)
Message-ID: <fd1adff1-e9ad-44e9-a94f-f9780f4a22c7@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:21:08 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1MyBTYWx0ZWRfX71IAiyziFNJr
 bfnrY0wgpO7h68ISV9Qs9Oxcy0Js27PX9FS04V3VrUs5yTVTfJHaOkv1sdodQ0cfd5IuBLFp7io
 EWzkQAVX1jBh5zvC/LOOZ7sFFCZBYEs=
X-Proofpoint-ORIG-GUID: CUcn9xAwMqD_LaKjxrs9IBIhjw4UN35E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1MyBTYWx0ZWRfX03DVsL60aREI
 Zg21YdWbSacoYhQHpzkLO9Wz7gjst/E+8Ww8D+u+nBRV+/u9uZNysWSOHw50/AU36WjSG9r29IW
 99ohnmNhMZr7cf28+/mgIas0P9BZRlwk9s5YmR7PuPL70VTL4bJgyGJSGOGzG92IgaafEy5CPC1
 FbHEM7nBerenldL2P/AufNE+YNDyrzoxtHYiveYLY7LyKR9ZZ8ILC+qXxzCiUmb2Eq9TD/bdS7b
 0pvVBgB/IAabXg5O6UaHRzhOd2lnIfOWlx9UYXyjLO5PNgZx83DGtzUnzq7t5c38Qlqtz6p8E1o
 gGsfnwXBL5veIbiQPOcQHZviEY7wWYca7I8rmt9WGPzmUpVUP4SP9nOIfm5iTFu4vEygmsPV4xe
 dp1A0cn8Uv8AscMiXlXuawTPbUyhwyNv/Bwy9b3Hvv3JelqSRkAmdm4zbCDUKTOSf3zgWxGqjSP
 61NJEszreBlS6vLrbjA==
X-Proofpoint-GUID: CUcn9xAwMqD_LaKjxrs9IBIhjw4UN35E
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3a2ce2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YF2iN5IkIrNdiBgypvAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_235115_361388_F7DF03CC 
X-CRM114-Status: GOOD (  18.08  )
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
[snip]


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
Addressed the comments in v2

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
Addressed these in v2.

[snip]
> 
> 
> 
> -- 
> Ramesh



