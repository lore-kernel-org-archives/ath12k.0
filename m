Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA9BC88E64
	for <ath12k@archiver.kernel.org>; Mon, 14 Sep 2026 07:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knqANIErUpUvoioHZKO7P35KQYo131cMbZHTXuFrKGk=; b=0Hsn0+bHEd7IKVvN0DarMPFL/1
	vkOgbgo0pRdfw2rlLII5MK+pfAN8UeT5RTfoAr2sa/CfOvcAYAWdRTvdpiw3IF1ChzD1R6pzIImbD
	70SjPXzfnIkkYLI0V6nEOQRgycRMybajiZqp8I2lOUd+93MLLX6sT0ekSkVafyo+u7MQfWyUoCV0u
	XjTzTs9ZOdR17ordQejSJ7rdcmzDnsgrWTHPGjU7h3U+cARrire/qMW7ZNJ6XVetjWzF5m+WheYFn
	AD5rhE/Ed646lXUpS/X/78PRkm884UGY+iyIrSUrGiRjXKeaPd2wh1BJJ+zj78vjcdlMp3GjvVD4k
	uCjJjyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61OE-00000002byP-2KJ0;
	Mon, 14 Sep 2026 07:46:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61OC-00000002by1-0vox
	for ath12k@lists.infradead.org;
	Mon, 14 Sep 2026 07:46:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jKIj3842723
	for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 07:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knqANIErUpUvoioHZKO7P35KQYo131cMbZHTXuFrKGk=; b=GfCe2D+wX97VOWas
	ig6q5xqgHwAhEHWKY7GNiWz12VuhT4HB1624DF/y/pXwvvqKLofFlqU0Shlija/C
	DtnvzJQZKioSNAZIYZmLoJ6/6v7dOZlgSu0B96IDj8hCoygHVzztzM3wYqSo/FBT
	yhpCK6AWUNZ3DqI1+qRwYr4Ejir2Gkb3Or3DvS1/qL4frQ66KUYzG0HQ0+HmMSEC
	ATCsVsXcWcKFAPnF9tom9tAMn8jGAIwLbozbQOl5ZvFJQkFpaaq1cnSBRKGBy4in
	KPbG+737yQBt2lDAYu71wGZKt85IVXeTKnSL+oQZ/GDA9VQBiqPEFgAABKA8uUnZ
	XQEcqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5kd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 07:46:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so3831984a12.2
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371966; x=1789976766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knqANIErUpUvoioHZKO7P35KQYo131cMbZHTXuFrKGk=;
        b=FKfTaZuSEpaHMB1MBKr2a5JP/S73n8TRZhibN0oC+qeul0KIgW2ERhvHGxMKF81rfO
         ogP7OnKnFvM/WAmXlbocCRCFESY4H8e/RHuec6n79a7WnVDTs1qajbgTwx63QgC5YWI0
         aXAyTVIZpu6jROK/m7IM6iPKaO6YNvX5PKLHGFM/sAGu0aSq0ylNUR3iYd39/W5KXoZ4
         wKr38T2g8qm2TElaeMkx2I4fj8bIyb5/vSPPKFV7ewT+ZhEM1eCBXzZ/3x4f1xOLP8o0
         lJS1CCDtmOVylD9DOKJqpKFYwIUp83uor7YOrlAUF1qfTiQG4/gJE2wPsOGYAO+/fY1u
         F65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371966; x=1789976766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knqANIErUpUvoioHZKO7P35KQYo131cMbZHTXuFrKGk=;
        b=L/UKhW9sumtyl6vgE3IRBlnsgo+S/HDfakPqyp2vCO1B0qjFoL9b/odSW7crffosC3
         F6CIJBIYGjmVCwMI883yo7ZXxuuasIi2tncCC7VcoYcW//yvXW3zeSiveZmTWe6yLzIO
         Yx8GBpnmU0ETiXkgzJxxvoatadfXnn2yQsNZPCz3zlLIlIGg50vISDsGsbpP3MvuacP0
         NVSUwYYkgmDGl4F8b+OvGbX4zCwMYUYzQR0WJaxnm/uVRG+XOkz/vAc+ZOrEj2xturxb
         t9WQFRPioDpJ3mu6VyjfuotRhVz4TC4LkIMFLycIJDF47m/MrM4xUFJPGFxy0kSum5a5
         Rc7A==
