Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5753EC71157
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nysOwYF+hR26j+HKNLN4aGaa8udN6foCr+/NVyt1WUY=; b=c87fV12hrAPcXeGIUuNeEhnXiE
	1OB/xgATl+Za43wISJ5gZyCzSQPWZe8Sr3lGFDgJHb5KKNqL9v4l2tZ7QQ0ltfcYOgAk7YQ/tLzCe
	5ud6R0RL9UuSYxm4viHOOK32yCidgi6EoRbMYN13WItVBAFirOq0JH7EU79htrZ3cw0ztUl7JRTpm
	XBNG8UIM4526r+O8OmJ6eervF3UqM5XF4ch/OXZ/8Yk2L0BXZoQn69m5Xed2xVKMvb6qqmc/tzTEz
	w8gdy0bLwRSNMVJb01Rz/ktPNT/7CdYpcN/zF+88MGJBPGxKFoqed9ffPy30+w5XFGLXBhKxexelc
	QrboLZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRY2r-00000007iTj-0Kw9;
	Tue, 17 Jun 2025 15:16:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXAn-00000007Wd4-2tTZ
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 14:20:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HE8DJR028159
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 14:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nysOwYF+hR26j+HKNLN4aGaa8udN6foCr+/NVyt1WUY=; b=gQDuEwvICC+IEjwK
	gBGCkBbM7hFAvorU/6LBr6CCWmmA3RqrSkeKtzGuYjq6ArKM8Ko4rNFwkt5l/KEQ
	kHmY4y0Ne0reCWVSXMkibrPvohdRnhykM4tj4tzfIOjzr7Rrsk41TmWu0meuDGJB
	Km7q6UFn0JRDSZoufbi6zfJ2aRYJcI1CMFp+C+0rMj2f6sYTZNcpUQJdd2lvKVdd
	dAWpFy1OOCEJqG0zxAcdk+s4e03dkHYgMAgcZwYUNBLbkaaiW9Rr8RLa+4ukds7X
	5cmIBGCsNffQ9AFQtn0XkY6t1Sh3xTgFWM4sSXZ305xuwiJ8FEp7U6hu3qqsK3f/
	J9kXEg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f78kgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 14:20:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0f807421c9so3720546a12.0
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 07:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170022; x=1750774822;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nysOwYF+hR26j+HKNLN4aGaa8udN6foCr+/NVyt1WUY=;
        b=xAGOoP106XzZpxOncBzxXexwKgGBg8Hx6sUXpDs+l1L0SocTT1GV6mWNVDXjOwo8Ca
         P8ktPs00EqYDLVSvbL1WEYa5UTOkgl9JK6pUU9w6NOB63R0ie9zw6LvI81dCdvuyhb7m
         dTGB6vjYS5+CR9sAUqZQMhOlSPjpnbCaPLcCSSwebxEGv9z9qL2um5dnoczgaTeeLEIh
         WqB9bKbYUbOIRSXF4QDL0qR29HuMWDjxlKoLm1vkDNk1E1Les9bYiELDPg2P9qFr7dw0
         1bZWM1DMO3gElrh2Wj0UYSNbtbBsQjG/70vQhSVSyNkEvewI6+6uH3ZvwAIdlVyXLEG1
         S2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2YJuoFb5ENelhiqwZh8hvthyvtC9LcBAXO/9jGHDN/97Jvy5LT6wQwD3pTdQVuq/VNawrNQc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnnoYouB6sQ4p323mkzw6afnFz6svsaihca7hkynTSe/2U4ixk
	rW6PmZd13CaQ0o05PNW4vTDYrsYJFMGknsmI+QL4BfqZbbGV/ssLBrLFKYzFENl9pkRCH1vj4VW
	Xt/5P0fnh2Z2ygPaGOdwgcbklqtXlRZ+5UVdUAbXT9qDU+quBSp/hmH/X5KpC27v7
