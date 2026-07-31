Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636F6C55173
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjZ1dS7XAax/+9FcNAokaI+tqJjGNUhP8Vc5FzSLpsI=; b=ECI2fVxCSfE0ZEQz0ZXqT22hei
	NUzKYkQzEdSiRLzmrhzZ/sE4kaM8f+xsFeb+WIOk6vYvdRV8wAuNYoklKruhDlDOleajzUVtnS/t+
	y4r0oxpMgKRGSMFo2EpkTuJycrr0y4tl24pKfqMAuWINNXA5puyhm7pEveeRy0IJtJrIF+uldD2gZ
	dnm2m/tS39r/Jga7wzanp2izwBs0vwTQSnlaePlmEaSGClXZwt42EjyCyXo8cR6gBUOPxdKvd2D+K
	gy8qf9Q3pNeeEgKkIiWHeaMsVEHxxYqIM4H6KvBJIPkT6DgYuqRoxZT9LWFEoRjnKKeT2HW+3LRKC
	hSf9YDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprp3-0000000DLNT-0OMG;
	Fri, 31 Jul 2026 18:19:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpros-0000000DLKX-1cZ5
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 18:18:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFP7vc021895
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 18:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjZ1dS7XAax/+9FcNAokaI+tqJjGNUhP8Vc5FzSLpsI=; b=mCJCU2PCCkprVW46
	i64BvP6S0yjHnCJaiY5UKZ4me1Dljv7a9FRWOYeETOF3QzWgMWe86fMSCUtFuAUg
	mpYnooVZlbJLkfMXT8cKYwTfjb0CKKveYcQ0WB4bliueUnK9kDMqYpSTVDZb4d2b
	ZGVRsnyB3YN6Lx5qMIH6VZOLKEccaL3o77y8nUiYhY6vRbgQ+mEcBhfhUxs0szF7
	sYCC+Fm54ma3cNT7J3VLSrrUeZneaJCvL8krorvkcU0CfvGOJclMBBQUBx63IU7d
	ScSsIsO/HpIFdaL/TP6tLWpFgCo1fWQ7cFINB2j2p5O+bGh9O1HOlTOWi2AFONEI
	GvHPzQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh1pdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 18:18:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2190548a12.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521933; x=1786126733; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjZ1dS7XAax/+9FcNAokaI+tqJjGNUhP8Vc5FzSLpsI=;
        b=StBfIsQ30yBWOCN8Xn57X9dqhC0K8ucwZIqrHtiDr9cw296N0PfLNr9dH5mLFTGXio
         ynBaKMRL7YwpNyESg21vgZdCiU0b8pMpb+sfR8198jGr+6rYMAoZn/b7EV+O/P7KbR9q
         Q2VkijGgzRIoUV6rs30ENa+vywlZ/Rskojsu9aTwAOwF0FeJ7E4s1OMZQDsS0Tprin0f
         DPmfIlvD6YShPV083PcQSP15FNchjJVjq1jGH0fS3m7Fe2ItnF9/GLJ/HheSZGN+8tES
         UsJ3P/4O7GYb5iJXivrWlsFAGCxnBwOjxOJAHMYXPZqkr2BdoT8gc8QxlYLoQCatYYRi
         zjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521933; x=1786126733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjZ1dS7XAax/+9FcNAokaI+tqJjGNUhP8Vc5FzSLpsI=;
        b=CyvItsKh4nLcx32tTz0dEsqCrVYXoCMWqRez4M0mNlFPbj6jJT8CTLLM9FR9w+hshm
         21a3G08l3bv2B7SdKL8CWTZZG+3SaskI9mVxmxbXdvla5dxjZq3OUU1WpTKXvgtf9+xy
         0MfZ7WnC76uQmVB/A83TNrBoviOlIc4JMgvzsT67xEkaludEXc4iP6osAsp3f577k2eJ
         s1AOvAjs/A5CLl2eDnB6IKJXItpARxFNgvfIm22hZQNrKuLd7vQ3XYkn4aulsmIisF8R
         TsRzLtmvZ8rXixN7gcuTvOsjrRTc3JqsRIhfBqnQg26KRZWg9FohjzxA07ckqBY058Hs
         u3/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpzv6B/SxwRLauteHHruSDh3+ldw1KMo+4eF9+7Jlvit8LjxKSrFV2wDq4PZfsSYDxCCpu2vPk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrStfzw3ab59CZHMb+IDgCKAsw7JFvwN/srU4OzcKNPK5DIiwo
	08ddy3iwasFy0CYKaFnAKoDq176JTyzrJFMP31S4YWLOx26Ne3MNtTdASSk/t9Iv7QIr2dIq5iH
	qaVztSmFvkQRBhpXudE1+RAgMUUrjo/fh9XnoY3gpGUqNsdys+RmelQLs/UgTnjBc
X-Gm-Gg: AR+sD127ncc5gTboR3Wrcry9Skzac20vKpifo+n3YgYyrCfC3rLwvgyC6H7uZejoHVS
	cUj/GBoJwvXT83p+bFIeV9nzfN83X5miwooCkrJTNfZeW9L9RFwGhubN5OZUYWSkSyHQZhdRQcw
	esJYAgq4Xlz1c5XwY14OSqdLYnce3Vo1fDWexFX1FwRTujYD5Wb3K1/Yh4khLO0qgbTbOqklxUT
	iwWRvumxEnG9luySka/jF3IdUtyNcU15DjfZNwPilyUZ3Bkd8/nUM5/csbIpodX5MukSvt/NDfC
	/gAfKzY7dNoco3Efq8Nus4hxwOm39FAnngGTvecFwjF7YCGyZkcZSfq0iJdCxMqnvLY+KXqsKBW
	iiPYIA+P6FzXNxcx6Nsld83zY4W/os/DYLJgQGoMZcdYj+4DuGn93Zg129zU4
