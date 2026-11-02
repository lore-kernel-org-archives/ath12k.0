Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D260A2602
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJ1GSAdH;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MRh/OY9F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLw63J9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=; b=aJ1GSAdHIcdkp1
	VYw4Pv/irwkh/5fSFnJQJhISwrJ+oj/QaEqh/XwIK4Yk7x20M23EN+9WwGYWbOgM9l3aVBUsLwopA
	G8X7m0QnUjXmzHpwDTEJ1fRTpw9kSoaZUfSBBqRR/BgKGS7bvBNCHWrPCwO9MZO3rHmZWyFJDH92l
	S+cpc/LlgZMYqRrSfD6FEdGOHdo0hLd+od9kNC7xxloqb6Ht1fCh+UE4iPQLbjfebDF13zcQHUPJ8
	BIBSx6MQwv0i3W8LPZBRd5UC/I+FcktX4HEw01Ln3EgPnZwoM7964LNK8AIkw0q7iu4AM2JYzomY2
	ozlf77Fk1raSdwaRzPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn0V-0000000FpAk-33GK;
	Mon, 02 Nov 2026 08:03:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn0S-0000000Fp9A-1kD0
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 08:03:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vLV71676210
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 08:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=; b=MRh/OY9FT5UJBspw
	BLi3nxzPJ5B78cgCaFdVqjMwS3VwIwDYR7pu0Dqh4oKeKEDRZWhiReCqfBFK0XD0
	cxCpKDfr79LXqAmWgQqxl82nqHhSykSsXyw7Hibl2xR3raia7bvarLaQZ4R94JpE
	TvqCmCNouCEDpOGoYZgC6WPbjdnQjzxJ1fBi4CK0N3O8D4xpjY8qMNADBlyrz3G8
	Hpqw8lKLjmBD3UUIiGEcK4jzcdiuIlDcEanq/Z1vtL6nfDfDd7XjosjOFvzxsEi3
	GiMBVdEBN+TfENR8l5yXZE/9xiEf/dwxhhfVtknkEpNVRvr+34PCH0mCjtYjzWgi
	tLFTXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wsy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 08:03:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so1728723b3a.0
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 00:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793606582; x=1794211382; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=;
        b=FLw63J9NCMiFK+Y60Z5SXP/if+KEBBNYG/ojLBO0HxuKmbfB6ChFsQnQ6T1OfxQGze
         VxZddMKDgqLU24/wZx/TFfZAvcucR2FA9EPHWpmfHU8vH3T1wSWN5SKGLD4MoVILyQvQ
         jCcoUfRTSuKy4Wjf/7NWEa5LSIokf9RqvzHVHvvZ15PLMPRE/yCfUb7isFlCV5zhGise
         Pu/IN1srBzs6DmmA0452ixceoGrI6Qxe5KEhq18tCxROxoQPGsTsiea/OZ898A/ZpC5h
         a4UTuJm4NZXvWSxKO/nUyB+p7yGls3UCFL7RyTFs/haDUyQT6CPkprB931B7CUzX8XIw
         g/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606582; x=1794211382;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=;
        b=EWo7jUK1N4+cHSfWc+/d0+czj9Ig9p5ulzf9hQti9TtOOj+Fxg9i6YkgicHnB7VicV
         tG/VBGCfxfKaFsO9V+GcotBHqOlQNK6jB4hPGZVxd/WOUSBWOiAB+X2WKoQeTuRJzB1q
         W7/JHZ1ft+pMyd56PIk7liv8DnJsCufKRAbGBMVShaa4pCPcSLH6IIxvjXP8xXbyzhjk
         5YJ39UceoszgYJIHmAZnuXF1KRF0VY0sPYU72Vh7PSleqkmc+BJvXG0rOkCAr5jcEBdH
         wms8TkSOaqaFE6C33VP1r3/NRlVmofsUGdzPQvaxhNswTcBq1F6mydud2ONaOKjxY6y7
         Lufw==
X-Forwarded-Encrypted: i=1; AKwUvBwXEr4xQ5OURZyGoJ8miwl683H0ymyJoraeOZXJv8M8as4d0oiANa2lfqHRc4D44AoZ/e5TBYM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9NGQxTkfnfJA/wjRLwNLLJiJ2LRwhCENKN2HUB8uwX4ZeoJqsL
	q/spi8Zoo89MqIImHJvkI6PYhaHdlzfCGiRCUsSMCnucUqSSwVEMQSfolDe3sNiZxwslTM7yeZe
	EpEViY5f5Xa5uFVTjSCo/QxOj2rA/QfgpOX0gny8FKhpj90frQCsYLMZf9sVIsOii
