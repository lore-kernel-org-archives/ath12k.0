Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F525C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3UskMR1traizMLSAbf0Ymv0Cf8iD3XyS0kBXp39G0No=; b=XMEiG71EovC57VbHJUOYIsAg1B
	nqgAaCTS5kFgDMkN/e/tcCgdDBGHQZP81drZDbUkCRou4/YZ67tFUlhyvYZ+deQHnVhJRwa9KGwR9
	Tk76U2Scf38GOcRO/lwXP62kOryjJptCOpVZBSW9axFC2wxSIh8F7rgCqKvQQ4hX1++PD2m3dqBYC
	UYNIf9OjMUntdB8BN7e4uT/F+fhLmq5YC2mH3QsKiZYJAO+Rt4B5mxUV/0u+tKJ864oquc47Dll4G
	VwpyWJ8zpSKn4uVleEJNJ+RzN5qdvvqgm++6duemh/lcwbOHg5l9KAv+jqrGGXbs/fshXN+6kQ2JZ
	HT0pYMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LwS-00000005G52-0XYt;
	Tue, 15 Sep 2026 05:42:52 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LwN-00000005G3f-2xcH;
	Tue, 15 Sep 2026 05:42:50 +0000
Received: from mandelbrot.. (xdsl-83-150-90-33.nebulazone.fi [83.150.90.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkWBF1QsTz49Q71;
	Tue, 15 Sep 2026 08:42:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789450951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3UskMR1traizMLSAbf0Ymv0Cf8iD3XyS0kBXp39G0No=;
	b=AhgYYYj1HolsyjT542m4kqio7dwujo+6S8InQeIMAdEwYH0MKjDaw2irhG9Haagy1pEmlr
	o8d3/kU1CEVZFPj01X2SYg24lfUHvviGCvDgfy0qO13vLWSF7yW39mDiprPsu5pFRE+wY0
	fH9fjeNtp29bTl3AlncoaRHC2dFyJ5c3zsnQuCbxJCoR40kO3UmUiM9EazRh3exqzgB7gK
	kHtjgEWZN16fakMtUmqAHlaE0NxK9ayU69xSH4I/kZsfcg6uycHPZ5464fE3xHCpMw39G0
	12C0NL74UBhS24EIOxOrdTDydWC4jEh1Wdh9uB425BNBfRJs98f8TwjYYTIXTg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789450951;
	b=EGfAFZXrjLp9GM8yF5UAQM2H0fEg9xmTTlLNQMl+fPfKUIUrldHEksetOXT5E+8d5KBw58
	vQHpRKj7ONfPnmL8rHvhGUYr8a8dYh64VxDcSYTJuVWDdWMLAXcQU1yOq/+aPoA/msMIqF
	UulxpVTg3ikXgMb67jH8HksuoidJe+QoJl9WxdpNze/shGxbQDh2bI+JubBFaUb+kjBTF7
	FJzrgRClyxI9Y66tNd6YQECvLnN44BBoDU0Z+RqSa91G/LrivBlpMZFqJv5blFfBE2PYHS
	lA0Y0IDgh2i/rCMnxTZVjcyxRjOJpyjT/52jvJ7otGwcT/f4aRPFZH8d6HSBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789450951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3UskMR1traizMLSAbf0Ymv0Cf8iD3XyS0kBXp39G0No=;
	b=j3rw2MDFLcYp/hY4EvcOmkSOrC3sNmZoDqkazmpRWoxz8tM/7cHZhX91KKKruTzcLx4IId
	iO6xdOFrm8Oz7oj5Zl85UH2cPhxjIDBloOxeL3Ba5bU9ifucVnEf46e0LQ4LUd5yhZTCKb
	bQ3JO3KCQRL6S7H8GGyR7w5L+UwPl8cBV6dVbM1SddeKXNe9UKrTAxgllluIY1gsD1uP0y
	mpmnt1PYV1HjUkxgenJpR/KQLBvMTqGjYE7f/bf/6eSk1HqXWdyi6tw+RQQu91YynzsOq9
	Oh4sp5uqkhs/gHBS/ACokBEYV473/Swz5J1GQux8vNW+RIzxmePThhilZeGV5w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
From: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
To: Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>,
	Denis Kenzior <denkenz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v7 00/15] QRTR Multi-endpoint support
Date: Tue, 15 Sep 2026 08:41:52 +0300
Message-Id: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224248_110570_F10FB9A3 
X-CRM114-Status: GOOD (  30.48  )
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

Hello,

First, I would like to thank Denis Kenzior and Mihai Moldovan for
initially creating this patchset. Without their efforts, there wouldn't
be any progress towards supporting multiple identical ath11k or ath12k
modules on a single Linux host.

As you may know, if you put two identical Qualcomm Atheros ath11k or
ath12k WLAN modules on the same Linux host, they will conflict and
neither works. This is a massive issue in routers, and to solve it, we
need QRTR multi-endpoint support.

I contacted Mihai Moldovan who posted v5 and he said he's been busy and
can't provide an estimate of when he'll post v6. So I picked up his
work, ported it over ath-next and solved the issue of cramming two
32-bit numbers into an unsigned long that can be 32 bits on a 32-bit
architecture. Mihai said he doesn't have any corporate backing and
doesn't care who implements multi-ath11k/ath12k support as long as it
"just works". Since it's been over a year from the previous activity and
since Mihai has been and is busy and said he doesn't care who eventually
implements this, I decided to "steal" the responsibility of posting a v6
to myself since I fortunately have corporate backing. If Mihai so
decides, I'm willing to hand over this patchset back to him.

Some of the patches may need dropping/squashing. For example, "fit node
ID + port number combination into unsigned long" fixes one bug on 32-bit
architectures but introduces another. This needs careful review. I tried
to adjust the behavior to my tastes in "use only low 16 bits of
node/port in 32-bit systems", and this needs careful review, too. Both
of these are candidates for dropping from this patch series.

Furthermore, "validate msglen before ctrl_pkt use", although it seems to
fix a real bug, seems to be orthogonal to this patchset, and could be a
candidate for posting separately.

Also, "limit endpoint range to 16 bits on 32-bit machines", "use nid
modulo 65536 in 32-bit lookups" and "solve the 32-bit unsafe use in
endpoints" are candidates for squashing together. I didn't squash them
yet, since I want to keep my options open at this point, to be able to
easily adapt to any possible code review comments such as squashing or
dropping commits.

Someone could complain that using a "radix tree of radix trees" approach
on 64-bit machines is overkill since a single 64-bit key is enough.
However, this doesn't work on 32-bit machines, and having entirely
different code on 32-bit and 64-bit machines would be a testing
nightmare.

I have tested qrtr with all of these changes, and with Mihai Moldovan's
original and my refined patches to actually have two identical ath11k or
ath12k modules on the same system. Our limited CPU has issues with
ath12k, so I have instead tested it with two identical ath11k modules.
However, Mihai Moldovan created the ath11k/ath12k patchset in a somewhat
non-optimal way, leaking memory in some use cases, with an O(n)
algorithm for looking up the endpoint id where n is the amount of leaked
memory. So I had to rework that entire patchset. None of the leaky O(n)
stuff is in this patchset, and the subsequently posted ath11k/ath12k
patchset will have no memory leaks. Its v3 version is already available:
https://msgid.link/20260908093145.2492666-1-juha-matti.tilli@iki.fi

But first, before merging the multi-ath11k/ath12k patches, this first
patch set of QRTR multi-endpoint support needs to be merged.

Original description:

The current implementation of QRTR assumes that each entity on the QRTR
IPC bus is uniquely identifiable by its node/port combination, with
node/port combinations being used to route messages between entities.

However, this assumption of uniqueness is problematic in scenarios
where multiple devices with the same node/port combinations are
connected to the system.  A practical example is a typical consumer PC
with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
each device could potentially have the same node identifier set.  In
such cases, the current QRTR protocol implementation does not provide a
mechanism to differentiate between these devices, making it impossible
to support communication with multiple identical devices.

This patch series addresses this limitation by introducing support for
a concept of an 'endpoint.' Multiple devices with conflicting node/port
combinations can be supported by assigning a unique endpoint identifier
to each one.  Such endpoint identifiers can then be used to distinguish
between devices while sending and receiving messages over QRTR sockets.

The patch series maintains backward compatibility with existing clients:
the endpoint concept is added using auxiliary data that can be added to
recvmsg and sendmsg system calls.  The QRTR socket interface is extended
as follows:

- Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
  generated a particular message.  This auxiliary data is only reported
  if the socket was explicitly opted in using setsockopt, enabling the
  QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
  to facilitate this.  This requires QRTR clients to be updated to use
  recvmsg instead of the more typical recvfrom() or recv() use.

- Similarly, QRTR_ENDPOINT auxiliary data element can be included in
  sendmsg() requests.  This will allow clients to route QRTR messages
  to the desired endpoint, even in cases of node/port conflict between
  multiple endpoints.

- Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
  clients to bind to a particular endpoint (such as a 5G PCIe modem) if
  they're only interested in receiving or sending messages to this
  device.

NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
This follows the existing usage inside net/qrtr/af_qrtr.c in
qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
done deliberately in order to keep the changes as minimal as possible
until it is known whether the approach outlined is generally acceptable.

v7:
  - solved an embarrassing 32-bit compilation issue in one commit (that
    was already fixed in a subsequent commit leading me not to notice)
  - somewhat reformat a removable NOTE in some commit messages
  - update recipient list (Cc)

Link to v6:
https://msgid.link/all/20260901131934.225991-1-juha-matti.tilli@iki.fi

v6:
  - rebased against current ath-next
  - finally solve the 32-bit unsafe use by "radix tree of radix trees"
  - remove checks of node/port being in 16-bit range (they may not be)
  - Link to v5: https://msgid.link/cover.1754962436.git.ionic@ionic.de

v5:
  - fix typos in commit message
  - Link to v4: https://msgid.link/cover.1753720934.git.ionic@ionic.de

v4:
  - fixed issues found in previous review round:
    o lock without unlock
    o wrong return value
  - Link to v3: https://msgid.link/cover.1753312999.git.ionic@ionic.de

v3:
  - rebased against current master
  - fix checkpatch.pl warnings
  - fix overflow issues with unsigned long radix tree keys by using the
    upper half of the storage space for one element and the lower half
    of storage for the other element, making sure that the elements fit
    into their respective storage space
  - Link to v2: https://msgid.link/cover.1752947108.git.ionic@ionic.de

v2:
  - rebased against current master
  - fixed most issues found in first review round (see individual
    commits), minus the 32-bit long unsafe use

v1 link: https://msgid.link/20241018181842.1368394-1-denkenz@gmail.com

BR, Juha-Matti

Denis Kenzior (10):
  net: qrtr: ns: validate msglen before ctrl_pkt use
  net: qrtr: allocate and track endpoint ids
  net: qrtr: support identical node ids
  net: qrtr: Report sender endpoint in aux data
  net: qrtr: Report endpoint for locally generated messages
  net: qrtr: Allow sendmsg to target an endpoint
  net: qrtr: allow socket endpoint binding
  net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
  net: qrtr: ns: support multiple endpoints
  net: qrtr: mhi: Report endpoint id in sysfs

Juha-Matti Tilli (4):
  net: qrtr: use only low 16 bits of node/port in 32-bit systems
  net: qrtr: limit endpoint range to 16 bits on 32-bit machines
  net: qrtr: use nid modulo 65536 in 32-bit lookups
  net: qrtr: solve the 32-bit unsafe use in endpoints

Mihai Moldovan (1):
  net: qrtr: fit node ID + port number combination into unsigned long

 include/linux/socket.h    |   1 +
 include/uapi/linux/qrtr.h |   7 +
 net/qrtr/af_qrtr.c        | 461 ++++++++++++++++++++++++++++++++------
 net/qrtr/mhi.c            |  14 ++
 net/qrtr/ns.c             | 316 ++++++++++++++++----------
 net/qrtr/qrtr.h           |  14 ++
 6 files changed, 627 insertions(+), 186 deletions(-)

-- 
2.34.1


