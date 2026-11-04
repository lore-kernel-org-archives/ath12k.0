Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF0D606D807
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LiRjbn5W;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=eWQ7mfrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bxDqAKgTAkYSPEQNYEQWZWkEe4Zni/C9MJY8rPfAnEk=; b=LiRjbn5W4BW2LajoCh8Tuhg6Wq
	7NJFXMhGH5HIBx+sgPw2Nu1LSXpXK64M/UQv9CXv9xboHhzITTIkUeoomN5UU40Y/daKkQj7q2Gdh
	Au1cQOS+tWmUAGu301ex+0gloXQKemKKkKw5COtlBHanS3nh4VjbBZe5+Hu3eHkOoXTvX/YUlPmZa
	A854ZhzE8ivcfoXhvY/r/OWm48NhrQkBhNaKXeEsFeOwBy/QQCV2E2bza3XzpBLV3qWu2kqTeHCvf
	GaVFh2iRY5FFlh6p9H0UQeHX4CSox7NHWPtHEa1qz7kUReqFpEk4ja6Ruf29LB9YkZtWsAUeOdeQk
	kkBUBTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeMG-000000067pZ-3Z5G;
	Wed, 04 Nov 2026 17:01:08 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeME-000000067oS-3FVA
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 17:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793811661; x=1794070861;
	bh=bxDqAKgTAkYSPEQNYEQWZWkEe4Zni/C9MJY8rPfAnEk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eWQ7mfrzLmdGTkpMhVNvt9mmweLIEwQJPa8STQ6I/XIjSuhEcHLp12WGCmPn9eeww
	 yr1JmqrKM3VPXKjgNYvo0dHq+xmRi1kZ4dOAlJRoAg7c8PEJCz3rj81vHJuTD0ZxoP
	 ypvq4VyFbaRfsuHs6mrBoFHN9rTXWnRZZ7DTJlQwEXnHHmBc701aUwMleV53nyDWso
	 2pKWVdW8Ezw0d8bw8mavQi8UYIFXji9I1odGJpJfOGqgu849x6VUyWWsXlkSaS5raF
	 /xNATqC7tbS1NlUXiErvjkW0uyqsMQa3fY1cxUDsd2XKwKFKKgoy3rApzM7NcBr33J
	 k9tNvClFGjf/Q==
Date: Wed, 04 Nov 2026 17:00:55 +0000
To: ath12k@lists.infradead.org
From: Birk Skyum <birk.skyum@pm.me>
Cc: Jeff Johnson <jjohnson@kernel.org>
Subject: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
Message-ID: <179381165259.84724.9229191626653570162@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: b99f16b365988d846cf6a3f7cefc0304deae972d
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090106_978212_857690BD 
X-CRM114-Status: UNSURE (   4.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeff,

The ASUS Zenbook A16 (Snapdragon X2) comes up without Wi-Fi because its
QCC2072 card, 105b:e14f, has no board-2.bin entry. Qualcomm's Windows
drivers list eleven more QCC2072 and WCN7850 cards that linux-firmware
has no entry for. For each of them, the driver's INF sets the same
BDFileName as for cards linux-firmware already lists, and those cards
share one record in board-2.bin. Could these cards get entries
pointing at those records?

QCC2072 (17cb:1112), bdwlan_qcc2072_1p0_ncm820A.elf, the record
linux-firmware has for 105b:e15a (qmi-board-id 24):

  105b:e14b, 105b:e14c, 105b:e14f, 105b:e159, 17aa:e14e, 103c:8ef3

WCN7850 (17cb:1107), bdwlan_wcn785x_2p0_ncm865a.elf, the record for
105b:e0eb, 105b:e129, 17aa:e115 and 1eac:8001 (qmi-board-id 255):

  105b:e13d, 1a3b:6570, 1a3b:6571, 1a3b:6572

WCN7850 (17cb:1107), bdwlan_wcn785x_2p0_ncm825.elf, the record for
14cd:9618, 105b:e0f3 and most other NCM825A cards (qmi-board-id 255):

  1a3b:6580, 1a3b:6581

The INFs are from qcwlancol8480 00685.13804.00110 and qcwlanhmt8480
00685.13804.00060 (X2), and qcwlancol8380 and qcwlanhmt8380
1.0.4516.4000 (X1), in ASUS's driver packages for the Zenbook A16
(UX3607OA) and the Zenbook A14 (UX3407QA). The board IDs are the ones
linux-firmware's entries for each family use, since I haven't seen these
cards' own logs. You'll know better whether the modules report the same,
and I can get the A16's log if that helps.

Thanks,
Birk