X-Gm-Gg: AYBFou0NwQKiT7BcMOgLAbDS4x4XHSxMR+nGL7/N0KtQfzWPYVpar4pV7Wexwc/c5v5
	z+EXt2rrFqtzFpoGe69XVHrfSiytDZC9NQfcyno+Yn7rnEkohRIDkMsobzGGLiuT0izZaa8TplJ
	Wq+bufgUn+XrEeGVi6s72J2sgqWqDEmzJ+HM0ba5Ecbyl5W56IV5HvbzwpoQuOOQyM7QCD7KPGF
	IAkDTap9YjLSyjcSRB7CubJFfoudRbLVL9FIEEi2WyiX0RuUWe6q0hcnmzpUtOIYKTCP12RnUwc
	/Qn6thgyOiBvcZNrfFNHrlIi0t9XhLqqf3/4Z2tiRIjzfuROURzTRSZkJmm2QfMpGnFOYvs4UH5
	0BWjWNKdXhWJkFlqlO+p9dH+tsR1tPWUtwjj7wTxOJPsgBVGYyGSfr9D+3jj2hAjmS0nXtTvdMP
	Of2hKem32VLMePhCYZipNhnLC9gE/IhqRyMMfKsR4FDax2
X-Received: by 2002:a05:6a00:6988:b0:8a0:8848:8c28 with SMTP id d2e1a72fcca58-8a9bb0cf0f5mr5846940b3a.2.1793606580949;
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
X-Received: by 2002:a05:6a00:6988:b0:8a0:8848:8c28 with SMTP id d2e1a72fcca58-8a9bb0cf0f5mr5846925b3a.2.1793606580450;
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fcb8dsm1710896b3a.1.2026.11.02.00.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
Message-ID: <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:02:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on
 QCC2072
To: Burke Cates <burke.cates@gmail.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
 <20261030041902.2740757-1-burke.cates@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030041902.2740757-1-burke.cates@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XaFzCqyNLgIZnRBR0PnRaBIQIQOIyOb_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX4/w1EpaO+gcy
 Pm26XKU4HdDIIQpFuHFP9MiWgpD7U75Vmzd1A9xt3zZcY9f6VOkskvIAoPpA2wEJUJtysXKSDQh
 m4QpGHba4enzrGPraOWnoIyNAAVNRIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX1hs89LhqVptY
 ZoJFiFBimF4exRfeSDnathZZrWs8blm9CHri8lGlk9gwjpFLOt5KRGf/n+bK3tNsOLncQrkTPNd
 /uJM9mrAwVodGtarav+X9Psep2xROgnXbCoL9dyNoy3FodojGcG/rZCPBHr0yLmyVqTmNQU7RCQ
 eMvAo8XvMPhKRSBo5KQ4kebyBum8zLGBQhx/Cm2a7luq7Q5SwFgDacvq1Tpw8hvo9BKbh/h1VX5
 MRORpXRErEsx1uGlmq+QhcBCh9mOo6ZfQofbDzu51v157YqtWKbuVOF8QhmnpY2wRb5H8mLxKo9
 EU5nvqjdX3jp9PycvOnW9n+aVJUdTuQXGd5c8QoUhFIS9Xk4ZUABePC3+gYsqKV98pzkoNMNXqS
 rXlnvJzsmheAi9GRkAyLNsKUGETfwivBAjux5wf1+9xQezrChqnw/53w9qzOwj1Niwk/endsTsV
 5AM97ujgkcBXSGhFuxw==
X-Proofpoint-GUID: XaFzCqyNLgIZnRBR0PnRaBIQIQOIyOb_
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae843b7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_XthKnSfGIqTua6Bb7wA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000304_587335_A362D862 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/2026 12:19 PM, Burke Cates wrote:
> On Sat, Aug 15, 2026 at 09:43:29AM +0800, Miaoqing Pan wrote:
>> This is observed on QCC2072 where EAPOL M3 uses the MLD address,
>>
>>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
> 
> I hit this on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite)
> with the on-board QCC2072: Wi-Fi 7 MLO SSIDs (SAE, PMF required; one
> 6 GHz-only, one 2.4+5+6 GHz) failed with reason 15 whatever the
> association link, with M3 dropped by mac80211. Non-MLO WPA2-PSK on
> 5 GHz was fine.
> 
> With this patch, applied as posted, both MLO SSIDs connect. I tested
> on v7.3-rc5 and again on v7.3, each plus out-of-tree Glymur
> platform/board patches; on v7.3 the tri-band SSID connected as MLO
> (on its 6 GHz link) and rejoined MLO after s2idle resume. That tree
> also carries your separate dp_peer fix (8b6b871332b5, "Fix failure to
> create ath12k_dp_peer on MLO reconnect"). I haven't tried the rebase
> onto ath/main that Jeff asked for.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
> 
> AI coding assistants helped run these tests and draft this reply; the
> results are from the hardware runs.
> 
Hi Burke, can you please try if below series can fix your issue as well?

https://lore.kernel.org/all/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com/

