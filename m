Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA546C43458
	for <ath12k@archiver.kernel.org>; Sun, 12 Jul 2026 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co+UTMDcWwfARkoO3RPsTqIh+BIZC4J2WRE/abchvVs=; b=pY0YaK248YvBcnqt/pYxyg9E22
	NkVQlueee6B3p7NMK70TWNnpWMSFZ8qWK6me1h3K1tE2A+3AHBO06GKaSTXSYmH+tqec/UqhDcjEf
	fso4nlPhGfCODagNGAXNzYcokqQcXZkTkcgCRNXRaXr/3lhZ8RTNtJEF6B1DtD8loyJiz2Je3mmiz
	vw32ZbU6R/zkRGmTUMa3tZNP70XxkJYqxBIHo+elgO94Mll0gI6W5eBA/wWGKr0MbbuHntb0+RBSx
	CNQFJSS76qs/86NDGwcdrint59NxiCzszhHlep6gxxWC3q3YVGYbZNU9sr9KnSRA+yPo5YxdGPl0c
	QZ96LbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1an-00000007lk6-1azq;
	Sun, 12 Jul 2026 21:20:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1ak-00000007lfn-0NSB
	for ath12k@lists.infradead.org;
	Sun, 12 Jul 2026 21:20:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CK8gGe3556746
	for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Co+UTMDcWwfARkoO3RPsTqIh+BIZC4J2WRE/abchvVs=; b=BC5Rb8O8pZ3VcZwZ
	t7jdzHC//R+2KKdKW6viJvatzCZJNgG9A9dEXLVRr4BCgyxw86zUDoemZ6drrP9m
	crX7EYuw7hhBKUhjxrTDKEmlXBGL9P6FOHQmfOH27lCYcaVQGgPq1rc/0fOnFWm7
	p5G0gu5wy9ymCM4twrsxV6l2HO06zkB4Oao8jMxKNEwdXZzLXFQ4GuKoH/wbQRKT
	3o6TQ7f/R0jDnbC0rabqD7tqAlWqvreOdRKlOdTvIjKY2Sn7iCLVgxwCqHBp4zZs
	tflUUaOhUvXYv9AG6FWQxhYLac+JYdkQc4OPpVtF/shrJSrpoeTrc9JU8+L/3DrU
	JfcD/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgkjtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 21:19:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso6016067a12.1
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783891199; x=1784495999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co+UTMDcWwfARkoO3RPsTqIh+BIZC4J2WRE/abchvVs=;
        b=Z3V3K5YsHqBTp4997YKgmTykYICMYgloBKsXssu7eTNKVIyTlbi2eFl6iV4iQoVHAK
         yh8r9XP93YUVlNMWnBBO9MpBZ5fU5p0VUur9k6DVaK1dHCygCCHfBt2nzForBduTR3La
         XZBVcMzVYB9KhOJTqOvT0W/KumXOWNBoT5B71okUpZPFtkN5+5EDURwmzTOGONEzcIjY
         /39M/ALnPDU10LyYIgRwSRIfo2gSv5kIRaE7MOnNzg1apHfKRsifffHN6fi6Eeql+STw
         BS7u7McHDCF1rxyN3AVY6LBW5bGDgibh45P0QX4KuZPisP3G3wfzkdpyyQ3eumCv6pol
         pahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783891199; x=1784495999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co+UTMDcWwfARkoO3RPsTqIh+BIZC4J2WRE/abchvVs=;
        b=dF9FPdOIpU0MuXp6OXiT2BX7nZ54Y/QUK9gfovWdJomf3rBSG5mm436VvEvcYeSzDj
         X2rk6JmW2Vpa/NUUNI4sKmxvRKEFn3sxjnvqp4ksi0ZhnRtPv1JTlN22UvCeME8AsLDF
         /+H1iyYYFKPQ8E61xByg6H5HaItIJ3q6PIQQFh+iSPkzoTxu42deIaxruK0jxwUTfTPE
         0ZYfYkvmsb44AOE049z/ZSEPRMiOkCC/YBsyDFg59Uvo81D6en3xACBL6XiqF9HXKaOY
         614FhUaykcXtkRu0wa2erELEGtdPitQ0UKrjxACnN51Ra2EbDH7hGk/1KQyCdAjHuxYq
         gmRA==
X-Forwarded-Encrypted: i=1; AHgh+RoxNnEQPHm1NFkveokqirpnio7rVNsDRUEjFTIAY8W7cjNz8yCF39DyxXZVdQm4tMjDaRuslwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxTBLFhVVLbjqPFFwJaFgj2k1j4jiLeke7KUIW1qlGkdRgGvrr
	EniNh3vQYbt1hieN0kdKl2PUB0OMAh4YqcpwM/7ePF/VOIhpxZ/mFqyor0+g0ClK5G471bVYGNk
	yju4rLXZuHGYn6fRXXNo6E27Dog4YOxOUy/rDXihQ6haLAkFoOV0Chd5dIOo8HNwuebrEO/d9
