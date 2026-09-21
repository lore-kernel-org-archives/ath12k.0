Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF64BC982E6
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5e0UaYgiorPsh4vDhqkUX8q8sFJG6i6HatLbRVZxtI=; b=n23ieO20pGy1hg7FZkb++q0BlM
	2fh/tNOFbwuj7/0nmCaRbCulpESLdaCRQOR0JNEFy2ybTtKLXgQhrPa8DYnqUNaYnxo3BHVwy64wd
	xLOuX3MTSIt5wMEKpQxr5+7mUe5oxrb9UOGhkvRmiD2DAiYktiTwV0vlktcFNEo/rIJj00Lz/v5qb
	JLbJM0gyL7OUb01gFfuEy9tKaj10O1J5MByfFZo/RcOeDhkhXBxWPoBnKtofyDYqHb9n6abbRGV9v
	DMdwl5/TZOf0i8SM8sdBO8iMPWNN43CbvUFNEONGEszJu/W3uQfg8u4M7fdRQNs/7HhYJ1spzIKxN
	znZI98UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gtD-00000002pml-2fQ3;
	Mon, 21 Sep 2026 16:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gtD-00000002ply-0E3G
	for ath12k@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t5e0UaYgiorPsh4vDhqkUX8q8sFJG6i6HatLbRVZxtI=; b=KWgsgVfYdE0bnsXgR2cPJaj6++
	UufZSL2YTtuPWhQV5QRvu4RaVQygODc5HI4JH4fmnl7lNzhkKP/W0HX51l3x7DQ9Cw2uIE7pBrzad
	FSF/mbsN09m42jqQX/7pPKmvtXj+fmxNEqZdl2rP9GzvidE26QAtUNxXbXrslZa0C0ACRGX7Th7ud
	8G0sUqyauAMSreCl9X61KbIuELH1qwvFpewyL0buMDNatevkAfUJSJ8HPKUNdo1t/xo+rh82yZH+7
	DjD9XQOtiv3AIaggvWFPsytcEkRhpFLWLseledwIrj5675jFpRTBgJ84UjkcjumR1u2kO+e0oI6Yv
	M70xaVaA==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gt7-0000000CYoR-1JIC
	for ath12k@lists.infradead.org;
	Mon, 21 Sep 2026 16:29:07 +0000
