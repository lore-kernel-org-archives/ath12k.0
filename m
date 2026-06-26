Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7E4CDE008
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMVum4Llswm97WxJGwBAdPE2BDgwQjioAQCyEqQctP8=; b=pFHVQfLH/Y3uBF9n7TJfQt63ah
	IuHI4RvVGNUJGVChgJeCqbthaEGrTai85PZEBK6BdZaJvoi2LPalrm2cwjnBSr89wnZvlgZwCBRIG
	i5+bM0ZfV7ShGuhdIXYgeuldrWGrSOJk011L6YdvmdE5mpLATeiPH4bw4VtF5hwSB4MHfU++uHiqe
	04vOWGm6oW+vAhKzWMVl0yzy5Jwf9kLTVTIISBBg1pBEiQBSHJEcU4C6d4IgRXcu2nACo3Ivbtrty
	+byu6YzGL/nM0Fy5yvtbz8dEzPrji9hrrWyZito1eLDstKqcwrZ9LcXKSqr0HRHQ5x0DmgI0tAHif
	mLapiLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Do-0000000Ah2e-0c8l;
	Fri, 26 Jun 2026 07:43:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Dk-0000000Ah2F-3j1V
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 07:43:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6WHPa512060
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 07:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMVum4Llswm97WxJGwBAdPE2BDgwQjioAQCyEqQctP8=; b=XFXeJxeuHmC2BvJ7
	5Ua1Azd92w4o42fV6cdtMUpozmb18QaRJNEAAmbuBxAgQx5uP5A2cYiAGOdYDzu+
	M6mck5c0UW0l3WB3dYGb3HcKpnNWYI1Eg+3QLlNMF2HMHptOber2BJLPPaMZsY7F
	cE7htaWHXid35Wo19GSjEInDqu0jaJ1OBJV3TVBE3hkZ94AgBUDyiLOEbQP+s3rO
	9M3YJV7tTIi+ltq7yFjuDr1zCTSMw1m5l2vg+0thllrRnIpSxf17HEOM19oNR/m+
	luHqAKaqNP/5cp/3meBrKAa0n3CYb1dN9+ghwYJ7igwysO2SRI0O3nqz6KlsXPHW
	1DRlJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct9c3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 07:43:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c648d3ab9so485095a91.3
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782459807; x=1783064607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMVum4Llswm97WxJGwBAdPE2BDgwQjioAQCyEqQctP8=;
        b=jK2S153r7nx9/texwwNvuj5mTltaioroNkqdi/WEqNy2lLhXLqmZ8GfaNRXMzhMYaT
         M8ShiaVyPnxw27IchA62VqsGIPz1n8e9BzM1rof7d8ihFolfbXi4zZsqx030URx+Lu4I
         SZL+VYrj0EZjXl5Pr6sGVecbWsuZWrIU3I/514zhJq3EAe2koo7/NxL1twEMzGhWxMoO
         o/g/Z8qD/0XTKjZwF7p8CNUmxNxKs0Iy+86KuC3tZlNWrZSN4wCmQ1EY8JLl7CzuG3IC
         7UuUh5JUSXpfRsRLDXRN3lwm0PYRJDJIw2tL1UfsVKozFDCnZKCAkLU0Aq30bOWP/OkF
         3zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459807; x=1783064607;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMVum4Llswm97WxJGwBAdPE2BDgwQjioAQCyEqQctP8=;
        b=symLF3dMSAVAa+Qy2DSWxsFsgrY0O4eESK46r4D8cbI1j+zEAe/W5so61+oc6ovkqj
         eXZ+3dvUYWgYYhxGnjnTR9YsXxMd64SxXIq3QXgFYabsXg+JdQiFJ1JbHun5H6V0ReVW
         v7OsnpGLClKaYG+OVhVrgQzKO6PghMkJHAKpBnFZVo0o9UNyR0mHmEKEOeXpGsDFaQtr
         GaLEYWbQDaPCnYBSrLNsdHgYfMVgHUqlLN8iHuj4AYT0+PP3KvFlvJ+WcFm5BvtE9goy
         tOaAFTjXJaZ6i5fbD1MMs/PadQZCyhHEgHHNu2Y0wPeDBYW+u/uDxqnVxLn0MVll9vzC
         HE4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDSrIOo1HmRwfX27GtNSosrzzjKc3Akl4qr4CB+fsa4JTw2l53xLOlr45XE2ZhO69W9VIqpho=@lists.infradead.org
X-Gm-Message-State: AOJu0YyY23cQE5ZgR7+2AZq53PuzTqR3Hrt6xtMa+HJa3YuSouxqQsXF
	KV80sQy6i5Cv1I3xG9jH8+wAKoq/BCm/PWaO440mlrY0eYbRF/jXabwXnq19MOlIYHJ6STaIuR7
	iyGadpO31X3vA750BFQNs+nOAsbJtShGhZFHd7NDu7TS75S4fnlJbtSPg08F/QgX2
