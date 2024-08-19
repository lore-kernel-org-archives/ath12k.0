Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCADC3DA4A
	for <ath12k@archiver.kernel.org>; Mon, 19 Aug 2024 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:
	Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W0LOqIz7+N6pnq6QyKg3D4HBaTYUsXdBuINnNgrpXZI=; b=QFgKGRg+TAyYk0
	/h/HM8jdFrAo3BAT4ZJchAHcWkJzU8n7foIg+5nyYEBNRIDh1PDEV9E9wCiOp1AzrUYMicxvKqiJa
	HTxQIj8WWAdo4uHxHKyYwHUAWn+ig4MsRT2MNTedkDsxun7vMF68lc0utWNtV5gWc2MHiFa738KxS
	uHfB86OmX9XgPcISezCLmQaVsDJPZqwSf3Ag862Vy2Xd+KlXnwMMx4tn/VaICWUMwMrm32sqQ1RKm
	A+2dA0OhcFxLu7L6GpNhvypDz6m4+ynFC4xS6sMuJkcTBC8e+L5iXrEZ4MJVi/8Wj3nGv96qoDf+6
	lteSQpBFoaz6PBGR1m8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyTd-00000000v6g-2Ls2
	for ath12k@archiver.kernel.org;
	Mon, 19 Aug 2024 09:15:01 +0000
Received: from smtp-bc0d.mail.infomaniak.ch ([2001:1600:7:10::bc0d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyTa-00000000v3M-1MyH
	for ath12k@lists.infradead.org;
	Mon, 19 Aug 2024 09:15:00 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WnRkh4fdnzgv2
	for <ath12k@lists.infradead.org>; Mon, 19 Aug 2024 11:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellisys.com;
	s=20191114; t=1724058892;
	bh=W0LOqIz7+N6pnq6QyKg3D4HBaTYUsXdBuINnNgrpXZI=;
	h=Date:Subject:From:Reply-To:To:From;
	b=TMLHC6fXMCM7XA3SUHlTSesDVWyuV/i1cfcwEM6OBRLUS1sXwc+s/l+YKrgRRKu/t
	 GmGVtvSPa8qj2/QfBgHWmSHS7DMiWVBtlS7QwCnqwpbgfTT5XKb4GjLqBo53NJUJ/P
	 n/yFScAfof+U5yEXh9kl55nsWN5sXqNh6+mjqnCg=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WnRkh1xW8zwmq
	for <ath12k@lists.infradead.org>; Mon, 19 Aug 2024 11:14:52 +0200 (CEST)
Message-ID: <a92fb3ec6dabea4445a8a4d3fe136b1d@mail.infomaniak.com>
Date: Mon, 19 Aug 2024 11:14:52 +0200
Subject: ath12k: WCN7851 and QCN9274 monitor mode not working
From: Florian Schmidt <florian.schmidt@ellisys.com>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-WS-User-Origin: eyJpdiI6IlNJVFRvUTlvY0U0YWRpQUdhMUFuekE9PSIsInZhbHVlIjoiNHRxRnUwNkJFRUEraVUzd2Y5L2RCdz09IiwibWFjIjoiYmI0MGZhNDg2OGEzOTNjYjRmNWRhMDQzNmY4ZDkzNmJmMmQ2ZDVkNzZlMTBjYzQyOWI3ZWFiYTAxOTc3Y2I3OSIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IlVYZ0lRbXZRdnkzdlN4VURGRkYzTXc9PSIsInZhbHVlIjoiQ2p4aXRmRWR3bXpoMXpldWhVWC9MUT09IiwibWFjIjoiZDRlMDgxNzI4MWQwNjFiMGQ2N2U1NDJmN2UyZTQ0MzY3OThkMzgyNmViYjZhZDhiZTRhNDc0ZDk1NWRhYzdjNiIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.738)
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_021458_622898_5C6E535D 
X-CRM114-Status: UNSURE (   5.22  )
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
Reply-To: Florian Schmidt <florian.schmidt@ellisys.com>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

I am trying to use ath12k in monitor mode with cards WCN7851 and QCN9274 wi=
thout success.

When switching the interface to monitor, iw always fail with the following =
response:
command failed: Operation not supported (-95)

But ''iw phy show=E2=80=99=E2=80=99 reports that the interface support moni=
tor mode.

I tried with many kernels, using todays firmware from the ath12k-firmware r=
epository, the 6.10.5 kernel and the ath-pending kernel and always get the =
same result.

Is there any way to get monitor mode to work on Qualcom WiFi 7 chips?

Thank you.