X-Gm-Message-State: AFuF++kF19f+/FsAYMqLiLDnswWz4rAGTHJg7M2ZEuoIVrE92sgoL6An
	pRosqXQQk0bonXVScFgBf2L6l7DP9adfARInod6sMiAY1vEzRB4dRuxS7LLZOFEpzsAcUnXNNqX
	KjaYkFrzeAv5SuQT2ehJh/N7jqX7p/Z3eF7YQI2v8fDjm+NQLY9+zQ/ElB9FXDfKD
X-Gm-Gg: AYBFou1lIBmHcwHjcMj2D1q1LvU1+fSGdNRx9Tlqa5Fnbm8yvD13+pga2aa7W0UQIn7
	JEOc/QLFuA3X0eelYg53Br8XBLnftxXMY7VmgZCSKuSrKPiLhBi3suAYb3y9qN7H/0owEcZ9zp3
	xs6qZ4nY8LBkFHpWD3t8vofybQg0LQWPIHJI/s3ZEcH7wZQ/9CaY313lCAdZ8zhfuTXTW/BWPJU
	oH0LXVH4P2hc61rYxEPM+DMVt+8+/qeh3w2cfTYZjLmoTelWKmaCgEQJiN13QgtwYZo1JXM79TA
	klUOm7Bv8W9GdbuNhicyr1W+W55m+XMlqeAsUnutUOUD2N+P64OUsmBsrn6piK6s7vkeqFoHzRw
	MpW4uYb9K2lRO0jxOIB1x7Q8e0KEaCz0LJFS/LRLnEwakg31Qd8jarPIHb+xENcFiSSLfhGMMiF
	R/fg==
X-Received: by 2002:a05:6a20:d80d:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db40568311mr2844492637.20.1789371965583;
        Mon, 14 Sep 2026 00:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80d:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db40568311mr2844434637.20.1789371965162;
        Mon, 14 Sep 2026 00:46:05 -0700 (PDT)
