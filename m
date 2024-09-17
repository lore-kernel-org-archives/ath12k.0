Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E17C3601E
	for <ath12k@archiver.kernel.org>; Tue, 17 Sep 2024 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVUnqQl1otB56tWozyUT3mx1nbMsedwcRSdKJkD3aIs=; b=EmdXXrNXCyzvHzi89/y9FmxpfD
	jRS2/NqeK5u9wUJvRxPgztGlSUYWzAGJN7ardvbkgXtTsq7ajqU6bufGGQsUvDBp5e74eICbVMRE7
	qDUtdPnOMSkiA9fo11Y/ay9sheXXtDE6q5HuaunlojImqSNWn6p35QofcF+t1uefsrHvO3mm9udpK
	P0wssOtjX6SNA8RlHr8288fhBqZFQzxoZ74g+v/EfIAOqRe9wdj4LkQOXKtjYAbe/DSj74kY5HcuW
	lJanCHc5b7RBiFC3P6OB//Zd/Ko5GNidGb4YT/MsM8DFbkRj6tuAfUVsfArJfI4P+GhFFTUoHfl0p
	CueIqPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZ52-00000006Iqm-2neE
	for ath12k@archiver.kernel.org;
	Tue, 17 Sep 2024 14:21:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZ50-00000006Ipy-146Z
	for ath12k@lists.infradead.org;
	Tue, 17 Sep 2024 14:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55D085C57B0
	for <ath12k@lists.infradead.org>; Tue, 17 Sep 2024 14:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2105EC4CECD
	for <ath12k@lists.infradead.org>; Tue, 17 Sep 2024 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582880;
	bh=+Qm3Qzcjpz85kDhjyCFW2v0lovNsKqVnrQ8toVOfC88=;
	h=From:To:Subject:References:Date:In-Reply-To:From;
	b=TLJL9bcaXQ/hzqVd4Ig7quoUwyEgqIKf5DYCGxt43iqnhxClNC5c9fWfgS0celsQB
	 DHyP3SWEbe1Atujm6rMWQAK4l9ERm9td6RpdkTT1OCdwNWi2sziMy+xtCGfAlcteMc
	 FgoTcPhzyq9NHSYTM0VWGvPSHdTgdkv2zHEw6R8bcRQoFf+Nf+vpRWJoaz56IBVjil
	 juCmrXzvAEB0pmjP5BpObQMeE6DnRbpD8VbgHDP/fQPgwWstbjt0tvyORBQ26eIVlQ
	 JIUJ343/mJqGar8GS/MVdNz2m12EYN3HB7dAjemUSg1BQks82+wf7rVC1vjdE3W5Cs
	 CHlNv23RHt+oQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: Re: ath12k-mlo branch ChangeLog
References: <87wmjbd3jc.fsf@kernel.org>
Date: Tue, 17 Sep 2024 17:21:18 +0300
In-Reply-To: <87wmjbd3jc.fsf@kernel.org> (Kalle Valo's message of "Mon, 16 Sep
	2024 18:25:11 +0300")
Message-ID: <87a5g6cqe9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_072122_452167_F9385F26 
X-CRM114-Status: UNSURE (   7.26  )
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

= ath12k-mlo-preparation branch =

ath12k-mlo-preparation-202409171414

	* initial import, based on tag ath-202408100722

= ath12k-mlo branch =

ath12k-mlo-202409171412

	* [ath12k: Add MLO WMI setup and teardown helper APIs] add 'wifi:'
	prefix to the title (Jeff)

	* [wifi: ath12k: modify link arvif creation and removal for MLO]
	spelling fixes (Jeff)

	* [wifi: ath12k: do not return invalid link id for scan link]
	spelling fixes (Jeff)

	* several fixes from Aditya to multiple different patches:

use arsta->addr instead of sta->addr where ever possible
fix WMI command formation during peer assoc
fix WMI command formation during peer create
fix lockdep_assert_held warning
fix deadlock issue during station connect
fix logical error while adding link sta
fix logical error while creating link sta
fix ML link peer delete
remove redundant clear keys logic
fix logic of ar->supports_6ghz usage during hw register

ath12k-mlo-202409161316

	* [wifi: ath12k: modify ath12k_mac_op_set_key for MLO] 'ret' is
	used uninitialized

	* [wifi: ath12k: modify link arvif creation and removal for MLO] 'ret' is uninitialized

	* [wifi: ath12k: add primary link for data path operations] ath12k_peer_create(): use rcu_deference() to fix warning:

drivers/net/wireless/ath/ath12k/peer.c:369:23: warning: incorrect type in assignment (different address spaces)

	* [lots of patches] fix most of the checkpatch warnings, except line length
	warnings. To workaround line length warning I temporarily changed
	--max-line-length to 110 in ath12k-check.

drivers/net/wireless/ath/ath12k/qmi.c:2020: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/qmi.c:2043: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2043: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2044: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2044: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2045: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2045: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2046: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2046: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2047: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2047: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2097: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2097: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2098: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2098: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2100: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2100: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2101: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2101: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2103: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2103: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2104: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2104: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2106: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2106: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2107: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2107: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2108: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2108: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2109: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2109: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2110: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2110: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2111: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2111: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2112: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2112: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2113: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2113: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2115: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2115: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2116: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2116: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2118: code indent should use tabs where possible
drivers/net/wireless/ath/ath12k/qmi.c:2118: please, no spaces at the start of a line
drivers/net/wireless/ath/ath12k/qmi.c:2120: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath12k/wmi.h:3732: Macros with complex values should be enclosed in parentheses
drivers/net/wireless/ath/ath12k/wmi.c:2302: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:3372: Please use a blank line after function/struct/union/enum declarations
drivers/net/wireless/ath/ath12k/mac.c:3394: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:4679: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:4681: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:4710: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:5570: Blank lines aren't necessary after an open brace '{'
drivers/net/wireless/ath/ath12k/mac.c:6094: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:7726: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:7990: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/mac.c:9680: Alignment should match open parenthesis

	* [wifi: ath12k: htt: remove value field from struct htt_tlv] new patch

ath12k-mlo-202409141647

	* Initial import

= ath12k-mlo-qcn9274 branch =

ath12k-mlo-qcn9274-202409171417

	* initial import, based on tag ath12k-mlo-202409171412

