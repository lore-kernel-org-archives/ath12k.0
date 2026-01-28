Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5895D35660
	for <ath12k@archiver.kernel.org>; Wed, 28 Jan 2026 02:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GdfNWoQOx2wbL3Rpbp8KJiedIwRL0vwTYCw5YiGsLA=; b=xFfUXVw3lD6YPrteOptm4SLJIU
	ZGZikfWtGgA5uHblRFryemmkSo2gy60BSFNaRiHORxyxyOXRNg6mgjAdI3ZfNjIQEomoPWyld7faU
	57E2+s2/bqupZ0wzLRwo1sE/FTBbsrc+j2PwsGWaT5AIIRdude0YMWUVQxClOEtP36qXd7AlYQ0dN
	UTpK3gLafaXsvGBFQGws59Ui9XiqTCnQvb6J5+ygKnpPN1DG3F15mINWOra7YTrtPx1kPfqO+XdyQ
	cUgiUxoC+Y6eoMT3kaANDXBztkr+HlpqFEOTlJhv0XrjD123MYAmTjomg7suxIieAbrryC94wX9fw
	I7Xqye9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuwd-0000000FHtJ-1cke;
	Wed, 28 Jan 2026 02:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuwY-0000000FHso-0Fou
	for ath12k@lists.infradead.org;
	Wed, 28 Jan 2026 02:06:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhbC41952851
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 02:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GdfNWoQOx2wbL3Rpbp8KJiedIwRL0vwTYCw5YiGsLA=; b=cxNVw8q81T+fRzUW
	uLDkKfYJ4rqck1I81Ootw3yDRBa4v1C/VwIfh5C8GD6jQoY319IjS8Hc2afekdIZ
	mWE4cIkSv9SKt8ZPNzrz65Hu4NucTU9sj60M6wVP5xLqXmDUnxx2L+GQX3l6MHAK
	rsTEiMl4fObpC6oBZVe4hs44pSyCaJItj8YY0B/Qj2nBtIbe8ws5zvAWPs2oUIVC
	ccJeCxeXX+ZzVHFVIgpN1HANRhcHrgc67fPup5JP5KqpNB+zscprnZDEYDJIPXcR
	GNVWaG7GtfZ1sUgR7ylQRGdqruI27OuFZYjGsqy1G6YymBgAUqfItsVbrGExPGsC
	BwbvIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2119dup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 02:06:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so56993435ad.1
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769565964; x=1770170764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GdfNWoQOx2wbL3Rpbp8KJiedIwRL0vwTYCw5YiGsLA=;
        b=aeylEm8KM3uOmsxibchi2pwnlmZFe9U1s2bykWrBldD+KcVvQadLtRCb4w+MKFwGCu
         +fQumaSTxLz8+VGniwHNMazSythGKBcxcK+35meQS61Ilhz38SQZ53YzQ2jaB8lUQEfB
         PMY4BknutZ8QjN2+566NEtBgZTUxPlWcvQ8mQgo8GyWb6eFKsW3JfrouMB4xpf+V3D4k
         MjRwPKvKmBKEad4I3qf2ZZLeb9jCK7dQjlnaz8pklOPLbF6uYNj/SGI7X0WrikBR8Rpd
         s0IKZGmCVTk/iHhhq0Dmzc78LJjhJ5z1RDowYnjvYUZ5edXQtMS1xAfwdW9p1c3dmX5h
         XyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769565964; x=1770170764;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GdfNWoQOx2wbL3Rpbp8KJiedIwRL0vwTYCw5YiGsLA=;
        b=XkhuX4ZDh78HHV03Um7+jAsbpqB+IS0fA13vefWOpGNrPHk2DiMtx5ZWaOyQuDvEVt
         IO6M5dBMbAo/cjEVlDlCUa9l7hYcPZEyGC/tLGQfqtDzFPmB4DakconPLwdCHf8c5s4l
         +W3Ce4+vCUfzNZCD8pGSsUlIK2oqha+RABR8VkLUfiE0bqMPyAHjx/fFZaO5A9HRbMH8
         u9yZLIEdQMuGm0RKvhv9toC2A1TG2biuQcnZMn+jW7Azuwa2dKMXse7SSnwysGX/vInD
         bqHWNV65RGqJEi73Vqh8KBSyU3RVwCHesGp6w8F3Miht/gJyvtnvpXWiqPAZfnSq59eb
         IIrw==
X-Forwarded-Encrypted: i=1; AJvYcCW+DTzvMKvljY/Y1ZiYnrQ7QtY3whv5ZQfQPopg9DluMgJ5H9QlCqShuXN1qFD0ntfejhynir8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp8iLdUOElzw+bTHvcF8+5knEwTKIs8px7+rt/4SVw37F3n8/z
	3MDTsEMKwBJ3ZH9ePoO1kcjTEAGttLWwnOkMmpuHx5X267LlGoOA0mTMdKwtIicnnQ2yQvVdTA8
	eUmH6xGu8qMHXQvWz2Ut0yU4p6d0+F3gkZGYdXbLYxEtE8aUpbYccusmQknjtKGvS
