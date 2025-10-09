Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE80CCA470
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izHl2XA8Y46KuYAqY1gGV/8UKFs8P8nAtkMQJrm+XSQ=; b=3JrkL9oSVEUrPBp7dtl3WaAbY4
	Hd0y3r4hhnoGrHdKtuWWDul/K1y45sF7i06AkFUwlnRiA+GKIQlzB/lLvaqBBvslXzrcbfGq3mn1w
	ZcVe0Jlu9Fmx9TgMKTD1IMmfjCDMTec8VB+q7kDACJJVKeScOfC2o7W10HjTE23+qrzm43nCOI0sN
	zet4Z7HmifupNQ+cFsaL3ACL+5No4OCpAcLKDD01bbqxWj56HX/wAD2BHFGwI7laBZ+ZyORkBhr3U
	KOpjI7+bVmlmxDZzXcOIRf0NaM8AvDudhn3+Xe757JLzJQflqnqeFw5ccKhPJ7GHRn8bMXCQiYBBT
	P+c84Otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l6E-00000005NZD-1qIm;
	Thu, 09 Oct 2025 07:30:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l6C-00000005NYC-1pFb
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 07:30:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJfr019131
	for <ath12k@lists.infradead.org>; Thu, 9 Oct 2025 07:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izHl2XA8Y46KuYAqY1gGV/8UKFs8P8nAtkMQJrm+XSQ=; b=FBsk4/pghzH1KS5q
	IZ5nPyynR2tD6u+r9DgNnGmoTLXEH1iimf4D7AnC1djsutRAT6m5Qx0MxJo4XZgt
	2Urw7PSVTIMLVR9ZBCXzG4m2qbLGwmIWBPBRXdx726h/bzYiiL8+mq8gp38slGjJ
	NZR6D2bFbVuJG9eXEgOQ03e9dn3A1USXjb1J/uuRt3YMeTiT1PT/hTQoexvb8gdB
	T59Pyv+r2aggBBQ9hMjO3nfwnT2yS0ib70zx7Ie/0tVuL5Bl6aPcgkRunJQ3sAc8
	h0R9Fm0U5faRot0SSdFMMkQaOkKTRuRfere98t4fRrzlm8FijlXJyVIX4tk1bBUu
	2z+QIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nsv6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 07:30:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781253de15aso1991251b3a.2
        for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995001; x=1760599801;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izHl2XA8Y46KuYAqY1gGV/8UKFs8P8nAtkMQJrm+XSQ=;
        b=mus7MG5nLwuZYY1QYGEtBX6r1ISpBZHDjDawD8Jk3ADX4fvM0Q03sUxO0AQI08xqRn
         KaUjggUE6sL2g0Nx0rBRNC8R62EU9R74eMsUK4/extlmg38XOeFkPjTIfHQAGz8HsMkw
         4myKuYirTCJGlqDGJphpWyq1GZXkehr4M944obxhYLZZK0JyRNdtH2fQnv+Zqlted4RM
         AFes2Et8Z98zmsdkQBdep+uyxfiLLMGjH+si29gJWtbaYhwjClfTeb9kqIpJVqzA+MvY
         lHrwmRCsftrHmM+h62nJ+XzXBf/Z8kNugnuZkMHU/XTeGwiowYR4sMtuAYR/T8dIqbAa
         DUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+lea+7ivG6DNeoEPyWwBBg9xpjGcoGqiX+1nwcGtB0ieBvVrkzG16LnqRKaKOMlfqI9V6fY0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNpkWesc4eRycKafyrblnoy8E2qjSuBF8qbOMXaHxThYSJUFsF
	nM3tOUd1w1jsUzOO/hI71OaZ5J6xR3FkNMebJGAE79XN3QcBnu7XuWp6EzKovFgWfON/WsDv44X
	j0at9iT/EvzwmVUXdYVCj0v/Lmsm2jHlyP07Ha9cxu92eeJgnkF23iPszr4Djq67R