X-Gm-Gg: AfdE7cmCLPJ7G09laMs5KHRcgqbYzoBwrAtZrCrSiK3UyIfgosoeEBMSKZOqHg1UbPz
	6Muv7F2pIqlcuLcAn+69DWGCfPUpj0eHAwKs6JG0G67QaApaEvDtFXS3Lw5/PnwxDD9IoFaTV3I
	27N0TYN0msWHHYUNnFfl6VmN90Fzv+NaHSwj5lL7eYJ95B7+PeB2GKMNYF+MuBosaqxt+9xSJDp
	wFG8HviKI9OncE7H0Cl6ygUMp5/CzGOUuoTDt1IY+g1wCgJQp/MuuVLzhmMy0xfPHmLNt8AUSVr
	MmQSqb6Q7dA7Y/XG88oGydQ4MPnewl845fnLlAd0Qrv9dLb4yBG5yhF0t0I7h20Nf9wRs1mba+m
	/pYjwIAQAspC1fNyz38rVQ/hmhHD2FPX5Qdz0ceVtn9f0b6d26/Fldtw00mhX3CBCJedKF0dDVd
	SV88LUh1M=
X-Received: by 2002:a17:90b:5843:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37dfa1ce3ebmr5721121a91.9.1782459806736;
        Fri, 26 Jun 2026 00:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5843:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37dfa1ce3ebmr5721100a91.9.1782459806243;
        Fri, 26 Jun 2026 00:43:26 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12c9229dsm372724a91.1.2026.06.26.00.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 00:43:25 -0700 (PDT)
Message-ID: <402f57ca-5abc-4b56-b1ab-a4c1c0a4da2b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:43:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid setting 320MHz support on
 non 6GHz band
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623151613.72113-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623151613.72113-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OWSwPlXmHwB4v_1jNg3NooZTpXmHkH4X
X-Proofpoint-ORIG-GUID: OWSwPlXmHwB4v_1jNg3NooZTpXmHkH4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MCBTYWx0ZWRfXxfkOFTONG0iq
 +Z9IwXhXU2B+WoLcvHb5ZQSN7LGo/KkxOmbmR6O+KRD/bw3Zg0o5edH8EqlabxRgn88h+HuY/Zb
 HquL+tUBINOoRZLdE94YZBxFgQsur9nHI84387ZUv3YdtmKXCqhgHTLCjCcPz5Y94ATwiy4UMIe
 JNpVDNCM483tzTGJepccje1JwXE09oEumzBQCHQSxd/5+fjuycvlm0j0eYw7yjnS8hQng6H3wIj
 Qf1mtqh/k+1uh3ZEXICP94hAwxN96wiAcG7qI0MvfoKNf7tCrcYtL4TPhtWAPSsFqJC7OA4qh4s
 /kdm67MuPk4uTOWafnTpanITMZdWQPs9fqyYuUuFzvP3MR4pUX3BpXwIFu00TOa7iQJBUE3mHid
 iBYy7B4M4SpLdVIvWsMiPURr46CwHQ9LcCUw7swr/um9JQxDbW8jAKdOQqGT/KHfkVY8kQdLDch
 /zN1bf/ZEUxRKazCcRQ==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e2d9f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WkRSpPLlV-rx6YGWqRUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MCBTYWx0ZWRfXw5lQxXEH1g/E
 h6WLb/h7LKyQ8dYGYRSwAdVorksumDnsImxk0abv2pp7ZTmSGKVEoher8j6cwh2r9HPY2IbuCVF
 D3lcWHZbNGxYC4brqpDWc5pi//uakeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004329_077195_5EA33023 
X-CRM114-Status: GOOD (  13.51  )
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



On 6/23/2026 11:16 PM, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> related features on the 5GHz band while it should not:
> 
>     Wiphy phy1
>     [...]
>         Band 2:
>     [...]
>             EHT Iftypes: managed
>     [...]
>                 EHT PHY Capabilities: (0xe2ffdbe018778000):
>                     320MHz in 6GHz Supported
>     [...]
>                     Beamformee SS (320MHz): 7
>     [...]
>                     Number Of Sounding Dimensions (320MHz): 3
>     [...]
>                 EHT MCS/NSS: (0x22222222222222222200000000):
> 
> This is also reflected in the beacons sent by a mesh interface started on
> that band. They erroneously advertise 320MHz support too.
> 
> This should not happen as IEEE Std 802.11-2024, subclause 9.4.2.323.3 says
> we should not set the 320MHz related fields when not operating on a 6GHz
> band. For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
> 
>   "Reserved if the EHT Capabilities element is indicating capabilities for
>    the 2.4 GHz or 5 GHz bands."
> 
> Fix this by clearing the related bits when converting from WMI eht phy
> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

