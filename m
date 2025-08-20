Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA0CA0EED
	for <ath12k@archiver.kernel.org>; Thu, 21 Aug 2025 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sCFu7mltApkEjzSAO3H+C7fRb+F+u1oZghCtlY2Fzt8=; b=tgoI8X/OWTYOvA6S7WLp+uS7AK
	REDlxNmznoegEyPi9Jb5V8nridl+dggznKArPz/OjDABJ7/eE8b4MQT5l8oTOG2/RqnSi/RHlNbhB
	BEqHw3u8trpLdGV/cXlA9ZqWRxpcK9mBgIddqTqtBtvtg7GOzI8hXeUISc5fNtt6/mXE0oCIFOGl3
	5YoZzSJFMiC/DsjpMOAfSvAuQZD7oqu4b7L+ECMnaxCrlDInHW33TG8Z72p3Q68nFp6i14Jl/bF/Q
	XSQT6QC4CfwZGcwXTqpns9J0e/W/CfU9eh5eU0d+0+TggMAz7ggC/5vssiZuVGgrwrOXVjq1oPpUE
	VhrWjdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotrT-0000000FOns-292v;
	Thu, 21 Aug 2025 01:13:03 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqAF-0000000Ey28-1YVt
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 21:16:13 +0000
Message-ID: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1755724556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCFu7mltApkEjzSAO3H+C7fRb+F+u1oZghCtlY2Fzt8=;
	b=N5gvqwuTgtsQssoESnM6/JmeB/uBIUpu5GYBAD3VORzX3o9febF3oVWG4MYsnPHPXzme1I
	9G6zW5jF6Nn4m2r4zra/goQSDpT0SQsUU9izyQ8lflEKHT76dgV7NA6mJ/zEql3WJNdZT0
	6ESALA1YuGr9ms1j573vZ5gwu05acGCojOVOnqFki2Ynl/eCSVh4RfNsQG19Mm/7wqX8HK
	xCwSs0Lm9DQR2z+KMmDRT0cK8sLB9UAjGzN7QDI2RBd71MSInNDkBK/wTq16ZyRpIziiPM
	4MgToM8AhNvOUmMZX1o/f7hjBkGX1Ui+dEH0cZzu7+4mdF4uY68HjoNpUvjToA==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Thu, 21 Aug 2025 00:15:54 +0300
MIME-Version: 1.0
To: ath12k@lists.infradead.org
Content-Language: en-US, uk, uk-UA
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: The whole computer hard resets when trying to load ath12k driver in a
 KVM VM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_141611_576345_6BA587C4 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Hi,

I have a QCN9274-based Wi-Fi module that I want to use with OpenWrt under KVM VM (libvirtd, vfio).
I used various Qualcomm modules this way with ath10k and ath11k in the past successfully, but ath12k seems to be buggy.

Two cases:
* if host already loaded ath12k, then starting a VM with the PCIe device passthrough triggers immediate hard reset of the machine
* if I bind the device to vfio-pci on the host, I can boot the VM, but it inevitably hard resets the machine when ath12k starts loading (presence of the correct board file does not matter, it doesn't seem reach that stage)

In the second case, which I'm primarily interested in, the the following lines are the only thing I can capture before host hard resets:

> 0000:01:00.0: MSI vectors: 1
> 0000:01:00.0: Hardware name: qcn9274 hw2.0
And when machine reboots, BIOS prints:
> Warning: PCI-Express PERR/SERR error detected.
I'm not really sure what this is, but I think it should be trivial to reproduce.
Looks like either driver or onboard firmware issue?
Open to do more testing and provide additional info.

All information I have so far is on the forum here: https://forum.openwrt.org/t/qcn9274-crashes-the-system-during-driver-load/239491?u=nazar-pc

-- 
Sincerely, Nazar Mokrynskyi
github.com/nazar-pc


