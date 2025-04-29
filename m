Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC33C369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 05:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VD1Uf9B/Vj3KD2/QaWyCjcbmkH4OAe3VRoSlYJ5UkVQ=; b=Xsczdz6rWZweMzNVbY09RfEaZl
	+ZWuGjhZBd91ZIwaTZTkNWQLY9bbScu+e/3+qmYlNitg7HwZ4ZZRxxygkV+KxX07RkYzp/8ZM7FGC
	l+wwNi4tbLNGQqGziDv82UNP+lbIL6R/YV9NGelBAdDregXuPyY7AYMN2EQDPS76QNVlAlU3Q7HO4
	JFor4aarGTTptIsH0xkO+EsIZJasxxRFU4CmZO00IXl+26GL1H64m7b/3Sptn58w7jWyoO1Dyiz0e
	cw5Ma02qJEiJ95EdtI+6asI0YG5Xce6zwU9KaTOLoqjZNgjtC0nlURZQu2I/UBIM4nSaGRwnMeQYZ
	ooyJgy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dNH-00000008Mz3-0uzu;
	Tue, 29 Apr 2025 05:19:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dND-00000008Mye-008e
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 05:19:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqQPp025683
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VD1Uf9B/Vj3KD2/QaWyCjcbmkH4OAe3VRoSlYJ5UkVQ=; b=HOzI8GWv1sdih/d0
	92rtF8A//oAl2e01ESBuNxHVqFiGyHncDfk0TaWHxOJp8nvn2H5W58wHyUmaP2Sd
	lhBC0dT9WeTe+NxbYKk0J4sGhdl0XqbSpo+2TrGzwe6uD/T0KVSbKkwAPcPpoVvZ
	IYC+u/HOe5Ym3HoJpSsgg1mdN1XKjUACsuLDmuF5Q0TctOXN/SccYRRkAojGm7aB
	uQVpDJAyw1Ucf4XyU30vA1nPsPMUWpmVIFl4MV+5BLpGlxgjHW6DP6LK8ABAsIyi
	8cuviKSBtoZBlz9MH5ni8RnfdeW0KewM6tXbh0KTrwJIElEBn+994j3N0dqSfNtO
	y2pOvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkgm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:19:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3087a703066so5365846a91.0
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 22:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745903952; x=1746508752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VD1Uf9B/Vj3KD2/QaWyCjcbmkH4OAe3VRoSlYJ5UkVQ=;
        b=Z6Nv+XbPP3TQwboAGeuskr8s3kiOeKYkZza/VgeUlZxZz1XHF7IG94SAohzPBOaUcx
         jctoehC/vEqWx0DQd0j+thYkRYPBByRGddiSwKKZLNWrm+M5UBAPgggrPRX3o2c1jQUL
         H7eCbwgk5Y71D9OrBh5DqPlPAcL3zAEfnSLoBBEigLG9KI90qz7z1xR2jzSHrqBpU4Bs
         9tFECGNPghpdWNRsUK59no6TseSPMYEx7UX1HwUDU+AYbY+QlLioIyVSgBz5xPkq6bx5
         sXiy/hDodowURHD9e0hKHa62MZ+Tj1Q+YV+npX5XXKjTwaGSYTx1cER5qp/XaQ5URuhG
         Udug==
X-Forwarded-Encrypted: i=1; AJvYcCUMMqE0NYAoOZJcrQ8AeYbYy7r7bqv7IVd4Ha4HQjT296+ufu6Hp5c74f3WmCzt82e8wXkknGI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/SbW5M9Q5B9LNQmWZxXUW8Om5HFazAgrOXgsY1Vu2wrfbDlnj
	dW3RN9V3xY+GEFs8rxHfhWCt8k05QBfVmn7Yv429U8+uYAV2fxy9ZtFNB5NM3wh55iCumGTdX09
	P1NLsSBYasYKTCMFBc2k5a4Y9bRywY7pW+bRDWWgHOIu4zQlWV6PvHxBL97v/
