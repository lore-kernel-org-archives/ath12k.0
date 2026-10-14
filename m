Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF080CC6B19
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxk3TbtCw88JdAOdSEkADB0LBJ9HmN0IwiUJsngVV5c=; b=fGiV86TBlu+MmpY+yYHpe4/A9O
	s62VqulVRqD6v99DGCFVUzYaqeA54sNFzzOPIjjmzLrXbcbNXvLQlc3hQnzjEkcPv/CKXcHJdnhE+
	/UkBkIvr6oL4HW+eAup3gno9FvSAaLuee2KuN2/XpwcVK/83Fv+U6ilLJcuClXWbey2/5FeQOjSW9
	jh3zdKb4dRk+BHhce49ygNiYIHrWtqrZY1WB3+qQNmjo8svzvkaY1riyJSB+fb1oXcOJQNd5lP3Fr
	mHlniYad52BIGHjcWF989qgms1pOUmur3nijNadUZiNu/2l0ymhCwsAmA5AMG2wJhL5NHBxNkj4f2
	xEFyPn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmk9-0000000EGsG-1lH3;
	Wed, 14 Oct 2026 00:21:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmk6-0000000EGrn-1g7y
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 00:21:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHQhTV1592397
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 00:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxk3TbtCw88JdAOdSEkADB0LBJ9HmN0IwiUJsngVV5c=; b=Do8chB8twnjrRnAX
	C3eCZ7CFWjJNFOR8gTb5p/Q2oc2zNKlZbB37QhA0ZHt3Lb4nSAACLrEgtkNdpGQn
	2qDF0m8pGmTn9XGXCFPnio+D5Dn5urH+MLl6/x4pv0LjsxuvxCfH8ahSAkoEIIGp
	4NjBm9jI/r8Tg7kwt9dTnnyS0LklLwnGE/e/wiPwNHsRh0p8KLP+dkGTl3OyexZa
	xuVt33bR5mpJ5pfrfyPbKDR5gcqT8e5mHpVrT2W+1Qg3G7cbYZpHXGAjmOxLHW1E
	s2jsXuOhO9oPIgV/gApYW13GUUvGLNbT7LphKo67eDLiyW/jqwFmVJSfBEiEaW6n
	QZyHzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1thh8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 00:21:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so643792eec.0
        for <ath12k@lists.infradead.org>; Tue, 13 Oct 2026 17:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791937272; x=1792542072; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxk3TbtCw88JdAOdSEkADB0LBJ9HmN0IwiUJsngVV5c=;
        b=ZF7UkZfYi13KSXJwothZUlW2KOAhlSN9N5WqOuEigZoZnTKB6E4+MtFHEzAPk8/H5A
         XBZNUCTgwQKanQqVyzNdgca5FYdqjfU+Xh06I+rpvrMy4BBfMcOA+f9n1SHvLHqPDW52
         w8ZFkTCsze+2/00n6+jBTGniDLx9ZJX2n/1X4ncaT8TKNae4UWzOelYpGl+15eC+UiUS
         87TqahjhP5aJCBpV+lx6QFOmwqd0pWOAF8HHkbQ88mvQiRbbY3QXso1kPYIb5JkIXMVH
         M8LC46xM9P7oEiTeKkG2bQ6iUEjUNE5HwD2VBNC2istCiNEr7TP2LfsgOeCa3Y//4Eaq
         FpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791937272; x=1792542072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxk3TbtCw88JdAOdSEkADB0LBJ9HmN0IwiUJsngVV5c=;
        b=nzOpZX1XoWIqOLMC2cuoRxJ95eieC5y385Jhou2A2BgpKQNIZbcyr795j3CtW7rD37
         d47YdI+GfNPUc6EK4ioxe6ZRp5P4JN3svUPT/P5c4+P5oAbCJLf8aoxP7+nTznAa05+a
         PRMG3GGrT4WKCJQ6I/rQq3HKxdi0v1nV2L4Yo+h7TpzQKjHhcNnpQX5q5lYHBB5CF28w
         8XueDAZUCHqPWNkOEdCc47nkPeuD2ncYKTEmtDqwZDTRhZ3svLAOkpdCWOOIf8Sv1fXx
         f4J+R58nAKMkwo0Ps1gevegXEkyCNq62YvZkXPDbyVCYsgHnjLO4UEMexgZa9Iy7YzEp
         xDeA==