X-Gm-Gg: ASbGncvuPK/fSVjlb7WBp93KiYaf/+GGZN6/y1bXK4q3UoyZ4GM++wuhvKUY+yGHiVC
	8EK1+/c1tYlkTD+b3WqcNDlTWWaccbSNIhsgEZ4WHyHyc5A1kB8T5D/ZUOs+jdtN32GCp+uvFqZ
	gM6JAq/YagrUoveL5nky/CW9LWcvUjpN8Zgwg3Qkl6UdpgjM8YqMgsq5OfzPOByzzba1fDpK36O
	Q9JxS9UIu2QZI+xZCZDX9Jn7d8aambOXcUV8qHCogmThQliXjWvtPysjTIhFX9PY3Qui4gUB7WX
	zM5BdALZAfIpuFB7GvCG4xsTGFANIzCBFy3vypJVJTG/9Bwc07JQ26AcQ5ik2syYwSE3ewtfTOS
	MbtCUSuqbaCvN+DyjKYDA9P4iKw106vV5O/0vrH8g9iE=
X-Received: by 2002:a05:6a00:9a4:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-79385324dcamr7614568b3a.5.1759995001361;
        Thu, 09 Oct 2025 00:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF20Y9+6vH3jpIxlSpjec++tzldizd9+WSgJ4Ckq5PIP+pv/YrbqEOv18ATJmL4B9IcgI6ziw==
X-Received: by 2002:a05:6a00:9a4:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-79385324dcamr7614537b3a.5.1759995000798;
        Thu, 09 Oct 2025 00:30:00 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5a1d8sm1928981b3a.39.2025.10.09.00.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:30:00 -0700 (PDT)
Message-ID: <e28f2257-ad21-40cf-b071-60807bef3be2@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:29:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Improve RX Error Handling and
 Debug Visibility
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AF8JDNnGDo0FLbFUCak83m8mI-jS2HlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0GIKc8JBYghc
 EwVWvl294oJv/QcN4o/5P+Czl0qrfq+32jmpT9r9/sz7lpjmkZqCY1BtzLhHXfY5IaweG8cdXgD
 CUVH3JMppuDubhUkLqWTl4FRXAlhxlABaWAQmeGiYvArUiqUpi9jJmGM70vWAiaYQeO2zYfr7yj
 9hPeSsuz2lLOJoRWhQUOURiEK5VMTMHtf/kBUFFdZy2cvZFLPw3F87RAqhufz9YN3+t+e2bLL/K
 h2Vo5cDMaUvbAk2IdH+9IMdNBKEYF/n6J33HSSw1NidSf7q2fO1n9auK1aZf27fPWAosAYVX2iY
 t7MKB2VzmzJI3RIUUyp4Yjj68RLK87guZ1XUFxHLFWMifBxDTzCZqvlIdBL+ETMr4NsNKTrWYKG
 Xgf6qCBLJiPJP49JmGHa9qUF1CHXwA==
X-Proofpoint-GUID: AF8JDNnGDo0FLbFUCak83m8mI-jS2HlV
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7647b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Bq-bgh1W-fqbGKBxPPAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_003004_604853_0328E800 
X-CRM114-Status: GOOD (  10.05  )
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



On 9/30/2025 5:15 PM, Sarika Sharma wrote:
> Fix buffer leak and potential crash in RX error path. Drop MSDU
> buffer-type packets received on the REO exception ring from
> unassociated peers, as they are not parsed but their buffers are not
> freed. Add debug counter reo_excep_msdu_buf_type in
> ath12k_debugfs_dump_device_dp_stats() to track dropped packets
> and aid debugging.
> 
> Sarika Sharma (2):
>   wifi: ath12k: Fix MSDU buffer types handling in RX error path
>   wifi: ath12k: track dropped MSDU buffer type packets in REO exception
>     ring
> 
>  drivers/net/wireless/ath/ath12k/core.h    |  1 +
>  drivers/net/wireless/ath/ath12k/debugfs.c |  5 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c   | 72 +++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/hal_rx.c  | 10 +---
>  4 files changed, 73 insertions(+), 15 deletions(-)
> 
> 
> base-commit: 58a0a7a45feaf4538841afe8e251737bf7c56607

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


