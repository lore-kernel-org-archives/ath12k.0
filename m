Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B4CDB46F
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OViMVvFs1Rdaduz4uN6EcMeVo/mRomtYu9z3RnglZk=; b=QxkCan2vR+V88AFKeA+Lh8EBH8
	Zl2PJTbA8lunyZY2RH3saQjMzJR2QJPVXX0qqs8el8ZyjL60A8KkOYQRyEJXfJUrHgpTFBa5vch6W
	iKiCigMHdI/5jVH/S+FSJ9LOVwgeAVO5+4aAhjyr+a2X8rEbhd57ceY7zOU6IWNAmsXRFRNJg8r0v
	z0+cOlysd+L4K9U1RuNcTMiKnR0eBSdVjyjYAum2WkWXzdHObPvvY/NtXuR4iT/85rgXdeTN1f6W2
	hMN2LNLbT6zoOXCD7UQgh/BjgxKD+VR3ig2c0GlOqFKeLB4qgFOGtvHH5xMDfzRT9xqvw0eRCo3++
	EGybjrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0gP-00000006IIf-2H9n;
	Tue, 23 Jun 2026 12:56:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0gN-00000006IHx-1sZr
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 12:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782219408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OViMVvFs1Rdaduz4uN6EcMeVo/mRomtYu9z3RnglZk=;
	b=d5GxsJ24klIVlLuzvXkrmhBeXJxWkfySXez+tfok8ifPgly4Xv3v4eSsNO+87cYq7ipa6U
	MKYUHH6sZJPMzt9nePjh65kiaEhXFMfkx1uGM7M04qToBNBQBazPZdWJy5mGqU8Ffd+LwM
	jU74OsR//A57jD7adhwXGIv4uOTyiG0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-taBlM7F5OqCiYqbK9DozoA-1; Tue,
 23 Jun 2026 08:56:46 -0400
X-MC-Unique: taBlM7F5OqCiYqbK9DozoA-1
X-Mimecast-MFC-AGG-ID: taBlM7F5OqCiYqbK9DozoA_1782219404
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 295321956075;
	Tue, 23 Jun 2026 12:56:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.11])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B71551800598;
	Tue, 23 Jun 2026 12:56:38 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 23 Jun 2026 14:56:35 +0200
Message-ID: <20260623125637.1188867-1-jtornosm@redhat.com>
In-Reply-To: <r4jeqtx247iosfjdps6g4fqwtsdzine5qlgh33sdt4p6ktmaln@o725aolrpj4l>
References: <r4jeqtx247iosfjdps6g4fqwtsdzine5qlgh33sdt4p6ktmaln@o725aolrpj4l>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: se6zxRM9K1RUajZnM12hPLYLYVPjgAn-JU5eGkvIdcs_1782219404
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_055651_561787_00BFE89B 
X-CRM114-Status: UNSURE (   9.80  )
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

Hi Mani and Alex,

Thank you both for the guidance. 


I think your insight about the BAR-space reset mechanisms is a much better
approach to have a "real" reset. With that, I've implemented device-specific
reset functions based on the driver code Mani referenced:

WCN6855/WCN7850 WiFi (reset_qualcomm_wifi):
- Uses SoC global reset via BAR0 offset 0x3008
- Follows the sequence from ath11k_pci_soc_global_reset() /
  ath12k_pci_soc_global_reset() / ath11k_pci_sw_reset()
- Set reset bit → 10ms delay → clear reset bit → 10ms delay → verify link
  recovery (up to 5s)
- Includes MHI controller reset cleanup (offset 0x38) to clear SYSERR after SoC
  reset
- Both WCN6855 and WCN7850 share identical register offsets and reset sequence

SDX62/SDX65 modems (reset_qualcomm_modem):
- Uses MHI SoC reset via BAR0 offset 0xb0
- Follows the sequence from mhi_soc_reset() / mhi_pci_reset_prepare()
- Write reset request → 2s delay for reset completion

All implementations follow Alex's pattern: save command register ->
enable memory decode -> ioremap BAR -> perform reset sequence ->
iounmap -> restore command.
Testing results: The implementation shows successful reset behavior for both
WiFi and modem devices in VFIO passthrough scenarios.


Regarding the approach (quirks.c vs dedicated VFIO driver):

Mani, I understand your concern about potential conflicts with the native
drivers. I want to make sure I implement this correctly. Could you clarify
when you envision the conflict occurring? 
From what I can see, the native drivers call their reset functions directly
without using pci_try_reset_function(), so the device-specific reset in
quirks.c could be enough, but I may be missing some error recovery paths or
other scenarios.

Alex, Mani - would you prefer a dedicated VFIO PCI variant driver (similar
to mlx5-vfio-pci) to ensure the reset logic only runs in VFIO scenarios, or
is the quirks.c approach acceptable? I can implement either approach.

With the decision I will send v10.


Thank you again for all your help

Best regards
José Ignacio


