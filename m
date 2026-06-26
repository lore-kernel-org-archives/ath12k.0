Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DBACDE010
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 04:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4x12dkjL0wb12q5vpEWaaoCWW/6hMb2TMPQtPP0YbY=; b=oqhVbI84WXonWKEntCCejFIid1
	tFOH19GORlMep0O7tsLGvY7CodA6DL/C4F/WnH7FuKie1GTsQ+0Aqhqj59rjmOvb8g/j1scs9B94T
	Xzh/E8GWuXK/d5fUa8xRnBdKdy4Fs6aISu1Vm5GhQ8dinX+LA7oknXXbGqylLtHbYr1B4FiKYGq+5
	LwQCUxGwFqWNofbmRmPQovdCG+/VDjC48JoA43ATD8vJkNHVGVIGnrooxyjvf47/oXg/EuGDkUAWC
	EquufDwdZ5+k3n0npEE2wBxl1uCM5SM4UfAdbIbx03pu9Ncp91/6jQi1r93MLCo/3pXffJWEh5urO
	+08EU8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcyfE-0000000AUen-2hlu;
	Fri, 26 Jun 2026 04:59:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcyfB-0000000AUeR-3dTm
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 04:59:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ihdf003500
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 04:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4x12dkjL0wb12q5vpEWaaoCWW/6hMb2TMPQtPP0YbY=; b=cF4w6Nfe072Ul/bv
	QvQlJn12xq9nCoXutUtMNTp7NlOEVZzJMt5kesahR2PsmwD1R2WHohVT5T7YhFL/
	/PeZBX0gCyeGiHY29pak5/Pfuj+NsulAhlKuW/vpIPwS5PeFaDqz0ttD2JX0P5Yd
	9dOsHZFN6vt7SwraMAk1w7wmj2ILOgefyKIoJViDjfEPWFhB8CamrcDXAmSJ3TVw
	LCBouEzvWV1KNkskznBsLPTINyNO/xUSls5MjHASx7gWl/3ILSFjeSsRXctJvn/y
	/5e/l/bvL2Jp9TyXD0xFLWKf5IwEumAhO9eELTaVA1zibP6TEU0v40OICX4aJvz7
	WCvM2g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8q9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 04:59:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1370417c0bfso681883c88.0
        for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 21:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782449975; x=1783054775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4x12dkjL0wb12q5vpEWaaoCWW/6hMb2TMPQtPP0YbY=;
        b=SIp8qIoQ9zHrZ6TIWamRzyT+MTOrZH/w6y4Eft3QTHaAx0OKbksA7ri3tUb1Cawgx6
         YlGdzC+eO2F1FDFzD4CTzs/wXc8/XokpV8eUrppLbI9OO6k2YM18c7Ko/UliWMXHdJEX
         r2B8isa3xp30/UTHC0SbRV8eABBoFd4l0u9HteQfEspPzG207r/CNFfVsDhmVg2bzWPN
         qQl17qZVa2a5DNQwa9mfOkWAz7RLY7CuNDwFwtVi7NQlJ6c4Ot71FcgLbvev+mjH62fF
         8Jplvq/UUXlAPc4yjqgw3712gqYKGpSI4OqmTT143Y0HHva2z1X/WD18hJ4YIx2FhLhP
         b+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782449975; x=1783054775;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4x12dkjL0wb12q5vpEWaaoCWW/6hMb2TMPQtPP0YbY=;
        b=jtQJ18tDKVgocwj2iU+VqAHO0Nh4MLjXMNMCwaW5xoOvbEpPnr8fXXYpYFaWiDnuw5
         qxEF6gtbbcjTrFxjt5iVapO01QM8WP4uFq/zur1MY3whHoh/geXS07XfjcdiNXiFObwR
         uduOeCVSiZstpzE+Tl2QKMutTk0Ukj50EnBHDZiXNTMPaTz5Qhf/E6VmXsNBTllVU8pp
         BOZiTYKipFUzVguwv3qKu0DMbZsQiBwMc1jkRMsM7gZRIUJPRHI+k8xOh2t2DnUImjt6
         sOR2e6KCwL7pil66jJDMEOHX5cjC4Bxv4sSDEw4rKwVLqtKlz1+MUePdhsGsUNH6f0hq
         z9tg==
X-Forwarded-Encrypted: i=1; AFNElJ96x0z8rSinxAxOaesCNHK13jbH6YehxR+2baN4XDspQ2XmNf5UEFMFrDCdH5eN9SZYZ1X4Lac=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVnIrKyARcbKz6bgeig2zdf4INNtMhAOLTsYjztQFN+ERH/lqx
	NMRHb4mNbBfj787D25mcIbRS5BviPde52d6sHF7Iru6AmzGvk859EKpfjDYA1OCyLtFRpfRYAAT
	yGQAN1rPsp5C72NRm+WR1uP26YlQSHSId8Bsknhrf0iUHtcNHUJDpuc2K2xyhqTWPATtVugTx
