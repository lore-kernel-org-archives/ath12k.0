Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C573C61CE8
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+Xoc8jQg9mSaFRDtWyg0thEc3VLpGKQWUrFkyaMVVY=; b=vYJT2Q+2jVVwLzdGumZ33R1B4p
	oQYVV8U7Amqz05M4DUtn2yNLeBs7pF9MmzpKby8NTbC+XYhWFRCpGuF1vZnMLknH5oLReGiF7fCna
	ezz6AbvOm+QVt/uyE6jr1FM/3AWBt3yy+S+LsK8HKeNfNeFLqgfHW4jn5/COV5ouDPOjM0ZWxFla8
	RdT0uRjnznIkqdktFXtleCx0+IWibffLBylmnGv3ypk849n5VYVbup3pIu5I9cf9bBTWsNapQKB+J
	36I6eeuZn4oESSOg0yzhK7FPG75NrF0LVqxmdcta+jBzn30WC40sYb+pCLIwYI7wT8MGJqnq+Ez8s
	DcLJiEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNX1U-00000000KYG-1DH1;
	Fri, 06 Jun 2025 13:22:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNX1S-00000000KXa-1b7E
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 13:22:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5568Pvlx012737
	for <ath12k@lists.infradead.org>; Fri, 6 Jun 2025 13:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+Xoc8jQg9mSaFRDtWyg0thEc3VLpGKQWUrFkyaMVVY=; b=fMT03DN9PRrl+O1d
	PE72bzKOqeuSiMEGr44xy0XKb/34eLUwJ6sffuBqJjyizdrQk2OJ4AhGZ83yC55+
	az9vT1ZCdWpcwtkhtRsN9wwlG5Jp9Qik054uNRrbeczRXOaQ+dWdmqkTWQbk681J
	bQQ3FfXq5Z5LHdtk1UvxtvYcCig4j6/pQbo8CK17krgPcuukYZF3fQcox8frhZKl
	7WkajRt4gve+XRKtFn0ePCjYW+Ej/vmpdxG1v/gCXPAAOOEGe237ZqlnMU02MD74
	jW1xdSjOfNmRjRfRusZLkaIBA6qe+5lGSLZlzra6w4QfhwVTVpcvf4yrVC2xB54R
	ZAH7Aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be88duh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 13:22:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234aceaf591so14847105ad.1
        for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 06:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216132; x=1749820932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Xoc8jQg9mSaFRDtWyg0thEc3VLpGKQWUrFkyaMVVY=;
        b=IByc8Q2QDqYKb6zC0UxJOjYgCJYCvBNdTf4YgZrUfLD2qpByWyWaiOhTFpLtGrx9hU
         s/8lt/wuF9+bUsMF+/K6uCfqmDZgIFmiyQ1/qFJi64/zAzTr9MGp2JG4KYCmk/z/OEsC
         fDbEJG960hZA6SLGEODIrc6E4ZYeqtN0HEr27Ck2L+oY9Rnv5C1FZNckWJEfrHii0PXR
         z1s/RLQjhd46TMSRqyTfl/vhV2jA/TCvCcfMboNft22YZyad/nvlCb8rFBEulCqI9UBH
         cEueQQ/EHljz//m/Xpmvgt76PklOi2WDK1O6EAtEyLF1wBty8PLpsVGHXmygCyTbC2Tg
         +B7w==
X-Forwarded-Encrypted: i=1; AJvYcCVupN+TY4D/XBveF3IGKYNcNrmW4Qngif3WWChUXmLND5lhtnxJGH1Jv/jFs6Egfr36VlZWUto=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7c2l5bNkrFDTbkn0paUo7GJzcoo4HTGX9Fb7fBIXIIVsOGD69
	OYZIGCzpyZ+EKmeHgTp9ZvI8VC30Pof40WDOo1aUjaxtiIc9lc1KRYmgjQ674T0cxglL6RLw9Ip
	Yz7pkGmFsIjVG+aNrWCrHT952e0CzNdudOIfjeFIp1PgEsxS34/gK0NnwHvnsFGNA
