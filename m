Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F1CCA9EC5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=; b=MaeHN7XUMQarBk44bU6r7gNIpj
	/QND2Lwx/JaVEKWCrDpH6PlCWIqSKuVb5eibaSlljgsk6qTK1klYV6QQxhhNj49p8lGZdmNH4Ctup
	vzk9fTM3hxZO7eLZs9zYrlHw1Iv7DjzTr0lQrVwJigbjRciEOE8NcswFzdNcIR4roZGDZ1feP66k/
	LJjB/fTgcp6OaagpSK8dtL2X9PoIDj9MZFJIY5NYGwkWQviu9JZAQm/MLoClfYiqGA14bAkDvH4lo
	lUl+G8/mhm90gBT2+Qs0qb/psj4Kmu9dvIcQXfg3IVXg1KNGvt1M5Bpd5wq2kQGT+lFEX1A5xWBaa
	gXsXQfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG7D-0000000AZoq-06DJ;
	Mon, 12 Oct 2026 13:30:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG75-0000000AZm2-3Rzl
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 13:30:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0d0e2679953
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 13:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=; b=VR2ouf4cUZVIQt51
	rQ0Gk3U7np8d4hWDD9HCz81ABtp9bj6+iNzJY9G719oy62dxzwFuvWaPKuzktJbh
	8i36bQ2v2uwvFp3ydMT43bSnS3yA13MrvYlvV8VWjUp4clORHe6w2+bHFQ6KzDVJ
	1m3G904t0QMMd+5OLM3pexrr/xAndtKCxyoDMimRpRPktYgadljnVsCFT7l7iAEe
	ZNVk5GQxEOnfjpOGdqjo577p2vKhhg0Fnk+2sSDAxx26RYdYVX+xKRneN8FvoCV4
	XHEsHgKeyxsWnpVpBeMlZM/Al108UV77sLS3vo4fUn4KtNNZQ3wTtLCX5q/p+ZZC
	1a1ndg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1t4xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 13:30:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so5645545eec.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811845; x=1792416645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=TDcJwmrxQN4QkKUcRT/H6+vXSiKQdfHBXO6hikkrUW1Cd6t5FvA40Jtii52KqiQMyB
         auCgZuJ8ri/cTRVo6GwBxeTMe+vDork12dLaEnkYx8yRoY9FZab/0x2LU/c6cIm0bLlt
         vTgj78NUy3/8WPq/iNJJorATCmXREcZUJYadkPPlrTIyYX9+ab6bI80NaNd8b6jc/cq7
         kmQGhrX/TxvUBZuWy39CBSxOpd2iEH1Koe3XjqGoAjvs0EFdpOUdPGQmvI0o38sFasCI
         apzpl6CS9cbfsb4bTXH9nd7cDo1ayYTWiVUYCEnPfQ4hu9Ov3Qfnz7byYggGZGRpg57f
         1SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811845; x=1792416645;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=xPxkrG7zLWERuBcdy410loPbQYG449X+0wKN5VNGxln6J4+6MtZcawjUK3jWglw9Pi
         JiD72z1jhXwHdcQTYDgaP+uaJOccQBuClshIOybzq7mJOENPbpWzqqI6Mt643jqTYu61
         i9V6kyOVGTs/tAx7BKRXuyX3cIj9+YDIpsX7SlsUBmvgGDxvHU72pCjt5jHKos0gVn8i
         kAJdEsisJCh0qFWFcva37RmRbFNYRjBE0tVLSmD/5gA9ydmxQOS4dy7ccR81OJ5PdjOG
         QA2P8kHCljeQsifbRGGdaneHBKb2KWPyntKudsY3cAWkRtx6AL5FylWOiD2oc8mdys+2
         PlwA==
X-Forwarded-Encrypted: i=1; AKwUvByj4uBGXBq4EC3Q8GD07zYKG/XCpK91yXEHXOE9IRizBG6kusmu38IdxUGT6NaoMpZfquAOGWs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIO5PfD9Poc8e4EuUYg/E0qUtorkX/TM5Y9jY2Ecx+5LUegymBW
	xZ5t6JmnZb7QjPljZLFaxHiBYF1gDfzO6whPNhR0w6dKSvpAf3EkvSAnoGHLeJG3KkRQDDKbjFQ
	B0yXqzldMQXus+7fM4BAJGOEehUkGvxreDe/v8yNPPwPYlzAhPL/D0s3VkIvxLXsC