X-Gm-Gg: AZuq6aI1sKwCV6pyS5VFaVe5XGQ3BFDtrsDb13oxMzhqwS0yYpE0Oq7xNeaeNbZ7Fwk
	VTXL7aTDuMX6APDaNldEFfBmM15vEIaQy9DakFJZZv7/kqyDTJfrdl0L725wsy+kuGAFo6uYLzC
	3vD9fNwmJGT/jbZVO8CSaQO+jWT9VQJcJXR7GlsDTmlhaAHDCFz5rwWGCk7udt2/8QLKjWxBtVm
	xmrOaPeIOQ4lq6Jr8kMPNOvDIV+nqzE++rSw/DweTzXVrvRCocrUwImh8Ve5nlqD/pU6On7lDtq
	bx9Ddgsz9yIl3AiKL4PvdRn+rgp0AFezXwb3pXHClkaQD5hFRm5LvfHpK/vOCrJZW4K4RQFi2LN
	Ta5muNxyJqMsHWM7GtwOC3InaaZyv78HIk0IsO+MOojKpWQpQIuaCiuyNsVU8j7Mc/3fWidk=
X-Received: by 2002:a05:6a20:4310:b0:38b:e890:2f36 with SMTP id adf61e73a8af0-38ec63ea641mr3732999637.46.1769565964321;
        Tue, 27 Jan 2026 18:06:04 -0800 (PST)
X-Received: by 2002:a05:6a20:4310:b0:38b:e890:2f36 with SMTP id adf61e73a8af0-38ec63ea641mr3732961637.46.1769565963640;
        Tue, 27 Jan 2026 18:06:03 -0800 (PST)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642afbeaf3sm606356a12.33.2026.01.27.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 18:06:03 -0800 (PST)
Message-ID: <14d34890-93de-428e-aa40-e81fc182fb27@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:06:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix wrong TID passed when
 stopping AMPDU session
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260126173655.1369715-1-pmartin-gomez@freebox.fr>
 <9c418260-b67a-48aa-80c6-6a03c91e4ba3@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9c418260-b67a-48aa-80c6-6a03c91e4ba3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxMyBTYWx0ZWRfX5L8fRhqHlo6y
 fU08eNtJ7D5+V5C+mSAUXWX/TV7BmZ8cpl2uKQCS3IlGva/O/y/gLcRovP3ZSwaqF4fDI5+5L+Y
 7luJSt36m6qL4ZfclpTq2zR1k0oYIR29/qsKcaimCPuaBFGZPVgR7UfY0zpY6EfoDUVB+E61CKX
 6+Cq6URYZ9ZOAbm9BBnybPlmYPZtHmTpJMQ301TMZ7plFMN+ADJj5UGXjX0OdDpQjC/gQ+kUkNM
 Rfc13bqt/r9T03FRlN9n7HNwJE4GON7nZ+nwLvYiwhmgJRPb4/u7N0taGMJETSL/ZTJFSs28rtx
 LOv2YhJZi5vNSjjEZtnURgwmhCazE2Xiak5RxRLWH8JAcfJFn1E7yy9JneBldFQUDVA6Q6kqfEX
 gq323dns28heAIEkPPAtXL3B0L0w92vVBiBvWAqv2zbm2AFP30jGaseUrryPxfAjXEyVjIFVF9O
 9m/Nl8qv1gL/w3T+Mwg==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=69796f0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mtm5E0ZguzLvzxQ5De8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fBegO4HKzU0vky8oCEEPc03o7nxestEz
X-Proofpoint-ORIG-GUID: fBegO4HKzU0vky8oCEEPc03o7nxestEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_180609_040268_DF3D78DF 
X-CRM114-Status: GOOD (  18.20  )
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



On 1/28/2026 7:39 AM, Jeff Johnson wrote:
> On 1/26/2026 9:36 AM, Pablo Martin-Gomez wrote:
>> When handling a DELBA request, ath12k_dp_rx_ampdu_stop() calls
>> ath12k_peer_rx_tid_reo_update() to tear down the BA session for the
>> specified TID. However, it currently passes peer->rx_tid instead of the
>> entry corresponding to params->tid.
>>
>> Since peer->rx_tid is an array, this decays to a pointer to the first
>> element, effectively operating on TID 0 regardless of the TID in the
>> DELBA request. As a result, the BA session for TID 0 is stopped while
>> the intended TID remains active.
>>
>> This leads to incorrect BA session state and may significantly reduce
>> RX throughput, as traffic that should use aggregation falls back to a
>> BA window size of 1 on TID 0.
>>
>> Fix this by passing the correct TID entry:
>>   &peer->rx_tid[params->tid]
>>
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
>> ---
>>  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> index d28d8ffec0f8..f2327c82953b 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
>> @@ -1289,7 +1289,7 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>>  		return 0;
>>  	}
>>  
>> -	ret = ath12k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
>> +	ret = ath12k_peer_rx_tid_reo_update(ar, peer, &peer->rx_tid[params->tid], 1, 0, false);
> 
> like the ath11k change, this also triggers ath12k-check:
> drivers/net/wireless/ath/ath12k/dp_rx.c:1292: line length of 95 exceeds 90 columns
> 
> I'll break this line when I process the patch
> 
>>  	spin_unlock_bh(&ab->base_lock);
>>  	if (ret) {
>>  		ath12k_warn(ab, "failed to update reo for rx tid %d: %d\n",
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