X-Gm-Gg: AfdE7clUBWPg1LqW+qIKjaYVBBbIveAdGQrNpw6N9rXimPDuzv4/HuBdoaU7MGqFYxW
	FX3av6Sl6HeOE2TJUBK5d9Ky70I5XZwbDH3hi5FU8N7xmEecayOSXrEvtPkTrEXkJWeFRabf7r9
	U/HDY57RomenrezR7c6LXMTom+9s/X09j9mXRLXdwpKO75Dn19nZl7ibhXanRNjC6BVz4v/P3Hl
	GQxXgWZa9BYnSQX+F1OO6or0V0gHgPmLuNtpbXRAllAo0Pajabht2x5oiErDs4/gTLw9JoyG/Lu
	3IcELeMJloVjea2SuZ6s+ldcyHmFH8rhGfeluka5/zaXuoTj9/qBqeiEPTFJxe/lHbKbgfqDcto
	zyy+yeMI53e6nAdyiggbuhYStPkAuOduyEYiDCVLJHiuc/HcpkqirSEQ=
X-Received: by 2002:a05:7022:f9b:b0:139:85c2:d7bc with SMTP id a92af1059eb24-139c3c1f8a7mr11542043c88.6.1782449974692;
        Thu, 25 Jun 2026 21:59:34 -0700 (PDT)
X-Received: by 2002:a05:7022:f9b:b0:139:85c2:d7bc with SMTP id a92af1059eb24-139c3c1f8a7mr11542022c88.6.1782449974098;
        Thu, 25 Jun 2026 21:59:34 -0700 (PDT)
Received: from [10.119.106.30] ([106.192.174.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6acf9sm13872852c88.6.2026.06.25.21.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 21:59:33 -0700 (PDT)
Message-ID: <6ff22e43-5f25-4568-8e81-4d29a8e7e693@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 10:29:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid setting 320MHz support on
 non 6GHz band
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623151613.72113-1-nico.escande@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623151613.72113-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4iOcXKFgDS7zol0y0WGcUjB9i50YfWsr
X-Proofpoint-ORIG-GUID: 4iOcXKFgDS7zol0y0WGcUjB9i50YfWsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzNiBTYWx0ZWRfX6fFybcnclSpx
 GW7Tf2I+PlNit5HT+vgDpZu1N/cvsDsObz0o7qWULDp3a25YDlgUT2tHuy2wVbhTsHgTpmR5upE
 4OcBSmL0W7H5EvmmUu7tCCbRHdle8N887y9BgsFimU98lh+SUzrqUj13rexLi3snQ+yUvy4MOth
 86AuVZqr1VF7/9GYe14s4RIOCH4S8GGgj/Q4bY4Ga/njbA7s1jzGa5vR6hxG0baILx54NbXWqO9
 cjp4ItuB3ww4j7IcpMhsY/F+gV3qHnKRMlwPRcWsdEV2GggxVvgRj4Cet/k3IJPOebkOkH3cTdi
 ID72kavc06MVbd8pB8IVAjGuMt9KutEsWjs1lZcQOH3ePu/OcGcgG9njYwZqJhQH5KGg2apSxEV
 bOgpjsX+05jWkf0GJvsW1TJcMqkhWj2PSKs589HdqCyL0sxuyLaeqSaUYkQVFATXWrmWDT3rwfI
 +UjQ9xDI2fQskNL62mA==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e0737 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=VBIsxqwor4dG7Km95D8Svg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WkRSpPLlV-rx6YGWqRUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzNiBTYWx0ZWRfX8tA45wTDlejC
 VUygCJr0iwBUH/G7W1dXBUdfaujFHVVp/JAD3izgv0Jz3FRyqCoDP5w7o8CtXyWCozlU0ScAvkc
 Cbbi7sReT8VZjHb1bwzECYNIsOaXSm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_215938_093855_2C91F1F2 
X-CRM114-Status: GOOD (  13.98  )
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

On 6/23/2026 8:46 PM, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> related features on the 5GHz band while it should not:
> 
>      Wiphy phy1
>      [...]
>          Band 2:
>      [...]
>              EHT Iftypes: managed
>      [...]
>                  EHT PHY Capabilities: (0xe2ffdbe018778000):
>                      320MHz in 6GHz Supported
>      [...]
>                      Beamformee SS (320MHz): 7
>      [...]
>                      Number Of Sounding Dimensions (320MHz): 3
>      [...]
>                  EHT MCS/NSS: (0x22222222222222222200000000):
> 
> This is also reflected in the beacons sent by a mesh interface started on
> that band. They erroneously advertise 320MHz support too.
> 
> This should not happen as IEEE Std 802.11-2024, subclause 9.4.2.323.3 says
> we should not set the 320MHz related fields when not operating on a 6GHz
> band. For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
> 
>    "Reserved if the EHT Capabilities element is indicating capabilities for
>     the 2.4 GHz or 5 GHz bands."
> 
> Fix this by clearing the related bits when converting from WMI eht phy
> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

