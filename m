Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF24CCFA1A
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 01:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4pQDPwPblLhm6m8x3jjqVjzosMDd4sMDe1fEk2j2bY=; b=tQYNzWVDDphTzLgutGmdz5xdV8
	xZ9YlCE7+j2EIqF4r5/WGU0lgkrueTUXkFNnUAq9yRFIi+f69hshDUwXkGrl/hQJNl0nO1/iWv9hJ
	TdX8NIs0ye2Wh9S945f6v7LWafPea1gU/gbDB6YfLzGycY30IuZlpGUSUJjGcn/xS4m72E6/X3yo4
	CMd3xIBtEA1NktVsXZ7Ff2LBD6kSmeMTOMoG4e4oNCJxMayAtqcGU4v91XoFXznLHwJNxg9Sk9sGt
	LFFUux8WWcKVmzbt7+CAQBLhNcVIwCL/JB5wX1K/okEdcWwuCaFpdR80L4Q7eTmHM+dAIN9Lcf1wp
	vI0dbVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzfe-00000007xYs-0hfT;
	Wed, 12 Nov 2025 01:29:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzfa-00000007xYU-422B
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 01:29:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABN3suE3925001
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 01:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4pQDPwPblLhm6m8x3jjqVjzosMDd4sMDe1fEk2j2bY=; b=h/bPUlO2ZS+4zmUg
	vxLSbmDZNNsPXm5W5gFsTSDvgANj+DNz+HMI6W2IjsOL6G7wEqCCOiVxkR/X4Fr9
	gfml7ugcINMG3XT1+abjF0QWQDLT8L4t+E/rTfiTny32qyCULTERpXenRVBYh+rS
	1a0jHS14ByxyD5JckFN+v+grX3AlTcpBZBcUeyKnCbZNgetaX+sqwba1o/C7SbC1
	/a0xWiwLCTkl/Tzg6OTxVrbPdJt9sepm9YrODGzVpYtj9hWqesivmS7LDfD593CA
	KAHIXIh/Rcd6qJEfngL6Z4kMgBURDHQweN7OklB2SiUQsgbkd4vq6D+oDnlk2OBK
	SXM47g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acefur9v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 01:29:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso299608a12.1
        for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 17:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762910948; x=1763515748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4pQDPwPblLhm6m8x3jjqVjzosMDd4sMDe1fEk2j2bY=;
        b=WhX5sTWVSn0Xaj9I2ea6d9CqHpPt2U8zh3rkt/BQENPlB6cwcWxpXmKL7nCko/y2D8
         Ny2LGzlSFUJC6sE1y7hye1mVEP3FKZdgr9eqWMTAK0k2vM33rjTE9J6ur0chO2dBnJ7G
         KDZtffhVuPqdtQbGiQaJQ8fie7K4HVcKJuxzJmZkA3XVualREdfyStNWy9gZALymQy4/
         i9+r6ri4J62ybukWCx4Lg1Hmq2OvPy13vPxlmhSrk/QfqojTNey4SgS+6k0iet1RjsS/
         TDYF3oXGQvIhHUijLeJg2E89KsnWwUO7uwfwDTWUfH6fOBS9FGnVag7BEijBwlme/sNC
         aTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762910948; x=1763515748;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4pQDPwPblLhm6m8x3jjqVjzosMDd4sMDe1fEk2j2bY=;
        b=CwF4bmUkBdwa9EdwYz9xYGYRULYgDyTOqvJIAJ/3Ze5U5sJNkCYkePS8lPHoQUO4OM
         OTwa4IggMSwjmBGRMWHgDMowxoeP7LhSb6m08Bb8ftHSMdemGXO1VxOTXROY+FJTW04Y
         tudJoMeU9Eu+W2iTrHyjuPEvS4Arcb4GM8KuESgi8tIHCoPTh5bMiTqieLs7ejIniPvY
         hhVWqVdGwDyjNNF8J7BM4oc5ahDH2KZy1g3ki2qFJsI1lQsBuilFrYCl5bOS7KDVo6Qn
         sGzmhQkFzW679JznMSP8OFQIhtkTLUFn4MBxVhlsJrnQ74qO2UKujYry4hBFkytI/hCu
         kDjg==