X-Gm-Gg: ASbGncuCAH+x7kG1xPAcqhBxSaRZ4X5YqyvAr2cy1+T0cQChiWdlmokXMamkfyG6rrR
	95Gxd6t3+y0g2P6ebTYLc6rnAN/O+tApDZLbT0IUDI8YhOZAZNu57HFCwCDRpbwBO1kVOBMfo9b
	JmB83FDVNx2Thd4aJN4bboCnh3dfOVzpVfVFNkyxr/CgD4kmYshzhDPUSoPg0PzSZFNtqd3mUgJ
	FPIYL9fnlgwm5WQC2bw8RtM2GtRatvZedg24vy0Q9He1jF71QJ9Gvy3ZxiX/ZKcGnaxJKeMHukh
	YdRSP82XruqGwFhVJhosYMhDB2/9ouOCqaMjL5D5I50K1A/dVBalrA==
X-Received: by 2002:a17:90b:48d0:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-30a012ff0d0mr16008017a91.1.1745903952597;
        Mon, 28 Apr 2025 22:19:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLLK2rcSD1sOQo7rJl7J1M/sQqeRIpUYSYgzfwJYY4CoujYCQLVRrDf/dIK3iguI/Zz6O1w==
X-Received: by 2002:a17:90b:48d0:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-30a012ff0d0mr16007994a91.1.1745903952277;
        Mon, 28 Apr 2025 22:19:12 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7760d7fsm8292164a91.21.2025.04.28.22.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:19:12 -0700 (PDT)
Message-ID: <1b37ae38-c7d7-1ffe-c75f-1eff39fe56a8@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:49:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent multicast duplication
 for dynamic VLAN
Content-Language: en-US
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250424221404.1262597-1-muna.sinada@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250424221404.1262597-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOCBTYWx0ZWRfXyEjJ+6UDu4Dj +8ZbUTA9Qlfr5MVkacYJ8phATaS85RgAUuiArVEdUcH/qV3neavKr8oBEHU+MkaVXtYLqf3ItGI 1n4NFxmRUS8tQhQBMNbgPwxXt2BK7nQFNc8C9uYnrFD0vc2H8DKl/30fCE+Ht34Z90ef26uFbBE
 OPJkhdH+X/gSJ/YDYOWZvJTP2EDmd5p+pvYCgCTLpVBoUUVgUdbSsVc4NOI/4I9RHKYbgmg1x1l Iab+lCQK/k99ET3JFx+RBI6EnI5cnE3PmK8KSUtIaIHdHHqQGbf98i8OAMysiag/u3syWoTbwB/ vagoKWZLyxMVOfFDKRP8d3QaghSRZmvl086tua/kyPks2vtpN10q3IJ/kEUyhe8dSL+TALZBzjE
 c9EzLMgFSwQp5/49pbc680RQVpqxjJzElcqyHQbdnc67/eGaCrWQuYYRY+qusdWDCnLFpfK6
X-Proofpoint-GUID: frqIiTAaKo-aKIgtybKtZ56NOzAyg8ck
X-Proofpoint-ORIG-GUID: frqIiTAaKo-aKIgtybKtZ56NOzAyg8ck
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106151 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=_v-kllCiMXa8kfBWZKwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=518
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_221915_166312_6CA44EEB 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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



On 4/25/2025 3:44 AM, Muna Sinada wrote:
> Since dynamic VLAN traffic is software encrypted and encapsulated,
> mac80211 handles the duplication on each link for MLO dynamic VLAN
> multicast.
> 
> Currently in ath12k_mac_op_tx(), all multicast frames are duplicated
> and are assigned a mcbc_gsn. This is causing dynamic VLAN multicast
> traffic to be dropped in hardware.
> 
> Prevent dynamic VLAN multicast traffic from being duplicated again in
> the driver. Check if incoming packet is a dynamic VLAN packet and
> avoid defaulting to multicast conditional.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