X-Gm-Gg: AfdE7cnphTlPG47YroZfXiz+fS5xK1+4RADSi8nT7xJr0fYmt2nwqAmAe03oSOkk2oY
	UND+dRbtaUAx8M2UAHnY3aLbL/+25gm52jcfrnq6BADKBAXtG15FJru6cEeHu1OetH6H9TPT/4P
	p8a+mSDzef/i9rqO28q1M4b8SRmk63P6duOc0VVc2uxRDg3YTO4uG2SzJTNIgKjwDkCThHkF7Eg
	jInGgxGCH1Xa0JuFJkVbuJs7L2sFJNUMVCI1Q1ALMmBGAle3N+8JchzpCHvhVsiTm6/3yGAVYyD
	w/uPWDbMOw8TxSvI5CI59qwYyorGMkafc0RnPhO0OC7zV6gQLydhpHbLsV17vyR+9lGGervWM+d
	Fp+0APOuXWcx1JmPJY98BDMZIm5Hsig7uQYIKxCzKAhv5iYbTpl/05mwO6+xmILBN4KhH
X-Received: by 2002:a05:6a20:4324:b0:3bf:80a5:51b0 with SMTP id adf61e73a8af0-3c10fb6f300mr7554135637.0.1783891198658;
        Sun, 12 Jul 2026 14:19:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:3bf:80a5:51b0 with SMTP id adf61e73a8af0-3c10fb6f300mr7554114637.0.1783891198177;
        Sun, 12 Jul 2026 14:19:58 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm15707591c88.2.2026.07.12.14.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 14:19:57 -0700 (PDT)
Message-ID: <3c02ccfc-7e3d-474d-9ab5-a6b5ae187fa8@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 14:19:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix scan command endianness on big
 endian
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
 <afbff608-a005-43c4-af76-968a58bf0cc3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <afbff608-a005-43c4-af76-968a58bf0cc3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIzMCBTYWx0ZWRfX8QSyU/eoDK4K
 8V3Q8AKBrSLH26d/wqHCQd9XqEcoWYt3MRTRMfBgWixppODLESdziYZXMgRRNrD+zzC1ShKKdCp
 baurlPn89TAi2e+b6EHVyMdES4FTWnE=
X-Proofpoint-ORIG-GUID: zVjQ-7yPSu7FzMM3L41uAdVf-6S_hbDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIzMCBTYWx0ZWRfX7nSgbYOZf0aj
 W0dzOQa4MJL+qV4oy8I9nqEshwEt9bsvqmtJOr0AQdR6RfMX21Z4C05kaBU5U8959MbNGJXwR+N
 HNYv5q6Y6hlsO23RveKU+N10brrCNjhhK6pcm8iaj3Zk5Wj597JICsIBx2XfNYOlW5AV4AbMu7m
 TON30A9WRsBHgoFW14sadH3g+1DaTK77kQpc7W9v2HUZia7SaOmWgX5FFGG97+JbAdxzjFmGwPn
 xfMoj6gONabVslfbX4heFloA3ROzNauoYwixFSK09fIja3TtGFfnlXauAb27ztJfOL0E8Cg+bVL
 zi/ZHfgCXC3m2uCzifriBTGsbGLOsdijacff8oDJrlsh9KqTIuKxOqR+7SRN2feie1vxQZOGGVu
 0894BMQ7Ha53wJfIf70vacvz84Ddii9DnOtjuj2X2+Fp65BKeAn/AJSKHIktqP61btyLGTIGVoC
 x5/B8i7oKsRwr1MwcPQ==
X-Proofpoint-GUID: zVjQ-7yPSu7FzMM3L41uAdVf-6S_hbDc
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5404ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=loD7mlZLawVs_UXLojYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_142002_323038_3F974389 
X-CRM114-Status: GOOD (  15.22  )
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

On 7/3/2026 1:18 AM, Baochen Qiang wrote:
> On 7/3/2026 3:35 PM, Alexander Wilhelm wrote:
>> @@ -2795,7 +2799,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>>  		hint_bssid = ptr;
>>  		for (i = 0; i < arg->num_hint_bssid; ++i) {
>>  			hint_bssid->freq_flags =
>> -				arg->hint_bssid[i].freq_flags;
>> +				cpu_to_le32(arg->hint_bssid[i].freq_flags);
>>  			ether_addr_copy(&arg->hint_bssid[i].bssid.addr[0],
>>  					&hint_bssid->bssid.addr[0]);
> 
> the src and dst are wrongly swapped, should be
> 
> ether_addr_copy(&hint_bssid->bssid.addr[0], &arg->hint_bssid[i].bssid.addr[0]);
> 
> However since this is a pre-exising issue and not related to endian handling, not sure if
> we should fix it as well in the same patch.
> 
> Jeff, your thought?
Fixing this should be a separate patch since this is an existing issue that is
unrelated to endian handling.

I already have an AI agent fired up to verify the issue so I'll have it
generate the patch.

/jeff

