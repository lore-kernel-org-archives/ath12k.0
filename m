Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CAEC5AD5A
	for <ath12k@archiver.kernel.org>; Wed, 12 Aug 2026 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Up2cNT+N8D3FeQZBU2m2F2swH7E31oQNst+RvFDzK70=; b=hr6AtEJ0S0AkIoPNKP5jbRIDUM
	V+sVwnFsWS80ExKLsAF05uZ7EquF3XaQr69a2eemYCpRLgHMHgq23YHnr8MZKij3unWzWeb0awjCA
	g1zPMIgpSxa49Nd7cYNnaHSXy7aYmUW6lZl1mHwt6p7uIpldcq9D3kJIWmOyd4nKbB3vV7J6A3Ul/
	lsPh5D1jiHCD1lMDIfq+AhhkZgUZ+VuYt9beTjmR24jJYxLy2Iu18XJqKmm/h8vk8CiJXoYVRH/po
	JMUf1Fh56Mcyo795ynIjToZ8arnHtcZnhuGQbIuzEDIChLaaKCfoeaN97l3BjOJY1Sbj9MX40qMaW
	jmtTvjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEgp-0000000Gtos-2CQ9;
	Wed, 12 Aug 2026 19:32:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEgm-0000000GtoV-4Bff
	for ath12k@lists.infradead.org;
	Wed, 12 Aug 2026 19:32:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8sE8382643
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 19:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Up2cNT+N8D3FeQZBU2m2F2swH7E31oQNst+RvFDzK70=; b=ZOiPzDv40R6nfG38
	u3FXKibzKxzqGA6XkEsqp1GluloXYyynAQiScD6pQL2lHgYV7KV1KJNNq5w5Drh3
	TQsriHpY6qTWjcs5lL0DLcHNME7s5G+D2ossPHxLdrzzT4c9e7d6gzObCkmADFy9
	ehg/j2zhobJYJ1gZ8lRjFs2t6PRQ3CJQQ9x+eMe67YHxvre8OjBvitmWo/KF1yNk
	XvqD617nDdlsgqrVZE/w7Ujn3x34zcT391qGJ6EEDZ4pZ4VRy8TNKvUMMC4naxc6
	qwqOpD9gJiN0i0NEeyAccMUn4jnW8w0KlOlarA50WCDstKpUQN/rA+aVfPrEW4xT
	dq4xWQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrkp17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 19:32:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1870250a12.3
        for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786563153; x=1787167953; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Up2cNT+N8D3FeQZBU2m2F2swH7E31oQNst+RvFDzK70=;
        b=YsR2K2P2aJj5F+d1mz53foFhMWU4Zo1fidLfQVrpqTfcg5YdGcIohbHpL8oKabsEyd
         jWywo8rUEOs5T9k+U3QjBq9RfHev1lG6lOPfTTS1S12XsFrXKAi3c1XzwcUdUv2eT2w9
         +LIn1WpjHFaSM2n8Tk/zPKBrjgDMx/R9gkQnRooKbX49Trrqd07kmkCz+n8FnEJWPAYT
         qoXsU5aPhxlTNkB+5JDH4ORBJbvEkzdmHrJfKs8bXpmiyo/q3RMdzIFW5h3dsZ5uAbNO
         8at6fZlHCsFQYcEZvGxZa+wNI+wzxSz+FFt2wguM8+/eqj3ZY4uxCG9TaNRxohQOQHFB
         TWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786563153; x=1787167953;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up2cNT+N8D3FeQZBU2m2F2swH7E31oQNst+RvFDzK70=;
        b=kAAE/06LJRZ/z1rv0BV7nRoD83j13xAcKXXoqkiuBXARpsJvCV6ZLpZvrwjsG+S7RG
         zrC4PC8fdrEd25Xc6Lq+CUuO+GxjZmcPSfqHsMrtWXg8S6gXsfcxdFcxFg2TST2kVyat
         mCx4g4dMYNtUx9F+toD1MOEY/+65ry3cokCe3ckas1MPaDnx8JhW1N2zLXgedSEXAu0D
         xJj6I6sbBAGY3yH7TDLXD6iBtTHZaE8QIt4sih+h2Gd8XUS3wukyGpTmphX1oWAdTCx4
         uwDhvZJ75P7LkNQDquUcwfeQzFM5rLQpAA/oCs4FZkgT21akaKbNsm2knh0Mvrr2N+s/
         4Kww==
