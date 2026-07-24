Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A4C531C9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 05:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=; b=OiFf/S0LYZoXXvA/Xn2loVVeVD
	ES+Td/JzhDy/Ub/Fm97f+eqbMbtw4CLl09yCWuYdT7w4odyGHJbdqLQIunCLqQfDqcs8tU4V/GK23
	YKnYW4BnSSfJAuJgehTlCeOVdncY06AH5k5eR78a3oXAu9O9YhHqzhZ9sw1LfR8BQvSB/UVhWVYCK
	f/L58kS18zoNEvzsMaAMdszl4C3z+eBkUGGgyoV1h4lxWS8X9dl/Ca19zSLO6GRSmZGJ4T3tGV2Ix
	bOKnLvT+nE5yHBduOIF7rlzzn+ZZfJhnGtyKM87bbIy1EGMA1//3hVLO8DnorAFIs8KMe4UFcalug
	hkVOXKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8SF-0000000FVRx-46WF;
	Fri, 24 Jul 2026 05:28:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8SD-0000000FVR3-0AK7
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 05:28:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUwY1510162
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 05:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=; b=QoTtO3bCnT420dz5
	C7SF5pA+1l5WwhrUtkbhKUryEVoQsoQbfOXJMUkzARozMW19QCLOSIEDjrGHGRvk
	fumDZaePvFE+OVr27zov9MssxvbrzuG519/K6J7Y6LA2dibjM5K+uh+M5hFMa6Ku
	y1VcvTujZlS55OBO9Vks9LmH/HoM+kRpFDTXDKroc/0Mm6Ju10Lzyh6UE7fqQ9kr
	VEyi4cofXsB52ayUQXQtsPR7TephJ2GQMvvQbpg8KvAFUGXlSxBVFTX0e3NmsQfG
	Z0NPGXXnczICRPThZcQs0xQKglHUEe8rhiO8yF7t2ZcQR7CmcQkW6SorJmiJj1TM
	2YCNjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrs3gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 05:28:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1410993b3a.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 22:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784870892; x=1785475692; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=;
        b=bzEKFXebwPNFr5SEO0i/sSr2KeEQk/0lhStYscCRNQ92Hs4ZbxN1G/TBeLLRkkyMOt
         8oKCdyvE6RdZ/+Jq7dbL/I7gWTDxVcMuVuGZQFoKHHX8siZFeHavltQ2V9XqVcwYApVl
         CxGHXtXwD0snhTbt9+Bnnp81Xabxj1Ic2cDDL79+5Xr/tWZgpSk14g0tA1g7SITx/r+8
         qIYGniD/HJXHAhbQDd0nisr+5avtusI/4ixzEpPKn6RrYzMLNApcJ4YFrDgCT7xsaZIV
         Ddv8RVt37sQ1Gj/XDf3GJcLS7suoDbt1GJe62UysvxGIRu7lnXPpx7X5qWRnja2F36EI
         lmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870892; x=1785475692;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFjNu1XAKmuN7VKnJSfcxCrzh/BqLfdCpDY+znNSwRk=;
        b=bPkqKxfQX6n47F9/eomoq00aw/wyT4Z2k7Pp6wyXfyT2h/KIyQQbwpvn+PLhSGJxmy
         rBttR/q0SHOH6C+wF64F/NhJ/HCOo4CV1+wZbg5rlqGPQu0nw5ysy+/lOjB5P0WG2e3a
         xH0KvSt3hp+6J8rCZm16YCJZ1fEazmnCusqUcVRyzc+MNBh3gRt+3QbQp3xdLaGckl+u
         OdC8TQvKRXUsogjE64Jdj5c2Wv1MHcuGMyezL8pIi99H0Ju8UMuR/Tp8gpuvFFOmVhFc
         PAdu7AsISiwQHZH6+bNjEg3Tq2F+BMjAB1KU8DEG4uajl5Yk+3CHwFtHk3Cu9U6jao5s
         eOqw==