X-Received: by 2002:a05:6a21:600a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c92a5cd5e8mr779485637.19.1785521933036;
        Fri, 31 Jul 2026 11:18:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:600a:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3c92a5cd5e8mr779462637.19.1785521932566;
        Fri, 31 Jul 2026 11:18:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm7754080eec.20.2026.07.31.11.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
Message-ID: <8dcc424b-32b1-4152-b75b-10bdac0af9d8@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:18:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ath12k: NULL deref in ath12k_mac_op_hw_scan() when a scan
 is requested during firmware recovery (IPQ5332 + QCN9274)
To: Kamil Bienkiewicz <perceivalpercy@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
References: <20260731094141.2410630-1-perceivalpercy@gmail.com>
 <20260731175103.1745248-1-perceivalpercy@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260731175103.1745248-1-perceivalpercy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MCBTYWx0ZWRfXwJm3POxMKnMy
 K+ExWpAlEfJQEiGHVWnYu2RpxIfr1fLQUB6jkTVZ/80d+2JBF9ATYwyIGGYf5qPHKWH7EiAiPhQ
 4frfYo1/S/HbhfjsBHEvCEpEi2ubhsNL+bXA3GImAI8zhQ6EELgydbK4RV01Bb2m8sc8UhVKPUb
 v64uNYAlwHL/qEhRWZqPkTw8mL8TTBxbv2IQcF//L7gCT/erMmlsP9nYXAiDgMMwq+kp9yCvDgp
 q+ZyHBkVeCPwtDmfWnBvT6oGleGVmyFdPCHgM19DeZxZk/2qHd+O6jQAoiKxtnPZBAzuI22Sbtb
 q8/qFzKIyARxYQCe4U74aQMjUQ/wJ5fp5FM0XjQ3RCc0NooUKHML89PnJF0nqTDyrrwH3BOOErZ
 Yd/gu/xJU2bC8x/WFimkdKVCmpeoDLjUquEzq9zXdL3CURgjML6txhHI850c+c8w/y+jEqbtAP8
 SWQqli+hZm2vJm3eCJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MCBTYWx0ZWRfX71gyxF7EqfWL
 68pEMZZDCuFJ5+zhA887ufGRBTASdkJ+DsIS79bP/kHpegZ89054q+/I+8W+DoKlLmJZ6Om8RkJ
 rr9hYKR+JSMa4UKM9648W8OzJ9Md7y0=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6ce70d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=sTRtGAPE7L7RgN1B:21 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=A4jFpDQB2FOHWKhnbncA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3zpwvh4PFhZsWGhe5fG7u_E_4MJzDKro
X-Proofpoint-GUID: 3zpwvh4PFhZsWGhe5fG7u_E_4MJzDKro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_111854_431762_E260241A 
X-CRM114-Status: GOOD (  28.05  )
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

On 7/31/2026 10:51 AM, Kamil Bienkiewicz wrote:
> On 7/31/2026, Jeff Johnson wrote:
>> Unless you reproduce this with the upstream kernel you should be reporting
>> this to the OpenWrt team, not here.
> 
> Understood, and I realise the taint makes this hard to act on. Two things
> that may change the calculus, and then I will happily take it elsewhere.
> 
> First, the reproduction you are asking for is not available to me: this
> board is IPQ5332 with the wifi7 AHB path, and that platform has no mainline
> support at all — there is no upstream kernel that boots it. So "reproduce on
> upstream" is not a bar I can clear on this hardware, rather than one I have
> not bothered with.
> 
> Second, and more usefully: the code that crashes carries no local changes.
> 
>   - ath12k_mac_op_hw_scan() in the backports tree we build is byte-identical
>     to drivers/net/wireless/ath/ath12k/mac.c in mainline master. I diffed the
>     whole function; there is no delta.
>   - None of the out-of-tree ath12k patches in our build touch the scan path.
>   - The condition that leaves the device un-recovered is also upstream code.
>     ath12k_core_reset() returns early when ATH12K_FLAG_QMI_FW_READY_COMPLETE
>     is unset (core.c, "ignore reset dev flags"), so a firmware crash during
>     early boot skips recovery entirely. Our tree only adds a clearer warning
>     and a coredump call at that point; the control flow is yours.
> 
> That is the whole failure: firmware dies before QMI ready, recovery is
> skipped by design, the device stays half-initialised, and an nl80211 scan
> arriving in that window dereferences a pointer that is not valid yet.
> Faulting address 0x1508 is a small structure offset from NULL, and the
> faulting task is hostapd — it is running the 20/40 MHz coexistence scan for
> a 40 MHz BSS on 2.4 GHz, and hostapd retries that on -EBUSY, so the driver
> gets asked repeatedly for the whole recovery window.
> 
> I am not asking you to take a fix on this evidence. But if the intended
> contract is that ath12k may be scanned while a reset has been skipped, then
> ath12k_mac_op_hw_scan() failing the scan (-EBUSY or -ENETDOWN) rather than
> dereferencing looks like the correct behaviour regardless of platform, and
> both mac80211 and hostapd handle a refused scan cleanly — hostapd already
> retries on -EBUSY today.
> 
> If you would still prefer this against OpenWrt, say so and I will file it
> there. I have full pstore dumps (dmesg-ramoops with the complete log from
> boot to oops) and a deterministic trigger, and I am happy to test any patch
> on this hardware.

I've cc'd the dev team to have a look at this issue.

There are quite a few error path patches in the pipeline, both internally from
Qualcomm and in public from the community, so if this hasn't already been
addressed, hopefully the dev team can do so. especially since the full
IPQ5332+QCN* support is under internal review.

/jeff

