Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD64F36B9F
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 02:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv09rG3fANuVpGBkjHtt7All7i36la4x+57OM6mjhWw=; b=qdKY57R60ns20H/U3N3hqNUZb7
	yvBTGPlXwgntPvCtpvGfihh3IhcYRArJh8k03AlCc4AcMcCUkD0vonYl58pwa+lAcJ2vfhlf845rG
	QKVM93poqiASw7o3PNeFWKAtOBk5QQSDVHwKmgEnusWExr5BX2/R8/xv/umGZjRsVMdSZ6jgpswij
	vt2Gaa2n4/7Uuw4rX8oa7EpANLcVd4F6DNAosk8+FZg3sWy1AZuD71EpOm6hDQwjNc4bg6aQFUVnI
	1nqn/dr8N6h8MUAImPRyU6ZvpNNNR2JpSoTK/4s1GBbLxMqwssa44UzXetXl+Tvbhh473uPzE9ac4
	5jiIImWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1dt-0000000BT4B-2yQX;
	Fri, 10 Apr 2026 02:30:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1dm-0000000BSxE-031Z
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 02:30:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KqMrv1972831
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 02:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv09rG3fANuVpGBkjHtt7All7i36la4x+57OM6mjhWw=; b=H+eDiDjAu3Uktml8
	C6WkWrJDfAbQNDj7Q8EQltBTiRE/JLoH9n48o36hDYSIscYaVQf/NUlo9D1+9ebx
	H7I9RBbjeYtyx8bkkcgClzARdYpKRX12X/7Sm3fxDE9FUSPL1/jVZHyoLT7WeN99
	Qwhy7UZwZddHPuKWuu+thwkhBQOzifXkT4tiDw8OzzYTBBu7Ixu+pkF+H5nAxeAz
	AYee66WUwucJTejrygfd/t3JR9SvM0OrZuaRaBnIQqxKOAiLCc6zOQUmtvkxRAYV
	qhG+fWlySyXz0h10ytcC9bGY9Y8sH1WD/OJhvNBS9OMT+NyP/HYOxl+f+rC+HJm0
	LS7LTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms2cgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 02:30:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e30bb289bso2585783a91.3
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775788235; x=1776393035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bv09rG3fANuVpGBkjHtt7All7i36la4x+57OM6mjhWw=;
        b=BUxcu55IgVX69dfaCKM/UwKK/bmZ2UVMClu8cX8rB2CL5eFfaz4najr0tnzL9RiaX7
         2L5yKWOIetV8tvEBPMQchLALVkNJjLxNUbG56vGEjnoUyk8UKKFM9TGTuzSq42OuMtun
         GB74tdD5kaBsQrqMd3COc2Qx4RnXqXydLJf/9yFl0YaVjBiHHRYpNc3X/aS/Si1WnJPl
         2nwMsb+9NIvFhk4qZ2vzLONE8Ij81MhlK69d3uWpQw+WtU4JMYgrRS5yf26pLlpJ4hIn
         20U7KDdyJK+AL8KPaCVt+0FplTDUJN5a6J/30T+AZOETZDnqsaVDH3uWiDSx4+5TVjsN
         MAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775788235; x=1776393035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv09rG3fANuVpGBkjHtt7All7i36la4x+57OM6mjhWw=;
        b=anEojJu5Qwbu3Se0ZixotVFuVabbPepqMnDy5g6uZvMjaPvwUl0OM3UfL6ulY1IodJ
         6Wcs78PbD4/3P7Ixz+S5zFpqGrdKatEpmi0r/AMNNI6wmXik6zUGGu9iDcDqpayeDenI
         lg15SYiq987hMfd/L0fmQiQW6Szr8gXZnF8zZ/x3zH778FLI2uHZ+5A5e2uYzBLHPNhd
         0l8hEn23+oayH1S93DlmIWDia4sYWw9YxS3OW92hpDQI+N2V/TBVZeXTc8cvhuCbZijk
         rZePTfXfJPL4EDW5HsWKysE1kGlDu9QvAAk185N9xDQhfg0N0tOegoKeNND7KV15cqm0
         HDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVGvxozafuFnj+S5As72tp3tw7ETlfY7e4EFKbDUTvnSSnmXrzRXlkbUBkcIwIxQlcKW9nWeWw=@lists.infradead.org