X-Forwarded-Encrypted: i=1; AHgh+RobjyuOoNlKvkmP+Gso5UfCF0JrXdO35s5VM60+NXY499Q8bA3gbXBWm8I2p1/+FJb/VOm57qQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHpXkBxzwYcALa1BbI5IwmspHHhnc8g2N/fGmfliv8JPYeeyD
	Z/47HjWd0rIpD3r38n3Kw8ieFz6sMKFW+25+/kL3SDocRvndHPLqNRM0HuE0O09wNuTo/etblYo
	v7hdB5qdDrSOGrp2aOU8itmV8RlEEygR2zP5BwBFUWKRh5g/NxLtPZKQZ65JZBObnGTPzqffB
X-Gm-Gg: AR+sD10Z7ijue5oii7zSv7ECNxDjYqlAuIpaGnOGSXhm4rVKf5fIOoNiCY7SIWcTKhx
	mFnVbYoutldBAwPoddCP2cVWfSNLouURdgc5Y6aVYYAkUMVyzk1T/i9/c51KFGTnPeLB0y0apAh
	nUHOf0pKQ0qVqBSLJk+NALG3uDVfKIhoD8/CV6NxZutdYeMAKzTh4U5nZNfO0SRK5SnXhwGXJl5
	d08mLsvrccP3HeN3qqzFqE7rDrV7U3G8P6tHSpm3fZCZ67nm5l/IE/Zn7sEWs+0lN2toKbTsdZg
	ic+fOSIj4z5FJ0dqOpo39TgVnoq/fuh0WhpZrxbxX/OLNEiM9yY6Ehe6fUGXajcC3xgbdrFDn5l
	hbPjYJOjj078Q35+A8hoBqCKCo/nC7kzTpCqst3CeWb9rXuIU2cKj80mZdt6LqFSJOIzRjPj0
X-Received: by 2002:a05:6a00:12ca:b0:845:d2e3:b9c8 with SMTP id d2e1a72fcca58-84e2e8aa3a8mr5755451b3a.28.1784870891710;
        Thu, 23 Jul 2026 22:28:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:845:d2e3:b9c8 with SMTP id d2e1a72fcca58-84e2e8aa3a8mr5755431b3a.28.1784870891322;
        Thu, 23 Jul 2026 22:28:11 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172984b0sm4081194b3a.27.2026.07.23.22.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 22:28:10 -0700 (PDT)
Message-ID: <4daa2ff3-f6e1-4cab-8c99-9c9fd0e61055@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:28:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0NyBTYWx0ZWRfXyQcqQU0o/KfD
 S2XwLIn52SLCu+VSiGFTpAqrOI38bDrZIIFIUclXjCgAQtXpezSNJtDCKzMhulRcIP7krQDdCrS
 0QVdwQAsOBdWdqZasX0Mh+hPqvrXo8c=
X-Proofpoint-ORIG-GUID: 2cXJmYJbgUNpgMBXlaIABrkERk8EbjSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0NyBTYWx0ZWRfX91JjPSdF/2BF
 DhcoMBw45KSOksh7ARh1U2ftvF2PmqdmdJ3uWMrBsKMnJqTStPyVopiNQwRu5a95HjD11sxosOz
 PzpznWVEsLLjBlNNHSMxrYpoDpGN1F5xoWQK8bxx3lxWEcQFNM2l7MQQlIAU1FkO2KMHSkwZ3/Q
 G5UrnXRt/xc3MIzBuR7Lnu0hxARnv9CW7nyxbWPjs4r1njgyK+afZHYngdnly7BBurl7L4xMfas
 3nlkcz5LZ12KkjxT4mL6ejSr49WnCWBe4+N01jC8k3PKma0fEUHUdIMGD59u+Wdkh4zcWFNfqrp
 7oYAXBQ9Z2YBRCXVBwdVhF5/gJZ0Kof0YmIH/CEEHIiidYxl2iDMLjmvkAmOAXj7tFUsiaPZh3C
 59PrCVLjKhmZ4krNLyGoF+T0UE4WQdPz3q6CnouuwjfVPtX9Qsa7bT3AD4ZIfupKhrN6C8rzYsh
 KkJuqUz2FUPX6m6O+Rw==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a62f7ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2apCv5pjgjHDBs81cwIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 2cXJmYJbgUNpgMBXlaIABrkERk8EbjSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_222813_111138_14391D77 
X-CRM114-Status: UNSURE (   9.38  )
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



On 7/24/2026 9:31 AM, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
>       wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
> ---
> base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
> change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