X-Gm-Gg: ASbGnctoTbZkJ7/Wu8MJJkfpkaT3R5zb9SfGMKVG2EG5JZ3M4+7EVubwL2ZP1U9ALxE
	ZE65EB1PiBBFO58g+M0aB9+6DXmbtEBZnGO56cykLFoZSUoHtNbaEqmrlDCfgRR/HuYyzUKDFgF
	yqsKmVBgd3KLZ3uvi83DtsNzR8fdaQRpYeMZRLrcOo6TqlgaJrVFW/+VwSSV1oZ5GvtJEB83osz
	/RUzKr/UcNGrNUyDE1SyToQl8cgnR0j4eSNmdMOF9GmvWc7/AlAbI/uCMZn63WI8ojVUcgLoV2X
	GSaPrWbnTzfJoOG+PSGjMBZMvkZDnPFvgKlJqxwo4wyuaVwZ7/kDyCQuYb3cdDH8/0AAQ6HR4oC
	CCHYZxtLpC1/kcuo=
X-Received: by 2002:a05:6a20:cd92:b0:21f:8a8a:f752 with SMTP id adf61e73a8af0-21fbd57d944mr22928264637.32.1750170022054;
        Tue, 17 Jun 2025 07:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNdSNGIkCsBR6QkDn6e19pl4RibzbG1sb7JhCOWjIgRkawLMpYuPPWaNCUaYnHs/bzJ7SnrQ==
X-Received: by 2002:a05:6a20:cd92:b0:21f:8a8a:f752 with SMTP id adf61e73a8af0-21fbd57d944mr22928208637.32.1750170021608;
        Tue, 17 Jun 2025 07:20:21 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168c8f7sm7440935a12.65.2025.06.17.07.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:20:21 -0700 (PDT)
Message-ID: <a0f11976-3324-434e-abdd-51394423affc@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 07:20:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: High CPU usage from NetworkManager with QCNCM865 (WCN7850)
To: Baochen Qiang <quic_bqiang@quicinc.com>, g <gregoire.s93@live.fr>,
        ath12k@lists.infradead.org
References: <87c2388b-67c3-450f-8257-38855aba0da5@oss.qualcomm.com>
 <AS8P190MB1205381CAC703C21F90D115F8771A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
 <8e0de439-8593-4000-bf36-ef31fb2fd7bc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e0de439-8593-4000-bf36-ef31fb2fd7bc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExMiBTYWx0ZWRfX5DdYEt2P84Ct
 cKS1Ee8N7HpCBk2pwJVwivXcQgcWIbLlZ0Yv5njUqbjyRv72QlfOaxE3m7XqiIRRMo8f1C5Q83m
 viTi3dsR/KHLoUvJZmSUy5k8endwkM8JA1+mPGr9Vp9VkkQlALmneZu9ylisRlKd6zWGmk59thA
 jS8Fqe5yRxhUJ01y6sVZEILuXzbSFWYAgOwJjK3+n94L6Pk/mOTwU2P4TaX/rhPr8HPXITut7wI
 aDm532jIT0lhm8EJ7LquyhH3sRuW8NO1eHuJEBcgFk9+R0pSFo3rkFWkCFl+ABRHneDkcze33j8
 2MzinSf2ghky+NWj4hAOiIDgCXFXJXHgxmg+Ok2I/MpOvsI4Zh3gcRQ2/Fd7Oci+N0i5XNutBI4
 x1JYuKEcngM4xPuO1p7G0WOyTKcNeapd6MO7psvci5L+VObqblHnGetppZn3ASXrCW/HdC0c
X-Proofpoint-GUID: Kn8i6XyoSVnFilJciyewqEsW4kY5bZWw
X-Proofpoint-ORIG-GUID: Kn8i6XyoSVnFilJciyewqEsW4kY5bZWw
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=685179a7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ohGsJu0LNLhKWa8t5OkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=347 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072025_855323_C5F8A435 
X-CRM114-Status: GOOD (  10.90  )
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

On 6/15/2025 7:10 PM, Baochen Qiang wrote:
> 
> 
> On 6/15/2025 4:28 PM, g wrote:
>> Thanks, but this patch doesn't seem to solve the problem.
> 
> Could you merge below two series/patches and try again?
> 
> 1#
> https://patchwork.kernel.org/project/linux-wireless/patch/20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com/
> 
> 2#
> https://patchwork.kernel.org/project/linux-wireless/cover/20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com/

Alternately, please try tag ath-pending-202506171413 from the ath tree:
git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git

That has several ath12k fix that I'm about to push for the next -rc.

One of the patches currently has the tag:
Reported-by: g <gregoire.s93@live.fr>

That was the "From" of your e-mail that reported the problem.

If you want me to change that to your full name, let me know what name to use.

/jeff

