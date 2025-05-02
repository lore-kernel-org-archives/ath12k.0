Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598CAC3ABAC
	for <ath12k@archiver.kernel.org>; Fri,  2 May 2025 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct+Wba5sxV6p65F8HhAc4pv+h6X6o76MrJsyzGL2Pl4=; b=ayA7RIuQIDfJ/zujF5kPlpVni3
	pFDE+wIDJCsrsjULlDaqtnDe3tbUEzOiizgsjcVVn8ToT/262yuhzRAvAeF3qPiKCzlw4vPLiYrc7
	XHyyFyZYP02BkZs12nJAwFSUWhbWwgzArRdATyiY2rsL/CVWXQlWFgDwROJqpshlLSOIGSVlHggqh
	0W/ubidPDOZ8tTz410XlT3MoeBpXuVMAnxzUEQkoQMSFVwYizu0t3iYzAcgoItyybFrZjATr7ISV6
	pTv1IhUlsQSjPA9E50uCMRQP3yk0OfIuknjdWao6dnajP2K4K4+INofQ+rlwZMciTYsreMhSQIbi/
	hqNAA6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxZh-000000031rT-0Hyl;
	Fri, 02 May 2025 21:05:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxS0-0000000311j-3Iqr
	for ath12k@lists.infradead.org;
	Fri, 02 May 2025 20:57:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBZwJ015359
	for <ath12k@lists.infradead.org>; Fri, 2 May 2025 20:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ct+Wba5sxV6p65F8HhAc4pv+h6X6o76MrJsyzGL2Pl4=; b=Wv9aG0wUDF2ii6/Q
	3gn9G2hHz0YZVZDKEUbB94Sm9aVDQxzq1DcABhGNyyBmqs3nbgyq08v+7oCXSRwy
	G9IqQkYxZehrfgB/aogzwyBVG2n9dyOVjKLug2IpMBq5lE7ls1t50Ma8Bq0SZS2v
	2x0oVPt4rMJ8r4QuhCVKKuh1lCYWQlGNfGXJSixd6j34axPZDCB+1OR5+aq6dRQ6
	hrqxCPVJlH+OwoavIbGbL3H8eLUAjXCqEbWKyPOdHiTP5cBqRFmXqTWaE4932/fb
	nwfEeQfI9PsxxgwKY2sttvdTaioKt/aGOG/DWh6yomkyUZO1HWGzUicoHnjeTeAG
	cufngg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u41aqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 02 May 2025 20:57:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1389718a12.0
        for <ath12k@lists.infradead.org>; Fri, 02 May 2025 13:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219458; x=1746824258;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ct+Wba5sxV6p65F8HhAc4pv+h6X6o76MrJsyzGL2Pl4=;
        b=jb72/qYUiyE3Ldja2Of1ZUS1dqgoEUa5yLNAYisft5S23ZjiBJJ0lUFvYqGVgpPsMO
         Od0KFDm9tgNGQ2Y/LZoS2TwRr7/zQm13/QudwHV0Q1LngRUfN8DmH0qAS6ufaHf62aDs
         uOyo3eb34GyYlATTiuJMIwxM2sghncbe/QMmri12idXIZAXjAzOa1SbFnFoX60KGNEQb
         BvKSlS5Gc5qWVkF8JeQG3oyMrX48v5WP1Ig74B/sEqCtkDvB65JMAekTSNhT06IKkAkO
         IafDFDzC5RyZaBSJGT74/Gfev6k3ZimwM6Gq70hnGKYn4trBDeGn10ubqjzBsGayZX9p
         y1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFYkD9bIpmMErCONgcWycBtlJuLX80lP9tOqdKVNODjvfW4GslGydVAlgBWu5FydPybzHm2/U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp3x1Rsj/wQraNWnYOSkxd/IwmOKKc6oy9CU5iPO2gdGVLLvn8
	zf0LKcMbOPz2mnaf8Iy9MiGnPaQLh2Egr5S+ytWCN3oiQ/nINOdxfp7MdlzSYxGKPU3SZjSH56p
	5FdwOkjET8u8MOoPVQyPbjO9xZevxXf2kPbh/SjkdnDj3lN+1fvUmSmFz9slw