X-Forwarded-Encrypted: i=1; AKwUvBy9NgWHSxin7f1ef7cJR8Pds1yuz2gttrM0AznChq9xx5dJaHK2EcoVXrUcKlHzboPXXjZzY9M=@lists.infradead.org
X-Gm-Message-State: AFq9FYID5TStaPtUr1VmdBzZXB0f84srSoiPrnx6DPYOMRYu5DbzWAJg
	FQ8KVCXPjV+MoGh9tZLUjR5Xs5Hzwy57YX+J2FRqZFaRmdsmPPyEpfI7hiqJOvN6o2oeSDz9vZB
	ndRrJy8+VtTJbU+wJJ1bboE1OZfDntqGXglMG7RkNhJBwMcLPPXP3CVgIKysc96skcAa6MoXr
X-Gm-Gg: AYBFou2mKkuXdndD2XApGja38QD9WVUUga3y5cJRQQoRq7OgmqoA9VDmHVgZEosQNoN
	wy0o4YJBiL9EObtclSUobxWMkJmaj2997klf1hKVaIY0u2eqJsqAYduShgw+O6ktoyd89vCXncH
	fVfoGguHGaTxRaI3EU/+RirPXAnOzECBk8rGAEMaUySgPXz+QfONsaSgR1d7inZNFFccR4ApivM
	jKzogNJw74F0TlbZRXfFeivi1OlsAn/iHo9LtYL6ESOimxmAMcwc9l3C1Pf073ij9wNODB+3dvm
	HxESHKfyIXIakyvc2H2e4KgbcXBQhZ5GIWDXj/8Z+scqjlsx7u7iqig2yhhhwgswZR/gxJyX1Gc
	veKsAzAbTKEDrgb/5nB+2X2gYV6wB4s+2XkYTu7YQpsf21KxIDikyU8DK5A==
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr10691795eec.37.1791937272080;
        Tue, 13 Oct 2026 17:21:12 -0700 (PDT)
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr10691765eec.37.1791937271328;
        Tue, 13 Oct 2026 17:21:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm42940011eec.29.2026.10.13.17.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 17:21:10 -0700 (PDT)
Message-ID: <bbd65b93-816b-427b-8abe-1d1fd1cf4e70@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:21:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix frequency range for
 single-pdev devices
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Shenghan Gao <gsh20040816@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260715065218.41232-1-gsh20040816@gmail.com>
 <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
 <CAMVcGaDKC626A6=VC+10vtw3KVNm2NM_yPXTbgnA9Efd5eyL7A@mail.gmail.com>
 <9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com>
 <b4fcaa4f-8c4e-4fc0-898c-6c97e1446323@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <b4fcaa4f-8c4e-4fc0-898c-6c97e1446323@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acecaf9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Xp_5AQX54b4_orL4JKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwMSBTYWx0ZWRfX3yXSlXBSgWac
 Mrwdrr4M3XNzgHcyidaYJIH9KlF7W/mHr7aoO30bSn2qt8rfx7ugjQqZan0gS4JXZiMEGt8lEgm
 Av6y7iPJ10Oq9w+xjQDw3NgUAtF/fOk/n1aR2e9ZWauNEU0fiWUMN2oXDJ6tAUmn+ITuNM5nWLv
 JJWI6wNRDmaHrDj17x8gTR3n1xqPrmDv2WsLu8N4lotXRiTbTPQry3L0DX9XBBP+n8I4BKMdmBN
 IQvswTUkJKktEFbu0j3UwesZMZ2DAyIrlK3GgUJEwUUIVYu7cGeouHS93eu4UhudGJWFff4IxUu
 8fPMvOGuKlEKybHPf/glDIdU/8HvdRdS127eWDFP1Ym3k69vnnxc/AlysPkRY7YC/mEfway+98v
 /EtZEgtuUpgfy1X55H+pK1BQgRCr50ebXQjYlEeB4uf3eaIo638WRl2/B/Sk6s8ygPTJ7pD/R6U
 SZVJzvIYpoHSiCQRiVg==
X-Proofpoint-ORIG-GUID: BPuRxEa3o2mzg47Y5RT3cptZ-UJl-OF7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwMSBTYWx0ZWRfX4EGRh4gQEmLS
 NVmqFMgbokDH18v3YFEQnYbkfyQFAvJukNycbjRmvId5M8V0QzOOVnqZVJUfoja38uk0QLMFBb3
 /glgJUE8nKiXzXm5G0Dc2kyUDCp18XQ=