X-Forwarded-Encrypted: i=1; AHgh+RqFFKQIc531M4QjpqkMUI7Wke6MQ0zVw8eMZPMWluPGdpckHq8RMT+pI2ys/25pJFuND3AuxYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEiLDuY7J7Zl7PFXgA1xFFY/MOR6yj26NzXWav44Fp93ynl2lu
	dgoZPQ9mNTiwUACot1MVFzg7NwZlnlcDLbXTeGCkmIbBz1VeuY63garFFl7IFdNUje6i16ndGdJ
	udNCazHUMWxdhALOfcR6lsI3MqQR6B1Qv1O8WW1cNjjlCivFi47ccsuzlsvMBotDT
X-Gm-Gg: AR+sD12Y/NgWm0QRpjG6rUsckWScXgQjtRgm6AvK2blIk84lHYvtKqsuf0QQnkL4lC2
	4qlAdurjrBg3JWaF/NCWyp7mm4dXN6upKcDi/hVFu5RLzZsw5zvxO1jJ5Q/A24z8sZq08ucgEfS
	OEvKw6PDPKqXv7/QR4VfMCwbmPlhuh72kKyXostS/AQNwruciroSjrlyCiRdL3l43X0cYAk7DK9
	Fo3APwlp42purAs35jMNhCir4qItNzWVr18CN28eRvib4uPrcED64vO06Gj/VrVpkeuL2ZThDKP
	5GCWNqW3j4NsjgjgTNjbD+M4uAAj0/zjIBOJZn+/4RZrdFBUtP1J6aIQUnppgEEY2Btqp80UiyF
	oUkzbx/Lb/cZe1HCcpMgyzzykIEcdvoQ4EXGgGORGtChm
X-Received: by 2002:a05:6300:408a:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cc55062a03mr995767637.8.1786563153313;
        Wed, 12 Aug 2026 12:32:33 -0700 (PDT)
X-Received: by 2002:a05:6300:408a:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cc55062a03mr995693637.8.1786563152701;
        Wed, 12 Aug 2026 12:32:32 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf67912dbsm14721752eec.22.2026.08.12.12.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 12:32:32 -0700 (PDT)
Message-ID: <142142f0-b7c6-4d64-9de1-9143cae86dad@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 01:02:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: advertise AP_VLAN interface mode for
 IPQ5332
To: Kamil Bienkiewicz <perceivalpercy@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260801004243.489010-1-perceivalpercy@gmail.com>
 <88d5042e-21e2-497c-b86d-3cdf8c0642dc@oss.qualcomm.com>
 <CAKXN084AmmjNWLM2fmczTpvDxr15t9-YmvZVCKGbO6TYzfOOrg@mail.gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKXN084AmmjNWLM2fmczTpvDxr15t9-YmvZVCKGbO6TYzfOOrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE1NiBTYWx0ZWRfX5D3OIFlU//bj
 Pv+B0aMWXKvRJKhCHC8FLheKARB1gdsX4FqyQYF/HzRgQAHGEj9r1YruJkPjgGi3A+69TWry4+g
 h6sKktHS8uqiZa4CqgTdoRXTM5j5gAerbLmqoZItDhvjRCWzUIzrkD5vi0RYZH4u3yMzKIrN04J
 /OaSra4V/txGjbRm+sz6qg/cSeKcots+Pr/jWfLOH43cwGhibBGibll847+Ovmi5O8M29ZhnThV
 +YWfmeT745eBtT9j+vDYAdrQSdtomaAKO/tkjQ+u69YOvutNoxzg7fAzEJ1chw0tNDxJITGUNfs
 0EzxRfG8YifZiXMMTDKD2XB6/BNoQAqTJToxRi9yM8Ahf7/+2sRho1XoS4fp4jBrXAQvMOuJ+Al
 HOUDA9HQH540qon2m9Ko08DztiWEOPcn+IvniYuYrCWBKB5wwx4tHmBx/cP0AyT1Cq6OKJlUXkx
 ixfQKGszzla61F4uW1Q==