X-Gm-Gg: ASbGncvz+VkF4FH0AI/FusvJLBIB2s4ihUjxdr2SpRHLvKVJLgh9iH3JWhvqxp8kwRS
	TQty2gWWJc4GIUAIGwFJCBZiCeVr+SUIY0ZYoJk/u1RQH/Zm/oc5gc8s1YgBpc5Iv8fFWBAjTtM
	XykF2AjgZmRLlTTy66z7Qm5+x2AUEdAEGL5fKfb9hY1vnQOe0yz2/noy24Q1RRsfUPpZTSxud2w
	pPcIPcrNaaDoPrNDjSiQuy3YQXXSx1dd/fq3EuEO7D2+XsWJrYPvMlSD688ZMMY2pecLxpWw256
	dTZCqit4bs3herRNl/WB3bM0ZZNtKzXKpG4iCy9kZup9SYwC32ZCJTMAAcNaluQVGaU3BS/kG7j
	ksEel
X-Received: by 2002:a05:6a21:4a4c:b0:20a:bde0:beb9 with SMTP id adf61e73a8af0-20cde36e845mr6553333637.1.1746219458189;
        Fri, 02 May 2025 13:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlJZ9uGwCEkvaPm72WzkhLbeBGM5R4mihblJ4XtBkX/gS8TsHEwYkhPWhlELHQghuk1PGFA==
X-Received: by 2002:a05:6a21:4a4c:b0:20a:bde0:beb9 with SMTP id adf61e73a8af0-20cde36e845mr6553307637.1.1746219457776;
        Fri, 02 May 2025 13:57:37 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm2077133b3a.25.2025.05.02.13.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 13:57:37 -0700 (PDT)
Message-ID: <b934485c-05b3-47fb-a3ad-b7e03706d0c8@oss.qualcomm.com>
Date: Fri, 2 May 2025 13:57:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove redundant regulatory rules
 intersection logic in host
To: Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <quic_aisr@quicinc.com>
References: <20250430154211.669502-1-quic_rajson@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250430154211.669502-1-quic_rajson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=681531c3 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=pHcMd5RsyzlK0E1VJJUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4Vq8LMYH97DnpfVvdycxuFpZrtinNIKe
X-Proofpoint-ORIG-GUID: 4Vq8LMYH97DnpfVvdycxuFpZrtinNIKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE2OSBTYWx0ZWRfX6tSszBo8hMmk b4OF0ZQSi2H3w+AQJWYCiHOT6LitCqRWShG2E/U52AJC8vqshhFAj31ysu6hslNwSY56jaVdeRV zis66720tWP7F1Pol5HEOeZaUyySNV5maHvnPEAydQNQp4gioAfC9ZJC1wPE4o+qk7Tl5J1eQS/
 Hq2sQSo/T9kbqbpf9i3lq8P2UZvS861t1eQLkwWLc85ZCxiwreT7HnJZqLdPFe/NHTh0gdNKUxV +nbok1X0lKnyUcLjSAXO/i2O88OOR7Lbt3JLMRCyM3TpQUyk7WGXg2baoecsI/DPrWIYdBNZdg9 qKbEqcb3bdhqbxS3YngY5kS5YRP8grHVihvB3bXZoinP52nkj1QkZdYS2KGJqW/nOpXRojjSXAb
 9ohc9yGjof6oQZcmmKpsr70L5qSivKqj0XaadJGqVjDKKyp8Z6WSqxWUnJ2d7M+c9dQeCvqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135740_957641_111ACF18 
X-CRM114-Status: GOOD (  21.54  )
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

On 4/30/2025 8:42 AM, Rajat Soni wrote:
> From: Aishwarya R <quic_aisr@quicinc.com>
> 
> Whenever there is a change in the country code settings from the
> user, driver does an intersection of the regulatory rules for this
> new country with the original regulatory rules which were reported
> during initialization time.
> 
> There is also similar logic running in firmware with a difference
> that the intersection in firmware is only done when the country code
> is configuration during boot up time (BDF/OTP). Firmware logic does
> not kick in when no country code is configured during device bring
> up time as the device is always expected to have the country code
> configured properly in the deployment.
> 
> There is a debug/test use case that requires absolute regulatory
> rules to be used for a user configured country code when the device
> is not configured with a particular country code during boot up time.
> 
> To support the above test use case, remove the redundant regulatory
> rules intersection logic in the host driver. Depend on the
> intersection logic in firmware when the device comes up with
> pre-configured country code.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/reg.c | 164 ++------------------------
>  drivers/net/wireless/ath/ath12k/reg.h |   3 +-
>  drivers/net/wireless/ath/ath12k/wmi.c |  24 +---
>  3 files changed, 14 insertions(+), 177 deletions(-)

While this applies cleanly on top of ath-next, it does not apply cleanly on
the pending branch.

Can you please rebase on ath/main-pending, and post a v2 with ath-pending as
the destination branch tag? Don't worry if the patchwork bot ignores it due to
an unknown branch tag.

/jeff

