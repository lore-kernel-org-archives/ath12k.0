Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E1AC021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwbXktj+6mi4SemWqhem10JT4Tczcngjmcp+vqZ/MjA=; b=WBbtDMTLl0Ctd+e8wUUMOhLQv3
	gXuUzqM2MrXoeKo/fjxxOtrsDjlZWXhXlk5kOPHdgR4UCHD+/V1+wFLkgTlhRd4eWJAlZvjd1xkja
	cb8N0mtin2c4XXH+HjmUiza6gqGCTjSiQfKdwVpti7lxF42Cdl3amAAgWVcwgP+UnSCbdQRr2Ev3n
	CUv2MR86LHgjSkRGYaAuHD+Pyzmk+irwQAnvRIvQBR3mCpwsHdyc2WaoaOwK3XKEKL18EiXcnndLW
	eSco/rQoLll9fwK4Hdu81ciu7DE45WGGWApYQdwJ+PsxZ9evRaaK7WnEU6cTb5Xi5OCvAP2YmRCFB
	3AIEvPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toF9E-0000000DQJF-0FRd
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:12:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toF9B-0000000DQIT-3wnC
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:12:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213PcH5006173
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwbXktj+6mi4SemWqhem10JT4Tczcngjmcp+vqZ/MjA=; b=KKxZAF6up91NPG5+
	L8f78T1XaDt1ux2Ft3kJO4osI7CuKedQ6GXr1P3Nc9MRDlNOgvzJle+0EPV592ga
	UOsdomi2vUgKO3q4IgKl3bT/EykiQaC0g2vas0cw/5U8mFVC11PFgU+MvVNYDNHe
	w2ivPuk4EJh80zBiFpVZF7AFqb7pm1CRvPYga3nLyzqLvZ6R97PSQvGc8zsuXY+T
	IA3mf36CxtHmzy5nRzO+pVWzZ70RhLm4a9PmY1a5YTJu6beBuk/UNAP5uRah/ALu
	elARdzqQovxEDXRwrH8RGgvi/SkbmOTbxVDIc7vlXBIb/8QVvDzinNbjw8CgU4V0
	Xzu3sQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tas84wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:12:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fecd603bb8so1537947a91.3
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740805940; x=1741410740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwbXktj+6mi4SemWqhem10JT4Tczcngjmcp+vqZ/MjA=;
        b=rWdbTsNTcuJKawc7/eVmDl7Unbu16O/hJ/Ojs9L+XP6Ptox+xCpaUZ+9hahEdb0/AO
         lDNDkoZhb4Hn7BOPo7cZXw8/YOsKwZkCONfuljxUTxaBFNz36SNYOmqvMhVCQfacwwYH
         6T2Zycvoa9DC8vz/ZsYeuJHOA920roOzxlOs8haeRViRJ8igSiTqTgDV0DaIlsynRnQc
         wDw6XQNyiGbd2PuCnNU5td0mvjz+U4JygXktxa/xuwmcXC9tVr+bNzzgPT6XfDOeygKg
         ypn42EYiC7CXh4yubh+RB3+IbvfYIAAc4Sg1GCPr9HkIF0HkY0sl/CztsvpKc7A5ji8g
         Q8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV2jsA69dtVxotX0FSUDFrsTJWi+1fqtYeC00/+Uaby+875OH7zY8BrVuuCEzc2cs1LucpivKA=@lists.infradead.org
X-Gm-Message-State: AOJu0YznccLDKELdUtrNAJwYPOeq3cvKBcH2r5njJ903EWw09/vNfMUv
	QLZ7q5vsHsVvEed+s+GPA3MwIalc2XNiDqBw6hBHtgZGaIbm/+LjiOgSVThAp1QpUsXJxYjYHxS
	qjRawU95DNuP/IU6bIYJ5ZOrjAgJz3R3KUw5ZtpI+iuwhuDLSls8x9f5tTvPa
X-Gm-Gg: ASbGncvkCZHJov9NoDR2LN4Lqdk4V0PpkTmXB3f4a00kvxl1e3+RR37JvEWGbBeCNI+
	EENYds/G7smiofHpXlqF2zthai9hoFbfIWL8UkByFmZIhzRbKFA0DVCQNc1TtCIBi5KvaTckyLa
	YG6AT+JpsWQlmXNkE1ZDpPm9deHpGa809+lItrx3SiYfF/Z5F8PGFvL3Qm9o8UlU+Oq9GCpc4CG
	Z6sv03c3gMCkp3g9AO80LUlrcuTfXsc77R1mU/chEbnqCSUuuD0ET65wdxwlthxgRjHlJR9TYKQ
	OV0zIuVkNb1tCWlT9jKliZWLhSd0UWEjWMfGRjSMteoz9q4mpxoMcbCvfBBQwLM=
X-Received: by 2002:a05:6a00:995:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734ac45bb10mr10116353b3a.21.1740805939588;
        Fri, 28 Feb 2025 21:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNzhrvUe1zqnZTxnuKOpo4LZGceKwE6AToEOzijs/WtCX0AmWj+wGbHbT8EyJflTzKTDpMSQ==
X-Received: by 2002:a05:6a00:995:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-734ac45bb10mr10116328b3a.21.1740805939214;
        Fri, 28 Feb 2025 21:12:19 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0060037sm4646386b3a.162.2025.02.28.21.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:12:18 -0800 (PST)
Message-ID: <d6d9c015-e554-d821-4729-9e67f1fdc6e8@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:42:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 06/13] wifi: ath12k: Add hw_params to remap CE register
 space for IPQ5332
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-7-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-7-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YsDRdVkGqj43iH8hBqMgYHk3GCuzpYw_
X-Proofpoint-ORIG-GUID: YsDRdVkGqj43iH8hBqMgYHk3GCuzpYw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211222_096613_634A8AD4 
X-CRM114-Status: UNSURE (   9.42  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> For IPQ5332 CE register space is moved out of WCSS region and the
> space is not contiguous. Hence, add hardware params (ce_ie_addr &
> ce_remap) for IPQ5332. These parameters would be used by Ath12k
> AHB driver (in subsequent patches) to remap the CE registers to a
> new space for accessing them.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