X-Proofpoint-GUID: BPuRxEa3o2mzg47Y5RT3cptZ-UJl-OF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_172114_702141_7A527B48 
X-CRM114-Status: GOOD (  19.24  )
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

On 9/9/2026 2:46 AM, Baochen Qiang wrote:
> 
> 
> On 8/3/2026 4:36 PM, Baochen Qiang wrote:
>>
>>
>> On 7/20/2026 5:25 PM, Shenghan Gao wrote:
>>> The update sequence is as follows.
>>>
>>> ath12k_regd_update() first resets ar->freq_range to zero. On the
>>> tested WCN7850 under the CN regulatory domain, the 2 GHz branch
>>> calculates a valid range, so the first call to
>>> ath12k_mac_update_freq_range() sets ar->freq_range to 2402-2482 MHz.
>>>
>>> The existing 5 GHz branch is skipped because ar->supports_6ghz is true.
>>>
>>> When the new regulatory domain is built, reg_freq_6ghz.end_freq is
>>> reset to zero. Since the CN regulatory event contains no 6 GHz rules,
>>> it remains zero. The 6 GHz branch therefore calculates freq_high as
>>> zero, and ath12k_mac_update_freq_range() returns without extending the
>>> existing range.
>>>
>>> Consequently, ar->freq_range remains 2402-2482 MHz, and the subsequent
>>> channel-list update filters out all 5 GHz channels.
>>
>> Thanks, now I get the root cause.
>>
>> However the change of this patch looks more like a workaround rather than a proper fix:
>>
>> Current radio frequency logic has been architecturally wrong from the start. Ever since
>> 657b0c72c4ad introduced reg_freq_*, the entire purpose of this code has been to compute a
>> per-radio frequency range (to advertise each radio's own Frequency Range to user space —
>> Idx 0/Idx 1 in iw phyX info). Since the quantity is per-radio, reg_freq_2ghz/5ghz/6ghz
>> should not live in struct ath12k_base (per-device). Storing a per-radio quantity in a
>> per-device field is a layer mismatch, and every problem below derives from it.
>>
>> Two problems caused by keeping them in ath12k_base:
>>
>> (a) A cross-phy race that silently drops a range. Firmware sends WMI_REG_CHAN_LIST_CC_EXT
>> per phy. build_regd() resets all three ab->reg_freq_* to {INT_MAX, 0} and refills only its
>> own phy's band on every event, while regd_update() runs per-ar off a workqueue reading
>> that shared per-device state. A later phy's event can reset, e.g., reg_freq_5ghz back to
>> {INT_MAX, 0} before an earlier radio's regd_update_work runs; that radio then computes
>> freq_high = min(high_5ghz_chan, 0) = 0 and the range is silently dropped by
>> ath12k_mac_update_freq_range(). This is a real shared-state race.
>>
>> (b) It forces the ar->supports_6ghz proxy — which is where your change comes from. Because
>> ab->reg_freq_* is per-device, regd_update() can't tell from it which band this radio
>> covers, so it falls back to ar->supports_6ghz to guess whether this is the 6 GHz-only
>> radio. That proxy only holds on split-pdev; on single-pdev (one pdev covers 5+6 GHz,
>> supports_6ghz=true) it breaks, which is exactly why you had to add the || single_pdev_only
>> exception to rescue 5 GHz. The awkward compound gate is rooted in using a per-device proxy
>> to decide per-radio band ownership.
>>
>> Based on above, I would suggest making reg_freq_2ghz/5ghz/6ghz per-radio, in struct
>> ath12k_pdev. ath12k_pdev is the driver's canonical per-radio object (1:1 with a radio,
>> holding ar/cap/mac_addr), and this operating range is a property of the radio — so it
>> belongs there, right next to cap (the HW freq limits), which is the same class of data (HW
>> capability vs. the rule-intersected actual range). Both problems then dissolve:
>>
>> - (a) is gone: each radio's range is isolated; a later phy's event can no longer clobber
>> another's.
>> - (b) is gone: the gate can ask the ground-truth question — "did this radio receive reg
>> rules for this band?" (end_freq != 0) — with no supports_6ghz proxy:
>>
>>   if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
>>       ar->pdev->reg_freq_5ghz.end_freq) {
> 
> Shenghan, any thoughts on the suggestion?

Working through my backlog. Is there any action on this?


