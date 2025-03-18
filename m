Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD61C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYwU73RjEVKjZaZgWeYEmk1TjixaNfci3cjOuf+0t8k=; b=MdbP8qL2FnZq4fi12xetFYM+H9
	pCrDmKDyBkP3s8X5+RHJxcSXQmDCmjFNR8IhpT3a5/r02zaLWczysKHkkDhBup7nGGpuzrIDjQPoh
	KDNpuYlWsb2CtLmw1MKcoUSaJUM9mZp2GF3Dbu8/MOyVRDMiKTEn1ArPFB33bs1E8XFgtapvY/wnY
	X5lL8j6IJqRnCqHIwmoNdRug+3QtrEY/lzrlhBtmPbINrklZxJSp4SvX8UZTkjcP0nRCEG0UcFp/b
	DM80WMJM/1pWDc6mWzThUovvEvx04ID2Y/+sDlPIKNIDws/59jHz9YuSZQBDBDyrNt8xOonRtG+yn
	Y85elg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubAT-00000006k1t-2i8U
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 17:55:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tubAQ-00000006k1V-46Cy
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 17:55:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAr3GU019834
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 17:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYwU73RjEVKjZaZgWeYEmk1TjixaNfci3cjOuf+0t8k=; b=GXZXw4vl9ahAl03S
	iNlo76xpfrnR24EiBGW5dQW3oTW7j7w8lJvhPRs/OhlkN3vYAnXtQ5vjSDvDDtS9
	9UAqXf2tGwYj2TYYWd6JwcGBkVrzwFiGXnqKgA/nbgcBmkN22eSnNdGvfcqiwHk0
	2jdXLArh4/sSI8ZPXoSIQxQ92ShZqmepDg2SvKjFJ0AVbTH5jwCSZR5SzrkN2oko
	UBIl473EognT4n9yernmPfGvG7fKNZzRmb9Xu+uWUPt/7cAyWCKcdqQ+aHfcy5XS
	v3Gx0kllQHE2qZQKBeDk0HDFzWRvkuel7N1DBIuPmLvnrzKE+tmF7QZzi3uTHHf+
	YV7bNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbjqm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 17:55:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223f3357064so87668315ad.3
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 10:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320552; x=1742925352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WYwU73RjEVKjZaZgWeYEmk1TjixaNfci3cjOuf+0t8k=;
        b=issadPLBE6fUKPsYEO467licLrKdIxIBNSilhRk96PH2Zyqh82NxyMWGphtawgxk3s
         HfED1TWM+7M48xNSGb5gU5xmswZS8HnAK8VPy0BB/1WBRfQWVqXtf8QnCm0j/Vo2W6+8
         wLEPK9MZfJ2p0/ChyBYIitK968pYEgyVOU8iboDHZnvwsYIH0gOvuGo9knGFWdWrNRy9
         t1Rv3gQwXoEeF2Rm0ZeDf/k2HUkNzNspRKtuNr+McVQuygOIfepwLir8F1L0Uvot9QMu
         zWoMmEcShPHArdHZbp2LtcAS3BvarDDu6Hd1LsMdusZSM340ysu4PzrwVnnGPkqcEgrR
         Es0g==
X-Forwarded-Encrypted: i=1; AJvYcCVLfn6CZ2EKiPXDIxb3xLWeg1vlpqDANdI2CD+mGGtC7QoH05rQmA2VDgHSGBMHUeuLdHqbvOA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/jy/zfcb3qlVzR6FN/ivEoi8APCfNQM3I6/XS2P7KoHGw7x1j
	8EtkbaaNmlX5KxRSrBgSdOaqSwBmYfXHBTFowV3KY2XOpjOk6Bh+8fdt+dkja72TWY6qFRI4V+T
	F0/NFMqMdmYgvsgBnhSmhj9i+4ww7pmv/XBboWe0Mfp98ysZeHwQ6SPZNeuV9
X-Gm-Gg: ASbGncvqSg6vFPfgoqekQzMiPHY57aMJzdZ5yBPOPXQVsP3lEl8FknLA8Gpfl9lCIDc
	jidYN6PDGF0wSk8JRaC0z1/OTBDXftw5AOhuC4zV2Lnbo9gymEI+DD1wvI72DdznXgHJvy1Uttl
	CH9vrrnRMnpIAK6D71oH7xPIotHA/E+sx3IR/udGZIRceXkiVn95R94HwTzpLUnNICZuEj++0s4
	+Md1pFqd5TYmRJjn+tR65bSoYG1pA2dLmcMxWxIiSX+18ndC10VRYxY7dfIsj7SExlGtAT+9P3p
	NoBHKxIEHTG7CxkdpOuv0qzgfu1o4Nt9CW77bUjvBAqLBmrXUk8itn/s840aAPviH34G5Ws=
X-Received: by 2002:a17:902:f545:b0:223:635d:3e2a with SMTP id d9443c01a7336-225e0a8f4a7mr210952915ad.23.1742320552112;
        Tue, 18 Mar 2025 10:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGQnb8IgzE4FIqsuGJu4IQxqgtuk/CstYaDph2XbU45sLrIAtach8WeFzSOU2ydIq8Q1MRIg==
X-Received: by 2002:a17:902:f545:b0:223:635d:3e2a with SMTP id d9443c01a7336-225e0a8f4a7mr210952535ad.23.1742320551638;
        Tue, 18 Mar 2025 10:55:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa616sm98018595ad.93.2025.03.18.10.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:55:51 -0700 (PDT)
Message-ID: <f35a6080-8dbd-45ca-8fb4-d6b01a5bb007@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 10:55:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v11 08/13] wifi: ath12k: add AHB driver support
 for IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250317204639.1864742-9-quic_rajkbhag@quicinc.com>
 <683b16dd-a3e9-4cc3-836a-95f3747d3c0a@oss.qualcomm.com>
 <0da16aae-2fa3-49a4-bdd3-f08a7655365f@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0da16aae-2fa3-49a4-bdd3-f08a7655365f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d9b3a9 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=PCo5qUFWOPHZosJy6w4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: h9XdQB11OVR-8Eh29B-r2-x3Ab4J0Fr9
X-Proofpoint-GUID: h9XdQB11OVR-8Eh29B-r2-x3Ab4J0Fr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_105555_051470_6852278F 
X-CRM114-Status: GOOD (  13.43  )
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

On 3/18/2025 8:50 AM, Krzysztof Kozlowski wrote:
> On 18/03/2025 16:44, Jeff Johnson wrote:
>> On 3/17/2025 1:46 PM, Raj Kumar Bhagat wrote:
>>> +	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
>>
>> kernel test robot warns:
>> cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *'
>>
>> looks like others have fixed this by first casting to (uintptr_t)
>> a few examples:
>>
> Cast via (kernel_ulong_t)
> 
> But another point is that this patch at stage v11 should not have
> compiler warnings and it's not our tools who should point it out. Except
> W=1, all standard static analyzers (sparse, smatch and coccinelle) are
> expected to be run.

I ran what I thought was a reasonable cross-section of builds and did not see
this issue. Seems this issue is only flagged with config: um-allmodconfig ??

Guess I need to add that configuration to my builds...

/jeff