Received: from fauth-c1-smtp.messagingengine.com (fauth-c1-smtp.messagingengine.com [204.75.18.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hpTFJ1pz3z49Q7N;
	Mon, 21 Sep 2026 19:28:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790008133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5e0UaYgiorPsh4vDhqkUX8q8sFJG6i6HatLbRVZxtI=;
	b=ufgp/ZrXRub99GWtqBTTXWrwqaHFO1n10hebWkURYavzNbnNdAeX+JlEg54pU1sbXANvlW
	vV6vf2vYY3TSfdNOU8gINyHX1Jkv0Tss3DM1fRyxiE0dFFNXxFwxVf2L4gr6hNTOSJSond
	gg7V0x5AKQa+Mq+5CfhPDg0TH/p8Lj8Bw14VJPSWS4+w4Ytwf9ec7zFaLHz8Xq8zKcAspH
	6cmjRHFf8x6leR4pIUuSWNHm4+CRoP6YPL8hS2U7dhqxYqzT/SJjKo0rY7s0PdSExYNXE8
	aStMT80jWbRbHeTbhjy2pQe+AQclniS2XaW8vTgVCP8V7rt4AzKZ7sQS/HFfkw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1790008133;
	b=ZEpWCPCuxpdnzJcZl5Lvk6P9uSCp1mXypqr9/XHdkB+zFbYAGFeI1GcaymKs/WQBFadFpk
	L2JziogcTvFIEYOJDqMuFCWqQow26hO+KMmRVA58C18xDEJIko5A+duxAbCnVum1pXkYUA
	9plte+EZblMu9EKWnxPwuw7nbsyXEKXbVrTP6eI0Q5LBvGwbE0Il9s1zCV6tQAkTMDBZBu
	LkhCKEP01Aud3pBguORegBlWCY1rQ/ZZvz198jOhtuWN2yZGKyi3A7vu/YAfMH7XYz8erm
	EEjr9ENrqGHYKr4RBIndw1GX2gQ7ee6k+rtyg1ZZZolrMCbvlusz03awHb2cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1790008133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5e0UaYgiorPsh4vDhqkUX8q8sFJG6i6HatLbRVZxtI=;
	b=Rmc0WRn19peE2giuJaJbRbzcfwtGQpAnaM1McifJ0BUSuWvgobbBLWYgxtp+c3HSG/v41a
	siO4JPVpghmeEyX7skVzTBEcMXdsH0pJ/Fquwsp+CiViKeQZTJX930jNYsbLCCWjzYHcwL
	HoS+61yZqya1pDdChQ2AeQv+znSTeBPaCmsnJkrcmQA6nXgJH4nGeDVLTXR6yT1M95jJUj
	HucVF8LEVDqv9BxvI/poCempgHsm6U2GLQYl0p8x95+arg+esL5Nx5yHIgv3xJDYleQbFQ
	5SWw/DNOOi2vXz6IjY5n4ZcdMON3pdNE8tJ2rwSwKzdvrnVW9Vlv7POg1kY7EQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 03D67198004A;
	Mon, 21 Sep 2026 12:28:49 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Mon, 21 Sep 2026 12:28:50 -0400
X-ME-Sender: <xms:PluxapFdnPTsBbay6N6HKMhJhGBTbwFLlmPs96Cv3_wMXCjhv4JjvQ>
    <xme:PluxapLw3n1SIqOAyc9XeXqGMzMMuXZbFHfpDkKS-J8GJhk1HXUs2aY0G6Q7gZER8
    4HHg3Oa7TKlAyp-tkwCv_nPu4KkIipGwBUJZo9eOJe4IcQzqIXFJhVb>
X-ME-Proxy-Cause: dmFkZTEA0pTLxbRa6jupCZWu3EErz1OrCDSyeCVlhXZ7W/sCqaBzg46dX4FuWGAJJoLGPd
    cnz6LrloAAUIROtdaTo5xAf3oEv2WejE8HnP9AtUmnKSeGT3XAPwQCXCpnylw5ykIdA3o8
    jrMgY5tozSrSokeoHnTCJimUFt424HZ8e6gqXocEB3wVmw0Eo7pDbQSvl8XwS54666/C86
    xMDrNbymyxb8LmGteFk9C9RbN9WdMxDmgwAPglctpIkTHVNB/HVJG4EfE2y/R7uTbHXRiP
    bNNECZqyrYwklTwB8Y08RkxcqT5paHCRxOQGc7F/CjzFl0OP7KZ2XZVqOZjAThES47hjGa
    ZOSxwpdi9xrnIDr+s/d5PbOxnX0XtNvFeqhyyIPj7FI9XOrtCtsYjB+NXQTcJQZlGyVpVF
    TTqnrVb/Mq3oQSeStuF4oPXDwH3oWlYvHSNam+jgs5UiLXxmFk4LthQHsVTY26JyOB7Tni
    gaTqSx+bC9A+DVQewDm8QQc0lMfG9Pr27qPgnrwPs6NIp72ubp6lVWSwMsDk58cYhAoYg8
    2EZ7nYa1/iq4WBzvbX+RsnqCZDOmf6sVib2/bwEz5rSIYbehVFhhkui8CKyMcIN5d2zksQ
    KfPpsGnYcidTFzMurNXzffDv5j4z1x37sWFIPinUrC4U4BGZzlDMcP/51sUg
X-ME-Proxy: <xmx:QVuxau20FE2KXcKVX8Kj7yaRBQNe-6jdW3-z6B0Gl2YJzKEoFJPjXw>
    <xmx:QVuxarmelWeufT1RA5Sua8GdBTuPh2yKrXIUZ1qdZYttUe-gyIZBUQ>
    <xmx:QVuxaj1oAI4oJfhj7z5dPwfOEQENof2sSkNsX2xUkL8rI9uZOKzHEg>
    <xmx:QVuxaij3e-1bDlt7IpPqgHWdjKse2jBrfAXwG4_uDOfimIxqDeenig>
    <xmx:QVuxapVvdNvHZDByOswJUsJ16qc8ujprXn-Hb7i1RXjkFhnyN-kIui37>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E189CF8008B; Mon, 21 Sep 2026 12:28:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AtmlxWozq_rN
Date: Mon, 21 Sep 2026 19:28:26 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <43688c97-deef-477d-8e6c-f293ecccd37a@app.fastmail.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging to the
 device owned by this driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_172905_584983_09A7F073 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, Sep 21, 2026, at 14:23, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath11k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.

Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Tested-on: 2x WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

That's from the new rebased patches, v2, applied with git am.

Again, I picked the entire QRTR from net-next/main after your changes,
and backported the ath11k and ath12k changes to 6.6.157 kernel. The
conflicts in ath11k and ath12k are really simple to resolve. The QRTR is
better to take as-is, as it's a large and substantially modified piece
of code, and backporting could risk different behavior.

Unfortunately, it seems I'm locked to 6.6 kernel until I manage to boot
a newer kernel. I tested 6.12 series and my perfectly valid gzipped
initrd ext2 file system is recognised as gzipped, but mounting the root
from /dev/ram0 fails due to -EBUSY. Why this happens with 6.12.x but not
6.6.157 is a mystery to me. Prompting two AI models didn't help, they
keep on just repeating the same useless points. So I have to resort to
heavier weapons, printk and maybe even git bisect.

So, because 6.6 kernel in our CPU doesn't work with ath12k due to lack
of interrupts and I can't boot a newer kernel yet, you'll have to either
find someone with two ath12k cards, or just accept to test the ath12k
change with a single card and hope for the best.

My understanding is that 6.12 would support just 1 interrupt in ath12k.
If I could only boot it, that is.

BR, Juha-Matti