X-Gm-Gg: AYBFou1yw1MowIHJ5fk/7Rgcmpc9EHosx5bcqvVHV2kAskQZREYOIpOew0RZ6S/AFJN
	AJxlyTetw9JqUCuCQqsCxcgbSXXQRX0accjwy7qvOHxlWe0Wra3uOZG3gQIJs/2MErnPwOZwJwj
	wg/f7XqfzG61kKYhcFbqELphxfKZAim9nBHlXR0qeV1e02qdKsz3PxJwkrec5j+ECYdx3g+YsJc
	FdIaVVhYltYf8MIIyJtUcrQKF+PeibcyCNESxojIo+7YnuXHaAkIWou8aIeje1QsiyIYUvJk1YC
	Xlc0HhDc6hoK7/rG8VHkjbpDoMPyVZBS6oyJV3yprS8xHW/KHj1QG7/DSyizK+xa1/Ret+H7eNP
	SA0WKMT79wYxx1toPTI9App5Tybku6iYSUQm+c0gKVYvcZEN/jqpf8pqoBLwk
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590135eec.33.1791811845101;
        Mon, 12 Oct 2026 06:30:45 -0700 (PDT)
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590058eec.33.1791811844129;
        Mon, 12 Oct 2026 06:30:44 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44711556eec.9.2026.10.12.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:30:43 -0700 (PDT)
Message-ID: <92649385-8437-4391-a233-bdb59cc600c6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:30:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QOFGUmHdvaH9cNqSFrPRoXWkMZpfdUjA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX9tir+9MIt+fX
 mh1UGftuHH0M7ysSmz3qT5z3OjNf7Klv2aqSBE0KQeH98s/K+RhtzNw1GAwKvn6wQCsm5h9CnhV
 5hdlaXvsSYj0fB3ID6ZPgKtOfLXS20g=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acce106 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b8Ip5u2rk5lctkbpsk0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: QOFGUmHdvaH9cNqSFrPRoXWkMZpfdUjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0I+/N14a8tXk
 WXnjN5YV43sCyshdMZ/bBTy498hUiGuR6NNQgFdk9nBoUUiHgId0SsdZYvSr9PEhRCQlUHEz0Ar
 CgoSZ6bDVIZ8uwwaTucIpFH+B+XOaTdRDLd4onXj36I3TWtJmpsDvU95XsD+mvKsRzEsOQ/GrZ0
 8sp4ZhdgzUqYAoKCnD9NF4XdAlrRMDJ4MU9VoyJBlymc7MqIu/6S7b34HEHdap1gmp2DOCMx5gW
 HBI9LvznO8eQ6Nn30Wb83QXhaX7hZ8QB4fk6Lkv20j/hrBPCDPKthSrMb6seTY3feDBnimCTMZ7
 vJSLWS4ryFWwhXHb8tUO63hyqp9oyIfl35y8lTOwDkVkr7+Y0TV4tC1VsULel7yKBFtdYThBK2K
 BOU33DmAjqMEI5L8Ywe3iWzXB8Qof/hev/v+bLkinqt9GuMw1XHuTr6TW8W/K88hwXH8YCyuKf7
 ILX4uU4WyvaJdZksciQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_063048_607087_ECF98E84 
X-CRM114-Status: GOOD (  15.09  )
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

On 10/11/2026 10:52 PM, Baochen Qiang wrote:
> 
> 
> On 10/3/2026 5:20 PM, Jiale Yao wrote:
>> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
>> the current entry. idr_for_each() retains radix-tree iterator state across
>> the callback, so that removal can invalidate the walk.
>>
>> Use idr_for_each_entry() in each cleanup path. It performs a fresh
>> idr_get_next() lookup for every iteration, allowing the current entry to
>> be removed safely before its skb is released. Keeping the existing locked
>> removal helpers also ensures that a concurrent TX completion cannot find
>> an IDR entry which points to an already freed skb.
>>
>> Changes in v2:
>> - Rework the ath11k and ath12k pending management TX cleanup patches to
>>   remove each IDR entry before freeing its skb, as pointed out by
>>   Rameshkumar and Jeff.
>> - Use idr_for_each_entry() for the pending cleanup callers instead of
>>   leaving freed skb pointers in the IDR until idr_destroy().
>>
>> Jiale Yao (5):
>>   wifi: ath10k: avoid IDR mutation during TX cleanup
>>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
>>
>>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>>  7 files changed, 44 insertions(+), 39 deletions(-)
>>
> 
> if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
> separate future fix:
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Since the UAF potential is pre-existing, let's fix that separately.
So this series fixes the IDR mutation and another fixes the possible skb UAF.

/jeff