X-Proofpoint-ORIG-GUID: N__rLw2joJkVQR8xRjlPWe8b4jDyVoCl
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7cca53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=FcZfrfRKbPvLg6eNy5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: N__rLw2joJkVQR8xRjlPWe8b4jDyVoCl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE1NiBTYWx0ZWRfX5i2+IsxvOWPR
 +WI7WXtlpckYKHII9pbhpMyMqhshv7Fj4+dd8MN/akWmNsLAgms8AjI4KbjPGskMSiOdsYZoFSN
 7vIbnS6gncH6o0NnyZe/JMICHJHGsRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_123237_345090_C818DD1E 
X-CRM114-Status: GOOD (  26.25  )
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

On 8/6/2026 10:41 AM, Kamil Bienkiewicz wrote:
> Esteemed Rameshkumar,
> 
> Thanks for the review and for the correction — you're right, and my commit
> message is wrong. I've verified it in the tree rather than argue it:
> 
> `cfg80211_iftype_allowed()` (net/wireless/util.c) short-circuits before
> `interface_modes` is consulted for the 4addr case:
> 
> case 0:
> if (is_vlan && is_4addr)
> return wiphy->flags & WIPHY_FLAG_4ADDR_AP;
> return wiphy->interface_modes & BIT(iftype);
> 
> and `WIPHY_FLAG_4ADDR_AP` is set unconditionally by mac80211 at alloc time,
> not gated on AP_VLAN being advertised (net/mac80211/main.c, in
> `ieee80211_alloc_hw_nm()`):
> 
> wiphy->flags |= WIPHY_FLAG_NETNS_OK |
> WIPHY_FLAG_4ADDR_AP |
> WIPHY_FLAG_4ADDR_STATION | ...
> 
> So the missing `NL80211_IFTYPE_AP_VLAN` bit cannot have blocked hostapd's WDS
> path, which sets NL80211_ATTR_4ADDR. The `check_swif == 1` case falls back to
> the same flag, so interface combinations don't block it either.
> 
> The premise the patch rests on is still correct — mac80211 skips adding AP_VLAN
> for us because of SW_CRYPTO_CONTROL (main.c):
> 
> /* if low-level driver supports AP, we also support VLAN.
> * drivers advertising SW_CRYPTO_CONTROL should enable AP_VLAN
> * based on their support to transmit SW encrypted packets.
> */
> if (local->hw.wiphy->interface_modes & BIT(NL80211_IFTYPE_AP) &&
>      !ieee80211_hw_check(&local->hw, SW_CRYPTO_CONTROL)) {
> 
> — but the consequence I attributed to it is the wrong one. As you say, what is
> actually gated is the non-4addr AP_VLAN case, i.e. dynamic per-station VLANs via
> `hostapd_vlan_if_add()`.
> 
> On what I actually hit: the symptom was hostapd failing to bring up WDS station
> interfaces on IPQ5332, and I developed this patch alongside a hostapd fix in
> `get_hapd_bssid()` (bss->ctx dispatch), which Jouni has since applied. Given the
> above, the hostapd change is almost certainly what fixed the WDS case, and my
> attribution to this patch was confounded — the two were tested together, and at
> least one of my A/B runs was invalid because wpad was never actually restarted.
> I should have caught that before writing the commit message.
> 
> I'll send a v3 with the rationale corrected to the dynamic-VLAN path and drop
> the WDS claim, keeping your Reviewed-by only if you're happy with the reworded
> message — say the word if you'd rather re-review it.

Sounds good to me.

> 
> I have the hardware set up (IPQ5332 AP with a 4addr client), so if it is useful
> I can also test the non-4addr dynamic-VLAN path explicitly — with and without
> the bit — and report what each does, rather than leaving the justification
> resting on code reading alone.
> 

Also, please use inline replies in upstream discussions instead of top 
posting as recommended by the kernel documentation - 
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions


--
Ramesh