X-Gm-Gg: ASbGnctAKvvdpgAHMhNHQHiEkAq0+mEtKEeYFbY8qajYemHu6e6nq5kNQ7qsyow6Aje
	3uSBEgNTsNZGpRDarJPdxekUqD1Yl6cXx8eTQAAr2IwDu2wYBqRcqOLJqK6ZRMt2i6KDZpuyXjM
	JkccwH7aCiO1ZOoH5fdajuSxoyHXb8ZJ5vNFhZ7dnBrRTOqhaSezD3RDM08VhS3UQglMXDJoEKQ
	c1ym1k2nxogxDu2UNBnBqNvSkMQ+/+GHXOyRXKJmNuNagsfthpEqzx17/aAaQiJzNK2ztH2QyOb
	ctR/pR5M35u27ItOSt5AlIeKHfUphqnGTHK7o/kGm1Euc8vN/shaHNGiPetyawVlLh5glevytxo
	R1qfekciFgLlVNWPMp2cK4ksSsvnHIfrH4934fNkzMev4Sw==
X-Received: by 2002:a17:902:d2c3:b0:234:bca7:2920 with SMTP id d9443c01a7336-23601d1870dmr52400765ad.24.1749216132106;
        Fri, 06 Jun 2025 06:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsI6ansVzfPzpY9PMXSQMUKHP5Xd4Qes2uNXHT+JrSwFFLoReCXfm9/USOKMsmeyKk9CSmiQ==
X-Received: by 2002:a17:902:d2c3:b0:234:bca7:2920 with SMTP id d9443c01a7336-23601d1870dmr52400465ad.24.1749216131675;
        Fri, 06 Jun 2025 06:22:11 -0700 (PDT)
Received: from [10.50.31.45] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034108f2sm12044305ad.202.2025.06.06.06.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:22:11 -0700 (PDT)
Message-ID: <5e6fd381-ead3-4212-9dac-a8d0109767b6@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 18:52:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
 <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
 <9605558d-e785-4eb8-a752-1f591eff393e@oss.qualcomm.com>
 <3249b83b-00e6-464a-a6ad-80e114ffd438@oss.qualcomm.com>
 <a949a8f5-1b08-4ba8-bd74-c2fd7fb754fc@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <a949a8f5-1b08-4ba8-bd74-c2fd7fb754fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6842eb85 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=_3B5WRsFI3aEWVz-x-QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DYChQUT6dFK2vT7RJcMVXum1CGjs5-Yt
X-Proofpoint-ORIG-GUID: DYChQUT6dFK2vT7RJcMVXum1CGjs5-Yt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMSBTYWx0ZWRfX1/6JNliRVflG
 T1qHfSbhH9/QFxwpA8HJ+uEE+KpsjdPflbLKw6BislwY/uG/W92iT9xsjUonM5H6jftec7YTj/E
 Gxtg4ShAidd59uTTbCKIomCp99H0hVwoR92IdksC9gogPum2Ph71lbS/+iRUacoAFzExKArzA2m
 dncs+hn3Jt394Aao75KB6zv5635F1tjOVDHtYOBr4+hUeSUVZT21G/YSLDLvBz3HYvXNVY7rxgH
 PJk4a6N4khRMg8tF+f9bKbKtHCojuqJNi6PqLOTTev//f2vkUsc/6MFQAwRQHC+GtsMHKW96h1b
 Z98PFQSRaAhnr09UODRn1L6CVBn91iUblLpgLKLrfqVpT4+VA+PkSEK3/jbTnvQOu0xzEpQR8p1
 ipnL4fLDJaKhpSdPrh/1DrPsEdITkAlwXGr9QtQ+YBnwCj8+3r5g9LdwOzDKsWBbnvNEvpdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=917 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_062214_447126_106FC60E 
X-CRM114-Status: GOOD (  12.16  )
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



On 6/5/2025 2:08 AM, Jeff Johnson wrote:
> On 6/4/2025 1:59 AM, Karthikeyan Kathirvel wrote:
>> On 5/9/2025 9:37 PM, Jeff Johnson wrote:
>>> Will you be spinning a v2? Note the dependent mac80211 change has merged.
>> Yes Jeff, we've identified and confirmed a firmware bug that gets
>> triggered during IGTK key installation, which leads to corruption of the
>> GTK keys in firmware. To work around this, I’ll send a new version where
>> IGTK uses software crypto. Once the firmware bug is resolved upstream,
>> we can re-enable hardware offload for IGTK.
> 
> Note that then means firmware must advertise that the correct support is
> present so that the host knows whether or not it can enable the offload.
> 
> /jeff

Noted.