Received: from ?IPV6:2406:7400:c4:1a3f:4c9a:bf20:8238:da9? ([2406:7400:c4:1a3f:4c9a:bf20:8238:da9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm27897775eec.28.2026.09.14.00.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:46:04 -0700 (PDT)
Message-ID: <9ddb130d-9e08-41a6-b76b-678b045a22ed@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:16:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: QCN9274 WLAN.WBE.1.6 firmware drops pre-auth EAPOL in TX
 encap-offload mode (WPA 4-way handshake fails in AP mode)
To: Michael Pfeifroth <micpf@westermo.com>
Cc: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org
References: <app7ADVti1eiVQr5@mpf-ESPRIMO-P9012>
 <cbbb5555-60f0-4a4b-881d-403decc53ca7@oss.qualcomm.com>
 <aqFARFlTS7757Zks@mpf-ESPRIMO-P9012>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <aqFARFlTS7757Zks@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WW0CpUJYtmu0O-x1l2sa6clE4yZFtjIq
X-Proofpoint-GUID: WW0CpUJYtmu0O-x1l2sa6clE4yZFtjIq
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a63e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=7v_02ZIBZ6jUZCODSU8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX+M4f/1FO4Zjd
 Ui9gsMJRdjs+rCHz/1RKmWs682jngyx62hjmJ6qv6MZoc/m//X9nPp5Gr6dJqGfEIOE3i4xnjNy
 Tt4gw8zE83Nk2J2JJZbCrXANg5gyX0lCLFgY2k1HEFGGHEhpXFMC/EWT3IsbjB7UNvJuVP74gbD
 WI5EKUcIUArFeo6FACfSpveqJhTOMQNrV+AUMq3hsm+aF4R+zPsu9kwGijzxCpYq+gnVNh0TDfe
 BTqmmGykO5sTCreRgtN2y3UtXIcQXMIWMkKmNa3K2rce1KGFjCgftN8u7hkrqv0DHEx+Gva67YJ
 7F3cJ+q/Fm1qVw/77sMSXm6hISBVdaRT3HfXCOiMP4D+X2Lkw7JegjutDbgZ4W339oIjwDMiTfY
 lxihXdaJ6rU+G1LsUQZ0Zv3z1BNFZdNPQtCPw0nmZBv9CYqzTM6FlutgkGNnK+If2C5PI41G6hW
 ubM10A2vChJq9FypPGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX7/6PgAIMVxJq
 DJdgXScnMGlFvZxxVzFVqx5ZAH2/vCRs4a0aRx7jFcbtY4UwvakKqaQ0I6BnD0vtAT0dXXZeR+h
 aUv58cFNZ3d7sA7RzmijPaVaJwVCS7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004608_392982_B3247D6B 
X-CRM114-Status: GOOD (  26.35  )
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



On 9/9/2026 4:47 PM, Michael Pfeifroth wrote:
> On 9/8/2026 9:59 PM, Vasanthakumar Thiagarajan wrote:
>> Worth trying with commit
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e33f8acd837420160ea088160d8648a3db54c3b,
>> if it is not part of your image already.
> 
> Thanks for the pointer. I backported 1e33f8acd837 ("wifi: ath12k: fix
> encrypted EAPOL TX in encap offload mode") onto my tree (backports-based,
> single-file dp_tx.c); it builds and loads cleanly. Unfortunately it does
> not fix the symptom I reported - the 4-way handshake still times out with
> reason 15 and hostapd still logs "did not Ack EAPOL-Key frame".

Thanks for checking with the commit.

> 
> Looking at the commit, I think it addresses a different EAPOL case than
> the one that fails here:
> 
>    - 1e33f8ac only re-routes EAPOL frames that carry ATH12K_SKB_CIPHER_SET,
>      i.e. *encrypted* EAPOL. On an established link that is the GTK rekey
>      (group-key handshake), which happens after the pairwise keys are
>      already installed.
> 
>    - The frame that fails in my case is EAPOL msg 1/4 of the *initial*
>      4-way handshake. It is sent to a not-yet-authorized station before any
>      key exists, so it is *unencrypted* and has no cipher set. It therefore
>      still takes the unchanged is_diff_encap / TO_FW RAW exception path in
>      ath12k_dp_tx() - exactly the path the 1.6 firmware appears to drop - so
>      1e33f8ac leaves it untouched.
> 
> So the commit fixes the rekey EAPOL, but the initial handshake never gets
> that far. Test details unchanged from my original report: QCN9274 hw2.0,
> firmware WLAN.WBE.1.6-01243 (the latest published in linux-firmware
> ath12k/QCN9274/hw2.0), AP mode WPA2-PSK/WPA3-SAE.
> 
> One thing I noticed: the commit's Tested-on tag is WLAN.WBE.1.6-01270,
> which is newer than anything currently in linux-firmware (01243 is the
> tip). Two questions:
> 
>    1. Does 01270 also change the firmware handling of the unencrypted
>       pre-authorization EAPOL on the encap-exception path (i.e. would it fix
>       the initial 4-way handshake, not just rekey)? And is 01270 planned to
>       be published to linux-firmware? I can't reproduce your test setup
>       without it.

No, the EAPOL packet Tx handling remain between those firmware binaries.

> 
>    2. If the initial-handshake fix is expected to be driver-side, should
>       ath12k also force the pre-authorization (unencrypted) EAPOL onto the
>       native-WiFi path when ETH TX-encap offload is active - i.e. extend the
>       handling to the is_diff_encap case, not only the cipher-set case?
> 

We do not observe this issue in our local setup. This behavior needs to be root-caused.



> Happy to provide full hostapd -dd logs and tx-path traces, or to test a
> firmware/driver fix.

Sure, the below logs and configurations might be helpful for further analysis.

- dmesg output with ath12k debug_mask=0x6000
- dp stats output before and after the issue:
	cat /sys/kernel/debug/ath12k/<pci-bus_id>/device_dp_stats
- hostapd configuration in case this helps with the internal issue reproduction
- hostapd logs
- OTA Sniffer capture, if possible.


May be continue the debugging in a Bugzilla tracker for this issue?

Vasanth

