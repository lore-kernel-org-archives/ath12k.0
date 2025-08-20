Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A6CA0EED
	for <ath12k@archiver.kernel.org>; Thu, 21 Aug 2025 01:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoPd2ED63qereOzLWmw51+ujOSNJ8pN4Kv/ujzr3Cec=; b=IsU95ectYhgTBZHawMpOzgfq9B
	WtyMkRDgOLZVp6f3yHNiMKbXL1iOiqkGuqRinFgr14I60cymWIzd/SL8KdldJESPgzuZY1p5gnjhj
	1arydmZcjZ+kojCSLHuoZQ8gS7I2eceA7ydnWKj9afasIzaZNHhubpwHcB+RP5Da/HyF1+K5kiJcx
	o0wz00IaGNrPF1w//ktGthMzqgCyb38QhXE/K2V4q/KcO6kGwVpx7fa1pTip6bvlND9LKvI8yhE3u
	n9LdFDJ58DC3pihqnLdNeljhwAefEtURndSvr6U18kMTI0M3k0Kx4ITytxkkGDkkzn97ORc9YRlJy
	7cT6LqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotwd-0000000FQIi-0LWP;
	Thu, 21 Aug 2025 01:18:23 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqen-0000000F1fx-2eXr
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 21:47:47 +0000
Message-ID: <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1755726460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HoPd2ED63qereOzLWmw51+ujOSNJ8pN4Kv/ujzr3Cec=;
	b=snYhvub4juizh3TFtpaSNk3/REO6hhBxHufk2iqOR2iJooQgj3ZWNa4/dc0MRJ2I54MO5m
	d0pJcFH665zJBVfxsxglUQaQwtZ96YDOOr8BkbTjVsokg8oAO8ntdnH1drXoxSEalfYNiV
	2GS0AInV/TKVD4xYMzxUkHDfdMvoRRUTQ5I2bRZsXXo/Jf4dj8bM40EnIKDC4vfVIm+lGZ
	OSxDq1c0z70flBQL7rs3Id3C8rqT19ioEYahoMYJhxkrhkZRt2HwsMOYGPK4Km6qndBhy2
	wlDLqHaUCK/xPgG1kievIY+HQRNEUw55lF8w0TloiGMu8UojBaouTBkClDwPMQ==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Thu, 21 Aug 2025 00:47:39 +0300
MIME-Version: 1.0
Subject: Re: The whole computer hard resets when trying to load ath12k driver
 in a KVM VM
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
To: ath12k@lists.infradead.org
References: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
Content-Language: en-US, uk, uk-UA
In-Reply-To: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_144745_853576_7CBA3FD4 
X-CRM114-Status: GOOD (  17.10  )
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

Some additional details.

The system is x86-64: Gigabyte MZ32-AR0 Rev 1.0 motherboard (with M23_R40 BIOS) and AMD Epyc 7302P CPU.

Host OS is Ubuntu 24.04 with HWE kernel 6.14.

As guest:
* initially tried OpenWrt 24.10.2 with kernel 6.6.93, WiFi backports seem to be from 6.12.6
* then tried the latest snapshot (r30806-070d8eb4d5), which uses 6.12.40 kernel and according to the kernel module version carries WiFi backports from 6.16

> # lspci -mnn -s 46:00.0
> 46:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00 "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]"
The module is QCN9274 2x2 5G+6G from Commtek (but missing on their website) with M.2 E-key connector.
Looks very similar to Compex WLW7002E56 in terms of size and features.

This should be most of the details that might be relevant.

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

21.08.25 00:15, Nazar Mokrynskyi:
> Hi,
>
> I have a QCN9274-based Wi-Fi module that I want to use with OpenWrt under KVM VM (libvirtd, vfio).
> I used various Qualcomm modules this way with ath10k and ath11k in the past successfully, but ath12k seems to be buggy.
>
> Two cases:
> * if host already loaded ath12k, then starting a VM with the PCIe device passthrough triggers immediate hard reset of the machine
> * if I bind the device to vfio-pci on the host, I can boot the VM, but it inevitably hard resets the machine when ath12k starts loading (presence of the correct board file does not matter, it doesn't seem reach that stage)
>
> In the second case, which I'm primarily interested in, the the following lines are the only thing I can capture before host hard resets:
>
>> 0000:01:00.0: MSI vectors: 1
>> 0000:01:00.0: Hardware name: qcn9274 hw2.0
> And when machine reboots, BIOS prints:
>> Warning: PCI-Express PERR/SERR error detected.
> I'm not really sure what this is, but I think it should be trivial to reproduce.
> Looks like either driver or onboard firmware issue?
> Open to do more testing and provide additional info.
>
> All information I have so far is on the forum here: https://forum.openwrt.org/t/qcn9274-crashes-the-system-during-driver-load/239491?u=nazar-pc
>

