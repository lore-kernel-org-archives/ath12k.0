Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310CBC88E50
	for <ath12k@archiver.kernel.org>; Mon, 14 Sep 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JppFt/+br2NTCOFHqWhz3JF596HlQBjHKFQolYnUo9M=; b=DnG+XoJpa03+L6fdw2yRhSY0aO
	mhRUqqJt1KgeKe6aJyKv92zyo416/4V/qLogpf6ZI4YaV/6OZrU5olMttyYDdOidPmfPWudbexz+r
	xqO/ZswdW9e8G0jM6MZmq7hzH554LULWMmQOois5XT9DrTP69k50HJWCvxpsBvm1pbP6cNvO5dTeL
	CoH7hagWnoJaD89Up4Fgh37TUSktDAHyr2/1nrIkGUZ4i9RxuXrctasQO5UttDF8EeSUINJSFYhtr
	PaF+jYS7611E1m/PNc2H4QKm7hWnUNyPShpIaIu/M+4q0Sc5l0zmPf3icT1wGyseaGz34Zi2HhxKF
	/Sy7z1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x629d-00000002l9v-2RTm;
	Mon, 14 Sep 2026 08:35:09 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x629Y-00000002l79-2uqa
	for ath12k@lists.infradead.org;
	Mon, 14 Sep 2026 08:35:07 +0000
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [IPv6:2a05:a1c0:0:de::167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.as201155.net (Postfix) with ESMTPS id 43C60DFBF3
	for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 10:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=JppFt/+br2NTCOFHqWhz3JF596HlQBjHKFQolYnUo9M=;
	b=C/Ryc8E2POsg1bdPjNf8Ks8BR5+XGYKkVaOmp88eGzvXJGm/S5wFFXU7RViQ82mDJxktyjz0yV8YSlv0t46kT+tB9/8HqF+btl/zCQ/ygE4YtIp1tc9ysIdZiFNu66kKB5+RSxsMlvjQqvpncFB9ei3SQqC4RS/fQnYKrrZD83s=;
Message-ID: <81026fa4-efa1-4841-a563-6145e573b2bc@dd-wrt.com>
Date: Mon, 14 Sep 2026 10:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: ath12k: QCN9274 WLAN.WBE.1.6 firmware drops pre-auth EAPOL in TX
 encap-offload mode (WPA 4-way handshake fails in AP mode)
To: ath12k@lists.infradead.org
References: <app7ADVti1eiVQr5@mpf-ESPRIMO-P9012>
 <cbbb5555-60f0-4a4b-881d-403decc53ca7@oss.qualcomm.com>
 <aqFARFlTS7757Zks@mpf-ESPRIMO-P9012>
 <9ddb130d-9e08-41a6-b76b-678b045a22ed@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <9ddb130d-9e08-41a6-b76b-678b045a22ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1x629Q-000ET4-7p
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1x629Q-000ET4-7p
	for ath12k@lists.infradead.org; Mon, 14 Sep 2026 10:34:56 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_013504_910827_9B356BCC 
X-CRM114-Status: GOOD (  25.65  )
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


Am 14.09.2026 um 09:46 schrieb Vasanthakumar Thiagarajan:
>
>
> On 9/9/2026 4:47 PM, Michael Pfeifroth wrote:
>> On 9/8/2026 9:59 PM, Vasanthakumar Thiagarajan wrote:
>>> Worth trying with commit
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e33f8acd837420160ea088160d8648a3db54c3b, 
>>>
>>> if it is not part of your image already.
>>
>> Thanks for the pointer. I backported 1e33f8acd837 ("wifi: ath12k: fix
>> encrypted EAPOL TX in encap offload mode") onto my tree 
>> (backports-based,
>> single-file dp_tx.c); it builds and loads cleanly. Unfortunately it does
>> not fix the symptom I reported - the 4-way handshake still times out 
>> with
>> reason 15 and hostapd still logs "did not Ack EAPOL-Key frame".
>
> Thanks for checking with the commit.
>
>>
>> Looking at the commit, I think it addresses a different EAPOL case than
>> the one that fails here:
>>
>>    - 1e33f8ac only re-routes EAPOL frames that carry 
>> ATH12K_SKB_CIPHER_SET,
>>      i.e. *encrypted* EAPOL. On an established link that is the GTK 
>> rekey
>>      (group-key handshake), which happens after the pairwise keys are
>>      already installed.
>>
>>    - The frame that fails in my case is EAPOL msg 1/4 of the *initial*
>>      4-way handshake. It is sent to a not-yet-authorized station 
>> before any
>>      key exists, so it is *unencrypted* and has no cipher set. It 
>> therefore
>>      still takes the unchanged is_diff_encap / TO_FW RAW exception 
>> path in
>>      ath12k_dp_tx() - exactly the path the 1.6 firmware appears to 
>> drop - so
>>      1e33f8ac leaves it untouched.
>>
>> So the commit fixes the rekey EAPOL, but the initial handshake never 
>> gets
>> that far. Test details unchanged from my original report: QCN9274 hw2.0,
>> firmware WLAN.WBE.1.6-01243 (the latest published in linux-firmware
>> ath12k/QCN9274/hw2.0), AP mode WPA2-PSK/WPA3-SAE.
>>
>> One thing I noticed: the commit's Tested-on tag is WLAN.WBE.1.6-01270,
>> which is newer than anything currently in linux-firmware (01243 is the
>> tip). Two questions:
>>
>>    1. Does 01270 also change the firmware handling of the unencrypted
>>       pre-authorization EAPOL on the encap-exception path (i.e. would 
>> it fix
>>       the initial 4-way handshake, not just rekey)? And is 01270 
>> planned to
>>       be published to linux-firmware? I can't reproduce your test setup
>>       without it.
>
> No, the EAPOL packet Tx handling remain between those firmware binaries.
>
>>
>>    2. If the initial-handshake fix is expected to be driver-side, should
>>       ath12k also force the pre-authorization (unencrypted) EAPOL 
>> onto the
>>       native-WiFi path when ETH TX-encap offload is active - i.e. 
>> extend the
>>       handling to the is_diff_encap case, not only the cipher-set case?
>>
>
> We do not observe this issue in our local setup. This behavior needs 
> to be root-caused.
>
>
>
>> Happy to provide full hostapd -dd logs and tx-path traces, or to test a
>> firmware/driver fix.
>
> Sure, the below logs and configurations might be helpful for further 
> analysis.
>
> - dmesg output with ath12k debug_mask=0x6000
> - dp stats output before and after the issue:
>     cat /sys/kernel/debug/ath12k/<pci-bus_id>/device_dp_stats
> - hostapd configuration in case this helps with the internal issue 
> reproduction
> - hostapd logs
> - OTA Sniffer capture, if possible.
>
>
> May be continue the debugging in a Bugzilla tracker for this issue?
>
> Vasanth

just as notice. it have a similar issue but only with wds 4addr enabled. 
(which btw does not work at all with 1.7 firmware, but only with 1.6 but 
with crypto enabled i have to disable offloading on 1.6 to get it to work)


Sebastian