X-Forwarded-Encrypted: i=1; AJvYcCU210kcPN0I7/BoioRRGFOSqximn813x2PhiWbfc5S5PZaArLST5exrucg4SPJC6snhXL53fdg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkOTjeo8ApVYmJLezwhAD7oPZSYC12ztv+TbN4I35d9yQPCD6D
	38vsiY954LafEAj/AhaV10W/GDCmnOzIE21NfK+1UPZ712MWrtUcM+tNpyxjwn4w7FrleQKi5vy
	fr0oQWZAFQ9ypY3XU+Y7Xoi9t2JqNa3kHy986BMFM7lbiC8ZsPZAlO2i/FEPdBazxO7hcoHtl
X-Gm-Gg: ASbGnctDd2HxubKbX+dc93A/urArp4yC0U3PAaAEXQyFQVEA1B9jwhZ75OGF5Jn2n6X
	qStcxID6vC+iDYPNNZzy9TDXpuCbT//DtW42jSz4z1JsHB3uvT+EEK+BGGzD1mPrDxQR23m8a8C
	NUwrxoEbQlzwAXDy/XgiztlM+wFv5Uoo6w2SJjNPCSepH1fXMvQQC27BTZK9aha+Xu8tckkTQ0s
	Dn43KraykxDfST4zpn9fTV0MvS4VLYc8aWPaU9SmDs9/zwjtr+0r1iGYLLaY5jw0daT4X69/rVS
	4S5WEiTvFzRG4jc0cIsfNHsDwJTxukP09FxDCp48fdDbPIhIi/Hj3jkClGdKhk++agayqcm/dYO
	6ZJ4cAMMt2MRtxK0pjnm3E36O2qs+MHl//sl8Zz1aNGytdIeBBl2d7GWDyrTe0/SS9g==
X-Received: by 2002:a17:90b:2687:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-343dde02a1cmr1393009a91.15.1762910948127;
        Tue, 11 Nov 2025 17:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9fKdKN+Frc9fluQucBI28BVeY3/pYLHxAqNPtQtqD5160mgsWS9ZkIXB8cSkLaRmeQvSebQ==
X-Received: by 2002:a17:90b:2687:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-343dde02a1cmr1392979a91.15.1762910947366;
        Tue, 11 Nov 2025 17:29:07 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e1c497b4sm42373a91.2.2025.11.11.17.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 17:29:07 -0800 (PST)
Message-ID: <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 17:29:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k pcie radios with MLO support?
To: Ben Greear <greearb@candelatech.com>, ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mqRxat0EHwVBmGFzyGRLj2Dp8VXBex9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAwOSBTYWx0ZWRfX7QqhIORDEh/i
 UFZwGh6ltM1i9t3nj0hWVCM6sbDL30MwbJ94rQEUfBOh+XRU5TVf0V2xnPbvN7GnFtXnR5vnJMD
 xuIshY8l2UKMiQo5mvIM6+4OyJQeCHSmz3DYDnDf08Bqiq35PRhyJYgCKKdXO8oDdVcYFBezGg/
 5CGtfhnZZDyr/k26Xa8E+KsvS5JOX5JhZCMT4/cww91E82QqUCxok4czszU86Lkv1b4GRiXgsIp
 uGv9YcOxrYUQgELhLO6MUlk3Mjov0u/5q2d9T301ZP0iF+go7gnRQL5oxnAa8bOuAxgH+q5m2rZ
 ty9r2GJ/pSY421RbBjAvWuvUbmay7VSooGpNT7+T0svrnHrfjoTK/tyuUoQHPjUBy4kr5CblxdK
 +pJLr+j5pnmWeqKF1eXty71S9OzWcg==
X-Proofpoint-ORIG-GUID: mqRxat0EHwVBmGFzyGRLj2Dp8VXBex9I
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=6913e2e5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GUbesZiWAAAA:8 a=DM1TRWazlk8_a4uvd9MA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=-cUrBSrepuC47jtK_ZRV:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_172911_137534_07F39A10 
X-CRM114-Status: UNSURE (   9.79  )
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

On 11/11/2025 7:27 AM, Ben Greear wrote:
> Hello,
> 
> Are there any current radios + software available where one can put
> ath12k radios in (mini)pcie slots or similar and use those in x86-64
> chassis and provide tri-band MLO?
> 
> Last I looked, Compex had some dual-band radios and maybe single-band
> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?

Most of the Compex modules use the AP-centric QCN chipsets.
For your use case look for something using the WCN chipset.

Something like:
https://www.sparklan.com/product/wnfq-291bei/

(I haven't tried it and don't endorse it, just giving as an example)