X-Gm-Message-State: AOJu0YydIqKso7UAB/EadAfcuDIcewLDKMWm0tr09RYjm3HOdZm3EWkj
	ye8LPKQFXkMxU0WDXZQeO5h5Xvu3yn0/Usi5ElCBdzgc2ygmmHiZP7EBzdkrL3KzWQs8IgP6BRb
	fbPThVPQBBnzd3yBNu0kDWbRApvn2+2Hb3OFUuw7OZ48y+7iqf3GLwRfZdkd3XZ36EYb45ZjM
X-Gm-Gg: AeBDieuNQBnLglncS7KDQBzBVXtYdbUsZ39gMXsH34q2XmJZg9K5Dt7RTGt3abFcY3E
	JYw/NfQvi+3RV61XLvI/alpfutS1Ivewk8mQDO+BYaLdo2NJP/k3pGV3IK8bUDAYwYFFvrAFWXI
	DOZECeVxKpUVyURdXTkcAfNYq0MeZXEkTc4JrT7lCkXCUgQwiKrEGxixRhTAMXmazfzhVjCeKSs
	HTOyz2wG10BLlzLs+Epi8IK6jGW8w1zoqFG5o0lVeADI/SgRAMtow+s7p9XT7UhAcT/1+v4DN2X
	nS1gZwxJ5zmK2XURU+0oqsUK/CBql8zfq5ZSaT3I1702vrKkchuZA6aSCwExf/3bmEd2VJl56vJ
	wnH3gRETfDBE7FjhTLtrJJ2S6khqc52gkFjJnCBaH5bdAlQofwakF5vU2n50/cWNfQJA4i+1I1u
	Yix8N7C80NOnks5RbMS00=
X-Received: by 2002:a17:90b:3dcb:b0:35d:997c:8ec0 with SMTP id 98e67ed59e1d1-35e4282bdb6mr1425021a91.18.1775788235514;
        Thu, 09 Apr 2026 19:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcb:b0:35d:997c:8ec0 with SMTP id 98e67ed59e1d1-35e4282bdb6mr1424996a91.18.1775788234996;
        Thu, 09 Apr 2026 19:30:34 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e410b17e4sm1209774a91.0.2026.04.09.19.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 19:30:34 -0700 (PDT)
Message-ID: <91c03b6c-f31c-44bc-8640-1aa16d538e54@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:30:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v7] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260407095426.3285574-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260407095426.3285574-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cSXB66HiBxq3Ztx52y4xSdtjtishL1Vj
X-Proofpoint-GUID: cSXB66HiBxq3Ztx52y4xSdtjtishL1Vj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyMiBTYWx0ZWRfX/j+ZNbyIkica
 VFoIe/1vfaciY8Jdhnde+CcZ2PzXLOahHriKjnjhJMY5sPt+57VDA2DpSeJS19tRvquu6jbl2fU
 OCefY/7nXt7+r21n9Ae7aZYc1WO0d9uMczWFLZm98Fpm4vlbE9UbJD5xdokOKf9EbXNEXpoqqEi
 aZPzVQWcakZZN7yMUNEIcNXdMj4uSk/QA3nA9Wh9z6WdUd8NYNoav69iv5av0yggqKZaraD9Mrt
 LO79V/rAivk7lGGmCs7oQw2e4iQzem1eghfYEoMICvSoTZMIe+Nae2iWZCTJUGJcIh5XaoChVVs
 QY7IE29JU0Ooc/ODcJhEiah5m66iSXJ0tY3g2lDyAM2PBH4jmsPb3SyKg+IIsuz7BAjquznXvSn
 2th7LJIN4JJC0j/IVfJ0vTR9M98suC4EIcdQnUtPcklnQyAmFJ1DSHhbj776nt+mrFTzO+kjjUg
 auo8k9bS5BScVYRz0BQ==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d860cc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2fhWZu5mPpoZkjORUEUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_193038_087565_96D13094 
X-CRM114-Status: GOOD (  12.08  )
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



On 4/7/2026 5:54 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls. This memory is allocated as needed and refcounted to exist only
> as long as one struct ath12k_base lives.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


