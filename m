Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC6C3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJEp/+R2NbYzdvTgR3n3pTx/qrvAFRsnPIUfEr3I9W0=; b=3PHJSmcfEh0ZiFN40akgpPx+6o
	SjUSosalPouwxO2mBhdTwGTZkbLwKlJFMhstyETtNob5ZzZI7Tl4P9t2/ILZDJVmxEHTiSQVH7YNe
	rn8/ruqbKSQJj4clCBG++4nOVil7SoniwGcuk8FHrYwOEPbJ8oBcVyEg/XBKkmj9o3obT/JwU+dF7
	MChtC5dzKREQ+Cls16MNBh1pcZY1Bh5DSqGRwdZYE/hLJCajmPGtuK+SO4tVPH5NM5+QXRyD3/CKz
	TLllYCHLiEpfN1koYGK25932ixvzGc6ZGgbdBhQIndy4OUYyKfB540KoONzif0eUBI390I1ZAtEb4
	O16siBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDdf-00000004LqF-1Kb0
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 15:27:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDda-00000004Lpp-3MF4
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 15:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED1A2A42995
	for <ath12k@lists.infradead.org>; Mon, 16 Sep 2024 15:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19700C4CEC5
	for <ath12k@lists.infradead.org>; Mon, 16 Sep 2024 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726500457;
	bh=9m6ZSAT/MfENaOhDxEYgvuiQVbU8ylrajjNW2mi/uZY=;
	h=From:To:Subject:References:Date:In-Reply-To:From;
	b=eO6pZ71tlCPCwlyRb+L7eiuEOrc3yAAAoSll5YWLRskl/avc3bE7RbxVfYBLwiha2
	 /V63TSJgAlJAEgsod7Zb2Qp7NCYuSVrHKQcnC1AgIB0PES+gZY7sa/3YaCatKLU7gy
	 X+YVqEcgAOag+p+CDV3GXPePNYLXlmZbkaj7NlWldbXbnNNjnsrOmpP6MTZ9NwV4vK
	 j+J27xRBpaXXWRZ0kW5la+8eOmzSdT8KIle4DC10LVO2VMBR5ugPi2PjuEIiVLUqcb
	 A3okzKcQlIKG1f63CnPnzREiDGvbIwyHRokwBxPjiRDlAL/JXU4UpMevUzdICqVaRD
	 QPP87BXuhMSdw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: Re: ath12k-mlo branch ChangeLog
References: <87wmjbd3jc.fsf@kernel.org>
Date: Mon, 16 Sep 2024 18:27:35 +0300
In-Reply-To: <87wmjbd3jc.fsf@kernel.org> (Kalle Valo's message of "Mon, 16 Sep
	2024 18:25:11 +0300")
Message-ID: <87plp3d3fc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_082738_991434_C228B01B 
X-CRM114-Status: UNSURE (   6.63  )
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

= ath12k-mlo branch =

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


