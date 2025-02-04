Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81907C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 18:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=; b=ClPFKZey4Cz5z3O3OnrfxP1buv
	ONfLbwFfWI+GmiMu4nrVKw24wSSpzWDTA81tCBglnVTsRT2yOHS7BQo2CS78DXyIfcOCnja29vtd8
	Znim8q1l79T6cPEwJS7Kertj6WYs2O+OjRPovYuhGZDj2c1WplxXW9liBXtAN6j9MQBL/VJJtrsqw
	WnDJc7qYnh+tJvfTEPdEVCIPDVM4nXbrdU4+KuJ1WND5YKNxDXrzFrzdsMadIZ/BO05/Qvjmyb7l/
	k7wFfM4OZuJeyb084THrGn+4cVc5VUDVmyEA8y80xLEMndquQOZ+U7UEuSznoKRBUaZDsb1SR7Zrc
	y35If0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNfb-00000001DLL-0igB
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 18:29:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNer-00000001DEA-0DUz
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 18:28:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BYhDY010449
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 18:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=; b=S3XggxeBZDqErNNa
	rZc9RxZlbHnMbFPqVgodr/SbYzgwRcBvRWSBycUPDbVTs/VjerLTSsK8+hfSqvvO
	NkZLzXtxZSxEf/I39R3t13DPxaCyofQty2+sIMYzEPZy1GQ4tEzJ+uIlFxlPY12u
	81zT8OsgJ77eH1j0G3aMaDGNxjn8R1hAELo24aV1MgVviOQ0M/4NLSzucxwLqnte
	glAHKC0nr71UVFyWC/jQil2i3u1+97in1fvAxbELpGoPPCiA+31L4h8f6vB3n8g5
	Gq7q7EWYHKC6WO5Z76OhCZbN5oZ+duH5yyXg0Q3Y9QNLDnDX6LU7TwP6ot8uYicR
	LTShZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kj4yh0mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 18:28:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164fad3792so125588405ad.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 10:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693703; x=1739298503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=;
        b=LtlSoGLmTCH/hlj8ZZhuxchjA9jH6lH21wwNMlUqZcTxJy53ysJiukRRgFDYDX5gD5
         Hb4BwxW9YdyOaFvaRMnqw/A4B0NEdb5DEzivvE/i+LxpoLspGS2wPBSj6QA8HQCGgA42
         YgNxyn8cO6XnyBBm1GDVi8iS/ilBqnxZzEGTx1qGUvhfwpxIU9ahYpsiOfrIOnotsKJ+
         hib1o1p4IdnVHI4M+XoCbzvMhkSb+DbnNnIgPO7E7whHSNKDlUsfTizNHN0iBK+QDKVd
         Ljsj8fWbUVJTUcqzBJjvpcQSbaqdNyckWRi5+LREV31eNgjrk1K6n7Ek9H4Qj/kx4bwt
         6XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5oZlVX+kIywtv0YcHIlyTDzlVtrrBkg4o+C1EHxHuZyWzmbuytuIainkn7io7YcR0JGFsBw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+FNun8//Pks/7FZc4CaiSdn/f9Ec4vwbw/wl9dV6wfAPMCmVE
	aAYIrbekTxvUXM5yee2lvlrka0fX1AOJqDKOG/ffizyIzWNSdZvZ7USO3dCFxCFWX2ABxMi8HcM
	pQyh8pqjTVoy5av4Qh1U+XxgfU1AejSRKaQs1X069E9+57KWdyUhSFShTupK6
X-Gm-Gg: ASbGncumEY+QiZd4OO7eKlqaJwjg3QBhZQjMTH7QOjP8dGQ8JyxA6RMCisITyv6U/lq
	hMbaCURgfI3IRSbuKTKbDXbgOiS008jqKZ8wfsZIC9ImpQTbnilrg6Zgaf8jGyRPIlCaRHgKLjD
	tdqK31TxW0ymQT9I5vCbrvb34kzuVHzBviJfjnFE7O5Y71FJ2APxFKzaTeo01hdMN2+q7B+n2FP
	pIYVtmxNV0Dw6zF3yfiDwpPKAYG22SQwXruNI+RZqTTLF2/flPR5BxLnsE0ZGySr5aK7M7FeRrO
	hrFRIBOhS21cLaIBLALHelvdQ8fPTaPvj+xBl0rYaMcDkTLJ/k8BftY92Oi3tQ==
X-Received: by 2002:a17:902:c409:b0:215:5935:7eef with SMTP id d9443c01a7336-21dd7d78cafmr447489395ad.22.1738693703144;
        Tue, 04 Feb 2025 10:28:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWfHpkj5rPvOMiaCxTkUUngfXcOxXuZuG9TuF99jRCZHmEMKHu4h4bQdbh48P+jn6RklMqtQ==
X-Received: by 2002:a17:902:c409:b0:215:5935:7eef with SMTP id d9443c01a7336-21dd7d78cafmr447489045ad.22.1738693702763;
        Tue, 04 Feb 2025 10:28:22 -0800 (PST)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfdb81bsm13773004a91.49.2025.02.04.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:28:22 -0800 (PST)
Message-ID: <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:28:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
 <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kQcE7eKw7N2SrODcoyv6FvEmReWVPDXI
X-Proofpoint-GUID: kQcE7eKw7N2SrODcoyv6FvEmReWVPDXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=743
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102825_116690_47C249F6 
X-CRM114-Status: GOOD (  11.93  )
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

On 2/3/2025 8:41 PM, Aditya Kumar Singh wrote:
> On 2/4/25 03:14, Aloka Dixit wrote:
>> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
>> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
>> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
>> the same pointer. Instead store the pointer and pass it to the
>> latter two functions.
>>
> 
> Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?
> 
>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>> ---
> 
> 

No, only ath12k patches are tested hence no tag here for ath11k.
This patch doesn't change handling functionally and I confirmed that all 
places using 'tx_arvif' first do NULL check because the refactored 
function can return NULL. Functions ath11k_mac_setup_bcn_tmpl_mbssid() 
and ath11k_mac_setup_bcn_tmpl_ema() always receive a non-NULL value now 
because the caller ath11k_mac_setup_bcn_tmpl() sets 'tx_arvif = arvif' 
whenever applicable.

